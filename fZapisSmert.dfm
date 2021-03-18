inherited fmZapisSmert: TfmZapisSmert
  Left = 416
  Top = 124
  ActiveControl = edSem
  Caption = #1047#1072#1087#1080#1089#1100' '#1072#1082#1090#1072' '#1086' '#1089#1084#1077#1088#1090#1080
  ClientHeight = 725
  ClientWidth = 871
  Constraints.MinHeight = 760
  Constraints.MinWidth = 887
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    00000B0B0B2B2424246924242466282828662C2C2C672F2F2F672D2D2D672E2E
    2E672E2E2E672C2C2C67272727662828286A101010573737370A000000003737
    371E838383D4AAAAAAFFB1B1B1FFC4C4C4FFD6D6D6FFE6E6E6FFEAEAEAFFEAEA
    EAFFE1E1E1FFD0D0D0FFC0C0C0FFB0B0B0FFA6A6A6FF2E2E2E80000000005757
    571B868686C99C9C9CFDA3A3A3FAB4B4B4FDC2C2C2FDD2D2D2FDDCDCDCFDDFDF
    DFFDDCDCDCFDCDCDCDFDB2B2B2FC9E9E9EFB989898FD3F3F3F6B000000000000
    00006B6B6BAC9A9A9AFD999999FAAAAAAAFEB7B7B7FEC5C5C5FFCECECEFFD4D4
    D4FFD7D7D7FEDCDCDCFED4D4D4FEA9A9A9FE7F7F7FFB67676747000000000000
    0000636363819B9B9BFF919191FC9F9F9FFCA9A9A9FBB8B8B8FEC2C2C2FFC9C9
    C9FFCDCDCDFDD0D0D0FCD8D8D8FBEFEFEFFF8D8D8DE93D3D3D18000000000000
    000054545419696969BA888888FE919191FFA2A2A2FFAFAFAFFFB9B9B9FEC0C0
    C0FECCCCCCFFD3D3D3FFD6D6D6FFC7C7C7EE5353536700000000848484020000
    000000000000686868033D3D3D296B6B6B64767676A8CCCCCCF6D4D4D4FEE5E5
    E5FEBEBEBED9999999976A6A6A522D2D2D180000000000000000000000000000
    0000828282010000000000000000000000002B2B2B05A5A5A5E4C9C9C9FED6D6
    D6FF5858586E0000000000000000000000008484840100000000000000000000
    00000000000000000000868686025C5C5C0666666699DBDBDBFECDCDCDFADADA
    DAFF989898D13C3C3C15888888037B7B7B010000000000000000000000000000
    0000000000007F7F7F010000000064646413B7B7B7DEE0E0E0FFD1D1D1FBD7D7
    D7FED5D5D5FF5D5D5D4000000000808080010000000000000000000000000000
    00000000000080808001000000002A2A2A52C6C6C6FBE0E0E0FDDCDCDCFDEEEE
    EEFCF0F0F0FE4B4B4BAD3939390B000000000000000000000000000000000000
    00000000000000000000000000003E3E3EA7C1C1C1FFEFEFEFFBEFEFEFFFBCBC
    BCFD7D7D7DFC696969FF21212150000000008080800200000000000000000000
    0000000000000000000000000000444444D3A7A7A7FEF4F4F4FD959595FE4B4B
    4BFE5B5B5BFB838383FF2D2D2D4D000000008181810200000000000000000000
    0000000000008282820100000000494949998D8D8DFF787878FC505050FE6363
    63FB919191FF7C7C7CE354545418000000007F7F7F0100000000000000000000
    0000000000007E7E7E01000000003E3E3E174E4E4EDC616161FF6D6D6DFB8686
    86FC939393ED4848485A00000000848484010000000000000000000000000000
    00000000000000000000000000000000000040404055676767D67E7E7EE77777
    77C037373758000000008A8A8A01000000000000000000000000000000008001
    00000001000000010000800100008001000080020000C0070000B83B0000E007
    0000D0170000D00F0000F00B0000F00B0000D00B0000D0170000F82F0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 703
    Width = 871
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 703
    Width = 871
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 871
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
        object TBItemRegPrSmert: TTBItem
          Caption = #1055#1086#1074#1090#1086#1088#1085#1086' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1087#1088#1080#1095#1080#1085#1086#1081' '#1089#1084#1077#1088#1090#1080
          OnClick = TBItemRegPrSmertClick
        end
      end
      object TBItemArxSpr: TTBItem [9]
        AutoCheck = True
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Hint = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 45
        OnClick = TBItemArxSprClick
      end
      object TBItemTalonUbit: TTBItem [13]
        Caption = #1058#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
        HelpContext = 1
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
        ImageIndex = 47
        OnClick = TBItemTalonUbitClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
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
      inherited TBItemSvidIspor: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 867
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 871
    Height = 653
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
      Width = 871
      Height = 33
      Align = alTop
      TabOrder = 0
      DesignSize = (
        871
        33)
      object lbNomer: TLabel
        Left = 8
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
        Left = 119
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
      object lbSvid: TLabel
        Left = 249
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
        Left = 413
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
        Left = 503
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
        Left = 842
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
      end
      object edNomer: TDBEditEh
        Left = 53
        Top = 4
        Width = 58
        Height = 26
        HelpType = htKeyword
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
        Left = 138
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
      object N_F_1: TDBCheckBoxEh
        Left = 642
        Top = 9
        Width = 106
        Height = 17
        Caption = '1-'#1099#1081' '#1101#1082#1079#1077#1084#1087#1083#1103#1088
        DataField = 'First_Ekz'
        DataSource = dsDokument
        DragCursor = crNo
        TabOrder = 5
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edSvid_Nomer: TDBEditEh
        Left = 431
        Top = 4
        Width = 66
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
      object cbProvDvig: TDBCheckBoxEh
        Left = 756
        Top = 9
        Width = 83
        Height = 17
        Caption = #1055#1088#1086#1074#1086#1076#1080#1090#1100
        DragCursor = crNo
        State = cbGrayed
        TabOrder = 6
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edDateSV: TDBDateTimeEditEh
        Left = 520
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
      object edSVID_SERIA: TDBLookupComboboxEh
        Left = 346
        Top = 4
        Width = 60
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
    object pc: TPageControl
      Left = 0
      Top = 33
      Width = 871
      Height = 620
      ActivePage = ts2
      Align = alClient
      MultiLine = True
      TabOrder = 2
      TabStop = False
      OnChange = pcChange
      object ts1: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 1'
        DesignSize = (
          863
          592)
        object Label1: TLabel
          Left = 3
          Top = 8
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
        object Label2: TLabel
          Left = 295
          Top = 8
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
        object Label3: TLabel
          Left = 507
          Top = 8
          Width = 72
          Height = 13
          Caption = '3. '#1054#1090#1095#1077#1089#1090#1074#1086' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 3
          Top = 62
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
        object lbDateR: TLabel
          Left = 7
          Top = 372
          Width = 115
          Height = 13
          Caption = '13. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 495
          Top = 62
          Width = 111
          Height = 13
          Caption = '6. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 3
          Top = 89
          Width = 94
          Height = 13
          Caption = '7. '#1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDateS: TLabel
          Left = 417
          Top = 89
          Width = 88
          Height = 13
          Caption = '8. '#1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 3
          Top = 239
          Width = 144
          Height = 13
          Caption = '10. '#1057#1084#1077#1088#1090#1100' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 7
          Top = 345
          Width = 167
          Height = 13
          Caption = '12. '#1044#1086#1082'. '#1087#1086#1076#1090#1074'. '#1092#1072#1082#1090' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbIDENTIF: TLabel
          Left = 189
          Top = 62
          Width = 93
          Height = 13
          Caption = '5. '#1048#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbVozr: TvchDBText
          Left = 265
          Top = 370
          Width = 41
          Height = 16
          AutoSize = True
          Color = clInfoBk
          DataField = 'VOZR'
          DataSource = dsDokument
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnGetText = lbVozrGetText
        end
        object Label108: TLabel
          Left = 12
          Top = 35
          Width = 61
          Height = 13
          Caption = #1055#1088#1086#1079#1074#1110#1096#1095#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label109: TLabel
          Left = 261
          Top = 35
          Width = 70
          Height = 13
          Caption = #1059#1083#1072#1089#1085#1072#1077' '#1110#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label110: TLabel
          Left = 498
          Top = 35
          Width = 83
          Height = 13
          Caption = #1030#1084#1103' '#1087#1072' '#1073#1072#1094#1100#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 18
          Top = 130
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
        object lbSM_OBL: TLabel
          Left = 64
          Top = 157
          Width = 86
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
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
          Top = 184
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
        object lbSM_Gorod: TLabel
          Left = 70
          Top = 211
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
          Left = 3
          Top = 113
          Width = 94
          Height = 13
          Caption = '9. '#1052#1077#1089#1090#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ImCondIN: TImage
          Left = 460
          Top = 59
          Width = 16
          Height = 16
          Transparent = True
          Visible = False
        end
        object edFamilia: TDBEditEh
          Left = 91
          Top = 2
          Width = 149
          Height = 26
          HelpType = htKeyword
          HelpContext = 888
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsGlyphEh
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
        object edName: TDBEditEh
          Left = 352
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
        object edOtch: TDBEditEh
          Left = 595
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
        object edDateR: TDBDateTimeEditEh
          Left = 136
          Top = 366
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
          TabOrder = 23
          Visible = True
          OnUpdateData = edDateRUpdateData
          EditFormat = 'DD/MM/YYYY'
        end
        object edPol: TDBComboBoxEh
          Left = 56
          Top = 56
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
          TabOrder = 6
          Visible = True
          OnChange = edPolChange
        end
        object edNATION: TDBLookupComboboxEh
          Left = 623
          Top = 56
          Width = 226
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
          TabOrder = 8
          Visible = True
        end
        object edGRAG: TDBLookupComboboxEh
          Left = 105
          Top = 83
          Width = 296
          Height = 26
          DataField = 'GRAG'
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
          TabOrder = 9
          Visible = True
        end
        object edDateS: TDBDateTimeEditEh
          Left = 523
          Top = 83
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
          TabOrder = 11
          Visible = True
          OnUpdateData = edDateSUpdateData
          EditFormat = 'DD/MM/YYYY'
        end
        object gbRogd: TGroupBox
          Left = 2
          Top = 390
          Width = 859
          Height = 71
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 14. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
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
            TabOrder = 0
            Visible = True
          end
          object edRG_B_OBL: TDBCheckBoxEh
            Left = 558
            Top = 18
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
            TabOrder = 5
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edRG_GOROD: TDBEditEh
            Left = 636
            Top = 40
            Width = 177
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'RG_GOROD'
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
            TabOrder = 3
            Visible = True
          end
          object edRG_OBL: TDBEditEh
            Left = 579
            Top = 13
            Width = 235
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'RG_OBL'
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
            TabOrder = 2
            Visible = True
          end
        end
        object edSmertPosl: TDBComboBoxEh
          Left = 162
          Top = 235
          Width = 311
          Height = 26
          DataField = 'SMERT_POSL'
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
        object gbGit: TGroupBox
          Left = 2
          Top = 461
          Width = 859
          Height = 127
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 15. '#1052#1077#1089#1090#1086' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1075#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          object Label15: TLabel
            Left = 22
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
          object Label25: TLabel
            Left = 470
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
          object Label26: TLabel
            Left = 124
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
          object Label27: TLabel
            Left = 470
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
            Left = 88
            Top = 75
            Width = 66
            Height = 13
            Caption = #1088#1081#1086#1085'  '#1075#1086#1088#1086#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbSOATO: TvchDBText
            Left = 288
            Top = 101
            Width = 462
            Height = 16
            Color = clBtnFace
            DataField = 'SOATO'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            OnGetText = lbSOATOGetText
          end
          object Label33: TLabel
            Left = 75
            Top = 103
            Width = 82
            Height = 13
            Caption = #1082#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label45: TLabel
            Left = 591
            Top = 75
            Width = 11
            Height = 13
            Caption = #1076'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label46: TLabel
            Left = 660
            Top = 75
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
            Left = 750
            Top = 75
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
          object Label10: TLabel
            Left = 365
            Top = 75
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
          object edGT_GOSUD: TDBLookupComboboxEh
            Left = 185
            Top = 15
            Width = 218
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
            TabOrder = 0
            Visible = True
          end
          object edGT_B_OBL: TDBCheckBoxEh
            Left = 557
            Top = 19
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
            TabOrder = 11
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edGT_GOROD: TDBEditEh
            Left = 635
            Top = 42
            Width = 177
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'GT_GOROD'
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
          object edGT_RNGOROD: TDBLookupComboboxEh
            Left = 185
            Top = 69
            Width = 170
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
            TabOrder = 6
            Visible = True
            OnNotInList = edGT_RNGORODNotInList
          end
          object edGT_B_GOROD: TDBLookupComboboxEh
            Left = 578
            Top = 42
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
            TabOrder = 3
            Visible = True
          end
          object edSOATO: TDBEditEh
            Left = 185
            Top = 97
            Width = 100
            Height = 26
            Hint = #1050#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
            TabStop = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'SOATO'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Visible = True
            OnClick = edSOATOClick
          end
          object edGT_OBL: TDBEditEh
            Left = 578
            Top = 15
            Width = 235
            Height = 26
            HelpKeyword = '<FULL>'
            DataField = 'GT_OBL'
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
          object edGT_RAION: TDBEditEh
            Left = 185
            Top = 42
            Width = 218
            Height = 26
            DataField = 'GT_RAION'
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
          object N_F_edBOMG: TDBCheckBoxEh
            Left = 761
            Top = 101
            Width = 61
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
            TabOrder = 12
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edGT_GOROD_R: TDBEditEh
            Left = 389
            Top = 69
            Width = 185
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
            TabOrder = 7
            Visible = True
          end
          object edGT_DOM: TDBEditEh
            Left = 606
            Top = 69
            Width = 40
            Height = 26
            HelpType = htKeyword
            HelpKeyword = 'DOM'
            DataField = 'GT_DOM'
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
          object edGT_KORP: TDBEditEh
            Left = 694
            Top = 69
            Width = 40
            Height = 26
            HelpType = htKeyword
            HelpKeyword = 'KORP'
            DataField = 'GT_KORP'
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
          object edGT_KV: TDBEditEh
            Left = 771
            Top = 69
            Width = 40
            Height = 26
            HelpType = htKeyword
            HelpKeyword = 'KV'
            HelpContext = 999
            DataField = 'GT_KV'
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
          object Button4: TButton
            Left = 24
            Top = 96
            Width = 33
            Height = 25
            Caption = 'ate'
            TabOrder = 13
            Visible = False
            OnClick = Button4Click
          end
          object btATE: TBitBtn
            Left = 164
            Top = 98
            Width = 17
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            Visible = False
            Glyph.Data = {
              76010000424D760100000000000036000000280000000A0000000A0000000100
              18000000000040010000000000000000000000000000000000007F7F7F7F7F7F
              0000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000000000008484847F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000000000000000008484847F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000000000000000000000008484847F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000000000000000008484847F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000000000008484847F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000000000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              0000008484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              8484847F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000}
          end
        end
        object gbPrichin: TGroupBox
          Left = 2
          Top = 261
          Width = 859
          Height = 73
          Anchors = [akLeft, akTop, akRight]
          Caption = ' 11. '#1055#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          DesignSize = (
            859
            73)
          object Label28: TLabel
            Left = 10
            Top = 21
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
            Left = 10
            Top = 48
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
          object ENG_edPrNep: TDBEditEh
            Left = 110
            Top = 15
            Width = 73
            Height = 26
            CharCase = ecUpperCase
            DataField = 'PR_NEP'
            DataSource = dsDokument
            EditButtons = <>
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnUpdateData = ENG_edPrOsnUpdateData
          end
          object ENG_edPrOsn: TDBEditEh
            Left = 110
            Top = 42
            Width = 73
            Height = 26
            CharCase = ecUpperCase
            DataField = 'PR_OSN'
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
            OnUpdateData = ENG_edPrOsnUpdateData
          end
          object ENG_edPrMesto: TDBEditEh
            Left = 75
            Top = 33
            Width = 17
            Height = 19
            CharCase = ecUpperCase
            DataField = 'PR_MEST'
            DataSource = dsDokument
            EditButtons = <>
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 4
            Visible = False
            OnUpdateData = ENG_edPrOsnUpdateData
          end
          object edPrNep_Name: TDBEditEh
            Left = 189
            Top = 15
            Width = 411
            Height = 26
            Hint = #1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1072' '#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            DataField = 'PR_NEP_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Limit = 20
            MRUList.Rows = 10
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edPrOsn_Name: TDBEditEh
            Left = 189
            Top = 42
            Width = 411
            Height = 26
            Hint = #1086#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1072' '#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            DataField = 'PR_OSN_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
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
          object edPrMesto_Name: TDBEditEh
            Left = 73
            Top = 41
            Width = 55
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PR_MEST_NAME'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            Enabled = False
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
          object BLR_edPrNep_Name: TDBEditEh
            Left = 607
            Top = 15
            Width = 242
            Height = 26
            Hint = #1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PR_NEP_NAME_B'
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
          object BLR_edPrOsn_Name: TDBEditEh
            Left = 607
            Top = 42
            Width = 242
            Height = 26
            Hint = #1086#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PR_OSN_NAME_B'
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
        object edFact: TDBEditEh
          Left = 197
          Top = 339
          Width = 660
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
          TabOrder = 21
          Visible = True
          OnEnter = edFactEnter
        end
        object N_F_cbOnlyGod: TDBComboBoxEh
          Left = 640
          Top = 86
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
            #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080'('#1090#1077#1082#1089#1090')')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          ParentFont = False
          TabOrder = 10
          Visible = True
          OnChange = N_F_cbOnlyGodChange
        end
        object N_F_cbOnlyGodR: TDBComboBoxEh
          Left = 322
          Top = 369
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
          TabOrder = 22
          Visible = True
          OnChange = N_F_cbOnlyGodRChange
        end
        object ENG_edIDENTIF: TDBEditEh
          Left = 302
          Top = 56
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
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object N_F_cbBelorus: TDBCheckBoxEh
          Left = 809
          Top = 4
          Width = 45
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
          TabOrder = 32
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = N_F_cbBelorusClick
        end
        object edDokKod: TDBComboBoxEh
          Left = 497
          Top = 235
          Width = 234
          Height = 26
          DataField = 'DOK_KOD'
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
        object BLR_edFamilia: TDBEditEh
          Left = 91
          Top = 29
          Width = 149
          Height = 26
          DataField = 'Familia_B'
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
        object BLR_edName: TDBEditEh
          Left = 352
          Top = 29
          Width = 126
          Height = 26
          DataField = 'Name_B'
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
        object BLR_edOtch: TDBEditEh
          Left = 595
          Top = 29
          Width = 155
          Height = 26
          DataField = 'Otch_B'
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
        object edSM_GOSUD: TDBLookupComboboxEh
          Left = 181
          Top = 124
          Width = 239
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
          TabOrder = 13
          Visible = True
        end
        object BLR_edSM_OBL: TDBEditEh
          Left = 467
          Top = 151
          Width = 239
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'SM_OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
          Visible = True
        end
        object edSM_GOROD: TDBEditEh
          Left = 257
          Top = 205
          Width = 163
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'SM_GOROD'
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
        object BLR_edSM_RAION: TDBEditEh
          Left = 467
          Top = 178
          Width = 239
          Height = 26
          DataField = 'SM_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 28
          Visible = True
        end
        object edSM_B_GOROD: TDBLookupComboboxEh
          Left = 181
          Top = 205
          Width = 64
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
          TabOrder = 16
          Visible = True
        end
        object edSM_OBL: TDBEditEh
          Left = 181
          Top = 151
          Width = 239
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'SM_OBL'
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
        object edSM_RAION: TDBEditEh
          Left = 181
          Top = 178
          Width = 239
          Height = 26
          DataField = 'SM_RAION'
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
        object cbSM_OBL: TDBCheckBoxEh
          Left = 161
          Top = 155
          Width = 16
          Height = 17
          AllowGrayed = True
          DataField = 'SM_B_OBL'
          DataSource = dsDokument
          TabOrder = 31
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbSM_OBLClick
        end
        object BLR_edSM_Gorod: TDBEditEh
          Left = 548
          Top = 205
          Width = 158
          Height = 26
          HelpKeyword = '<FULL>'
          DataField = 'SM_GOROD_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
          Visible = True
        end
        object edGosud_B: TDBLookupComboboxEh
          Left = 467
          Top = 124
          Width = 239
          Height = 26
          TabStop = False
          Color = clInfoBk
          DataField = 'SM_GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsStran
          ParentFont = False
          ReadOnly = True
          Style = csDropDownEh
          TabOrder = 30
          Visible = True
        end
        object edTextVozr: TDBEditEh
          Left = 473
          Top = 366
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
          TabOrder = 24
          Visible = False
        end
        object edTextDateS: TDBEditEh
          Left = 690
          Top = 83
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
          TabOrder = 12
          Visible = False
        end
        object BLR_edSM_B_GOROD: TDBLookupComboboxEh
          Left = 467
          Top = 205
          Width = 68
          Height = 26
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          DataField = 'SM_B_GOROD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsTypeGorod
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
          Visible = True
        end
        object edSM_TEXT: TDBEditEh
          Left = 431
          Top = 205
          Width = 15
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
          TabOrder = 34
          Visible = False
        end
        object BLR_edSM_TEXT: TDBEditEh
          Left = 720
          Top = 205
          Width = 15
          Height = 26
          DataField = 'SM_TEXT_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 35
          Visible = False
        end
      end
      object ts2: TTabSheet
        Caption = #1063#1072#1089#1090#1100' 2'
        ImageIndex = 1
        object pnTs2: TPanel
          Left = 0
          Top = 0
          Width = 863
          Height = 592
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            863
            592)
          object Label30: TLabel
            Left = 330
            Top = 264
            Width = 120
            Height = 13
            Caption = '22. '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1089#1076#1072#1095#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 16
            Top = 201
            Width = 205
            Height = 34
            AutoSize = False
            Caption = '21. '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1089#1076#1072#1095#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#13#10#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086' '#1083#1080#1095#1085#1086#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 16
            Top = 39
            Width = 105
            Height = 13
            Caption = '17. '#1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 16
            Top = 93
            Width = 82
            Height = 13
            Caption = '19. '#1047#1072#1103#1074#1080#1090#1077#1083#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 16
            Top = 12
            Width = 145
            Height = 13
            Caption = '16. '#1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 16
            Top = 66
            Width = 96
            Height = 13
            Caption = '18. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 16
            Top = 319
            Width = 71
            Height = 13
            Caption = '24. '#1054#1090#1084#1077#1090#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 16
            Top = 178
            Width = 20
            Height = 13
            Caption = '20. '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 318
            Top = 177
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
          object lbIzmen: TLabel
            Left = 7
            Top = 500
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
          object Label6: TLabel
            Left = 16
            Top = 293
            Width = 64
            Height = 13
            Caption = #1042#1086#1077#1085#1082#1086#1084#1072#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 40
            Top = 120
            Width = 59
            Height = 13
            Caption = #1076#1086#1082#1091#1084#1077#1085#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbMestoZ: TLabel
            Left = 7
            Top = 517
            Width = 225
            Height = 13
            Caption = #1052#1077#1089#1090#1086' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103' '#1089#1086' '#1089#1083#1086#1074' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lbDolgRuk: TvchDBText
            Left = 6
            Top = 446
            Width = 627
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
            Left = 6
            Top = 475
            Width = 627
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
          object Label5: TLabel
            Left = 40
            Top = 149
            Width = 133
            Height = 13
            Caption = #1087#1080#1089#1100#1084#1077#1085#1085#1086#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPrichNotDok: TLabel
            Left = 222
            Top = 233
            Width = 181
            Height = 13
            Caption = #1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085' '#1074' '#1089#1074#1103#1079#1080' '#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edRukov: TDBEditEh
            Left = 642
            Top = 441
            Width = 214
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
            TabOrder = 13
            Visible = True
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
            OnEnter = edRukovEnter
          end
          object edSem: TDBComboBoxEh
            Left = 222
            Top = 6
            Width = 230
            Height = 26
            HelpContext = 888
            DataField = 'SEM'
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
          object edWork: TDBEditEh
            Left = 222
            Top = 33
            Width = 631
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'WORK_NAME'
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
          object edObraz: TDBComboBoxEh
            Left = 222
            Top = 60
            Width = 230
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
            TabOrder = 2
            Visible = True
          end
          object edDecl: TDBEditEh
            Left = 222
            Top = 87
            Width = 632
            Height = 26
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
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edSdanDok: TDBEditEh
            Left = 287
            Top = 198
            Width = 569
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SDAN_DOK'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1044#1086#1082#1091#1084#1077#1085#1090
                Style = ebsEllipsisEh
                Width = 20
                OnClick = edSdanDokEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Visible = True
          end
          object edSdanVB: TDBEditEh
            Left = 467
            Top = 257
            Width = 388
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SDAN_VB'
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
          object edZametka: TDBEditEh
            Left = 101
            Top = 316
            Width = 755
            Height = 69
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            AutoSize = False
            DataField = 'ZAMETKA'
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
            WantReturns = True
            OnDblClick = TBItemEditMemoClick
          end
          object edSprav_Nomer: TDBEditEh
            Left = 222
            Top = 171
            Width = 74
            Height = 26
            DataField = 'SPRAV_NOMER'
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
            OnEnter = edSprav_NomerEnter
          end
          object edSprav_Date: TDBDateTimeEditEh
            Left = 361
            Top = 171
            Width = 130
            Height = 26
            DataField = 'SPRAV_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edIzmen: TDBEditEh
            Left = 89
            Top = 500
            Width = 768
            Height = 90
            HelpContext = 999
            Anchors = [akLeft, akTop, akRight, akBottom]
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
            TabOrder = 16
            Visible = True
            WantReturns = True
            OnDblClick = TBItemEditMemoClick
          end
          object N_F_edCopy: TDBCheckBoxEh
            Left = 9
            Top = 555
            Width = 70
            Height = 17
            Caption = #1050#1086#1087#1080#1103
            DataField = 'COPIA'
            DataSource = dsDokument
            Flat = True
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 17
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object gbMat: TGroupBox
            Left = 0
            Top = 389
            Width = 657
            Height = 46
            Anchors = [akLeft, akTop, akRight]
            Caption = ' '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1084#1072#1090#1077#1088#1080' ('#1079#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1076#1083#1103' '#1076#1077#1090#1077#1081' '#1076#1086' 1 '#1075#1086#1076#1072' ) '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 18
            object Label43: TLabel
              Left = 32
              Top = 22
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
              Left = 267
              Top = 22
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
              Top = 16
              Width = 110
              Height = 26
              DataField = 'MAT_DATER'
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
            object edMatSchet: TDBNumberEditEh
              Left = 508
              Top = 16
              Width = 33
              Height = 26
              DataField = 'MAT_SCHET'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxValue = 20.000000000000000000
              MinValue = 1.000000000000000000
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
          object N_F_cbVUS: TDBCheckBoxEh
            Left = 17
            Top = 262
            Width = 136
            Height = 17
            Caption = #1042#1086#1077#1085#1085#1086#1086#1073#1103#1079#1072#1085#1085#1099#1081
            DataField = 'VUS'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 19
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object N_F_edVB: TDBCheckBoxEh
            Left = 167
            Top = 262
            Width = 157
            Height = 17
            Caption = #1057#1076#1072#1085' '#1074#1086#1077#1085#1085#1099#1081' '#1073#1080#1083#1077#1090
            DataField = 'Vb'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edVoenkom: TDBLookupComboboxEh
            Left = 101
            Top = 288
            Width = 492
            Height = 26
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
            EditButtons = <
              item
                Glyph.Data = {
                  D6000000424DD60000000000000076000000280000000A0000000C0000000100
                  0400000000006000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                  0000800000000800000080EEEEEE0800000080EEEEEE0800000080EEEEEE0800
                  000080EEEEEE0800000080EEEEEE0800000080EEE0000800000080EEE0AA0800
                  000080EEE0A08800000080000008880000008888888888000000}
                Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
                Style = ebsGlyphEh
                OnClick = edVoenkomEditButtons0Click
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
                OnClick = edVoenkomEditButtons1Click
              end
              item
                Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1077#1085#1082#1086#1084#1072#1090' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
                ShortCut = 45
                Style = ebsPlusEh
                OnClick = edVoenkomEditButtons2Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsVoenkom
            ParentFont = False
            TabOrder = 11
            Visible = True
            OnChange = edVoenkomChange
          end
          object N_F_cbDublSpr: TDBCheckBoxEh
            Left = 506
            Top = 175
            Width = 127
            Height = 17
            Caption = #1044#1091#1073#1083#1080#1082#1072#1090' '#1089#1087#1088#1072#1074#1082#1080
            DataField = 'DUBL_SPR'
            DataSource = dsDokument
            TabOrder = 21
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object Button1: TButton
            Left = 488
            Top = 3
            Width = 75
            Height = 25
            Caption = 'Button1'
            TabOrder = 22
            Visible = False
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 592
            Top = 3
            Width = 75
            Height = 25
            Caption = 'Button2'
            TabOrder = 23
            Visible = False
            OnClick = Button2Click
          end
          object edIsSdanDok: TDBComboBoxEh
            Left = 222
            Top = 198
            Width = 57
            Height = 26
            DataField = 'IS_SDAN_DOK'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              #1044#1072
              #1053#1077#1090)
            KeyItems.Strings = (
              '1'
              '0')
            ParentFont = False
            TabOrder = 24
            Visible = True
            OnChange = edIsSdanDokChange
          end
          object N_F_edResh_Suda: TDBCheckBoxEh
            Left = 651
            Top = 175
            Width = 206
            Height = 17
            Caption = #1053#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
            DataField = 'RESH_SUDA'
            DataSource = dsDokument
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 25
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edDeclDok: TDBEditEh
            Left = 222
            Top = 114
            Width = 632
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'DECL_DOK'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1044#1086#1082#1091#1084#1077#1085#1090
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
            TabOrder = 4
            Visible = True
          end
          object edMestoZ: TDBEditEh
            Left = 249
            Top = 500
            Width = 606
            Height = 26
            HelpContext = 999
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MESTO_Z'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            Visible = False
          end
          object N_F_cbTypeSprav: TDBComboBoxEh
            Left = 39
            Top = 174
            Width = 169
            Height = 21
            TabStop = False
            DataField = 'TYPE_SPRAV'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Items.Strings = (
              #1042#1099#1076#1072#1085#1072' '#1089#1087#1088#1072#1074#1082#1072
              #1057#1087#1088#1072#1074#1082#1072' '#1085#1077' '#1074#1099#1076#1072#1074#1072#1083#1072#1089#1100)
            KeyItems.Strings = (
              '1'
              '2')
            ParentFont = False
            TabOrder = 26
            Visible = True
            OnChange = N_F_cbTypeSpravChange
          end
          object edSpec: TDBEditEh
            Left = 642
            Top = 470
            Width = 214
            Height = 26
            Anchors = [akTop, akRight]
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
            TabOrder = 14
            Visible = True
            OnCheckDrawRequiredState = edFamiliaCheckDrawRequiredState
            OnEnter = edSpecEnter
          end
          object edWriteDecl: TDBComboBoxEh
            Left = 222
            Top = 142
            Width = 635
            Height = 26
            DataField = 'TYPEREG'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edWriteDeclEditButtons0Click
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
          object edPrichNotDok: TDBEditEh
            Left = 422
            Top = 227
            Width = 434
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PRICH_NOT_DOK'
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
      end
      object tsSprav: TTabSheet
        Caption = #1040#1088#1093#1080#1074#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
        ImageIndex = 2
        object Label47: TLabel
          Left = 16
          Top = 39
          Width = 43
          Height = 13
          Caption = #1040#1076#1088#1077#1089#1072#1090
        end
        object Label48: TLabel
          Left = 16
          Top = 123
          Width = 31
          Height = 13
          Caption = #1053#1086#1084#1077#1088
        end
        object Label49: TLabel
          Left = 16
          Top = 152
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object Label50: TLabel
          Left = 16
          Top = 188
          Width = 120
          Height = 13
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090
        end
        object edAdresat: TDBEditEh
          Left = 72
          Top = 36
          Width = 684
          Height = 73
          HelpContext = 888
          AutoSelect = False
          AutoSize = False
          DataField = 'ARX_ADRESAT'
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
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
        object edNomerArxSpr: TDBEditEh
          Left = 72
          Top = 119
          Width = 121
          Height = 24
          DataField = 'ARX_NOMER'
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
        object edDateArxSpr: TDBDateTimeEditEh
          Left = 72
          Top = 148
          Width = 121
          Height = 24
          DataField = 'ARX_DATE'
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
        object edAddTextArx: TDBEditEh
          Left = 19
          Top = 207
          Width = 734
          Height = 97
          HelpContext = 999
          AutoSelect = False
          AutoSize = False
          DataField = 'ARX_TEXT'
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
          WantReturns = True
          WordWrap = True
          OnDblClick = TBItemEditMemoClick
        end
      end
      object tsSvid: TTabSheet
        Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
        ImageIndex = 4
        object Label77: TLabel
          Left = 12
          Top = 14
          Width = 91
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1080#1085'('#1082#1072')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 428
          Top = 14
          Width = 98
          Height = 13
          Caption = #1043#1088#1072#1084#1072#1076#1079#1103#1085'i'#1085'('#1082#1072')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 12
          Top = 108
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
        object lbDateS_Sv: TLabel
          Left = 525
          Top = 108
          Width = 111
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 29
          Top = 302
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
        object Label82: TLabel
          Left = 120
          Top = 335
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
        object Label83: TLabel
          Left = 131
          Top = 364
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
        object Label84: TLabel
          Left = 81
          Top = 398
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
        object Label85: TLabel
          Left = 12
          Top = 282
          Width = 81
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1089#1084#1077#1088#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 12
          Top = 168
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
        object Label95: TLabel
          Left = 12
          Top = 458
          Width = 116
          Height = 13
          Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1047#1040#1043#1057
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDateR_Sv: TLabel
          Left = 179
          Top = 108
          Width = 110
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 12
          Top = 76
          Width = 163
          Height = 13
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edName_Sv: TDBEditEh
          Left = 50
          Top = 39
          Width = 150
          Height = 27
          DataField = 'Name'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edFamilia_Sv: TDBEditEh
          Left = 124
          Top = 8
          Width = 150
          Height = 27
          HelpContext = 888
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edOtch_Sv: TDBEditEh
          Left = 223
          Top = 39
          Width = 150
          Height = 27
          DataField = 'Otch'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object BLR_edFamiliaB_Sv: TDBEditEh
          Left = 549
          Top = 8
          Width = 150
          Height = 27
          DataField = 'Familia_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object BLR_edNameB_Sv: TDBEditEh
          Left = 488
          Top = 39
          Width = 150
          Height = 27
          DataField = 'Name_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object BLR_edOtchB_Sv: TDBEditEh
          Left = 661
          Top = 39
          Width = 150
          Height = 27
          DataField = 'Otch_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object edPol_Sv: TDBComboBoxEh
          Left = 51
          Top = 100
          Width = 115
          Height = 27
          DataField = 'POL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object edDateS_Sv: TDBDateTimeEditEh
          Left = 655
          Top = 100
          Width = 120
          Height = 27
          DataField = 'DateS'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          Visible = True
          OnUpdateData = edDateSUpdateData
          EditFormat = 'DD/MM/YYYY      '
        end
        object N_F_cbOnlyGod_Sv: TDBComboBoxEh
          Left = 790
          Top = 104
          Width = 47
          Height = 21
          TabStop = False
          DataField = 'ONLYGOD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Items.Strings = (
            #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080
            #1043#1086#1076' '#1089#1084#1077#1088#1090#1080
            #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1089#1084#1077#1088#1090#1080
            #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080'('#1090#1077#1082#1089#1090')')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          ParentFont = False
          TabOrder = 11
          Visible = True
          OnChange = N_F_cbOnlyGod_SvChange
        end
        object edGosud_Sv: TDBLookupComboboxEh
          Left = 188
          Top = 296
          Width = 266
          Height = 27
          DataField = 'SM_GOSUD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsStran
          ParentFont = False
          Style = csDropDownEh
          TabOrder = 17
          Visible = True
        end
        object BLR_edOblB_Sv: TDBEditEh
          Left = 470
          Top = 328
          Width = 266
          Height = 27
          DataField = 'SM_OBL_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          Visible = True
        end
        object BLR_edGorodB_Sv: TDBEditEh
          Left = 535
          Top = 393
          Width = 200
          Height = 27
          DataField = 'SM_GOROD_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          Visible = True
        end
        object BLR_edRaionB_Sv: TDBEditEh
          Left = 470
          Top = 360
          Width = 266
          Height = 27
          DataField = 'SM_RAION_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          Visible = True
        end
        object BLR_edTypeGorodB_Sv: TDBLookupComboboxEh
          Left = 470
          Top = 393
          Width = 56
          Height = 27
          TabStop = False
          Alignment = taRightJustify
          DataField = 'SM_B_GOROD'
          DataSource = dsDokument
          DropDownBox.Rows = 15
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 25
          Visible = True
        end
        object edGorod_Sv: TDBEditEh
          Left = 254
          Top = 392
          Width = 200
          Height = 27
          DataField = 'SM_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          Visible = True
        end
        object edTypeGorod_Sv: TDBLookupComboboxEh
          Left = 188
          Top = 393
          Width = 56
          Height = 27
          Alignment = taRightJustify
          DataField = 'SM_B_GOROD'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dsTypeGorod
          ParentFont = False
          TabOrder = 20
          Visible = True
        end
        object BLR_edGosudB_Sv: TDBLookupComboboxEh
          Left = 470
          Top = 296
          Width = 266
          Height = 27
          TabStop = False
          Color = clInfoBk
          DataField = 'SM_GOSUD'
          DataSource = dsDokument
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          KeyField = 'ID'
          ListField = 'NAME_B'
          ListSource = dsStran
          ParentFont = False
          Style = csDropDownEh
          TabOrder = 22
          Visible = True
        end
        object edOBL_Sv: TDBEditEh
          Left = 188
          Top = 328
          Width = 266
          Height = 27
          Alignment = taLeftJustify
          DataField = 'SM_OBL'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          Visible = True
        end
        object edRAION_Sv: TDBEditEh
          Left = 188
          Top = 360
          Width = 266
          Height = 27
          DataField = 'SM_RAION'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
          Visible = True
        end
        object ENG_edPrOsn_Sv: TDBEditEh
          Left = 126
          Top = 161
          Width = 97
          Height = 27
          Hint = #1082#1086#1076' '#1087#1088#1080#1095#1080#1085#1099' '#1089#1084#1077#1088#1090#1080
          CharCase = ecUpperCase
          DataField = 'PR_OSN'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          Visible = True
          OnUpdateData = ENG_edPrOsnUpdateData
        end
        object edPrOsn_Name_Sv: TDBEditEh
          Left = 12
          Top = 192
          Width = 410
          Height = 83
          AutoSize = False
          DataField = 'PR_OSN_NAME'
          DataSource = dsDokument
          EditButtons = <
            item
              Style = ebsEllipsisEh
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          Visible = True
          WordWrap = True
        end
        object BLR_edPrOsn_Name_B_Sv: TDBEditEh
          Left = 442
          Top = 192
          Width = 410
          Height = 83
          AutoSize = False
          DataField = 'PR_OSN_NAME_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          Visible = True
          WordWrap = True
        end
        object edRukov_Sv: TDBEditEh
          Left = 188
          Top = 450
          Width = 266
          Height = 27
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <
            item
              Hint = #1042#1099#1073#1088#1072#1090#1100
              Style = ebsEllipsisEh
              OnClick = edRukov_SvEditButtons0Click
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
          Visible = True
        end
        object BLR_edRukovB_Sv: TDBEditEh
          Left = 470
          Top = 450
          Width = 266
          Height = 27
          HelpContext = 999
          DataField = 'Rukov_B'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 28
          Visible = True
        end
        object edDateR_Sv: TDBDateTimeEditEh
          Left = 303
          Top = 100
          Width = 120
          Height = 27
          DataField = 'DateR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = True
          OnUpdateData = edDateRUpdateData
          EditFormat = 'DD/MM/YYYY      '
        end
        object N_F_cbOnlyGodR_Sv: TDBComboBoxEh
          Left = 426
          Top = 104
          Width = 44
          Height = 21
          TabStop = False
          DataField = 'ONLYGOD_R'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
          TabOrder = 8
          Visible = True
          OnChange = N_F_cbOnlyGodR_SvChange
        end
        object N_F_cbPovtor: TDBCheckBoxEh
          Left = 736
          Top = 11
          Width = 87
          Height = 13
          Caption = #1055#1086#1074#1090#1086#1088#1085#1086#1077
          DataField = 'POVTOR'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edTextVozr_Sv: TDBEditEh
          Left = 303
          Top = 129
          Width = 128
          Height = 27
          Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
          DataField = 'TEXT_VOZR'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          Visible = False
        end
        object edTextDateS_Sv: TDBEditEh
          Left = 655
          Top = 129
          Width = 132
          Height = 27
          Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1077#1089#1083#1080' '#1076#1072#1090#1072' '#1089#1084#1077#1088#1090#1080' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1072
          DataField = 'TEXT_DATES'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          Visible = False
        end
        object Button3: TButton
          Left = 768
          Top = 447
          Width = 75
          Height = 25
          Caption = 'set'
          TabOrder = 30
          Visible = False
          OnClick = Button3Click
        end
        object N_F_cbTextPr: TDBCheckBoxEh
          Left = 264
          Top = 168
          Width = 329
          Height = 13
          Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1087#1088#1080#1095#1080#1085#1099' '#1089#1084#1077#1088#1090#1080
          DataField = 'PRINT_VOSSTAN'
          DataSource = dsDokument
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 31
          TabStop = False
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ENG_edIDENTIF_Sv: TDBEditEh
          Left = 190
          Top = 70
          Width = 187
          Height = 26
          CharCase = ecUpperCase
          DataField = 'LICH_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Visible = True
        end
      end
      object tsPovtor: TTabSheet
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        ImageIndex = 3
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 703
    Width = 871
  end
  inherited pnAdd: TPanel
    Width = 871
  end
  inherited dsDokument: TDataSource
    Left = 768
    Top = 314
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
    Left = 808
    Top = 210
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
    object DokumentDOK_KOD: TSmallintField [30]
      FieldName = 'DOK_KOD'
    end
    object DokumentDateR: TDateField [31]
      FieldName = 'DateR'
    end
    object DokumentRG_GOSUD: TIntegerField [32]
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_OBL: TStringField [33]
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField [34]
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRG_GOROD: TStringField [35]
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentGT_GOSUD: TIntegerField [36]
      FieldName = 'GT_GOSUD'
    end
    object DokumentGT_OBL: TStringField [37]
      FieldName = 'GT_OBL'
      Size = 30
    end
    object DokumentGT_RAION: TStringField [38]
      FieldName = 'GT_RAION'
      Size = 30
    end
    object DokumentGT_GOROD: TStringField [39]
      FieldName = 'GT_GOROD'
      Size = 30
    end
    object DokumentGT_GOROD_R: TStringField [40]
      FieldName = 'GT_GOROD_R'
      Size = 50
    end
    object DokumentSEM: TIntegerField [41]
      FieldName = 'SEM'
    end
    object DokumentWORK_NAME: TStringField [42]
      FieldName = 'WORK_NAME'
      Size = 100
    end
    object DokumentOBRAZ: TIntegerField [43]
      FieldName = 'OBRAZ'
    end
    object DokumentDECL_ID: TIntegerField [44]
      FieldName = 'DECL_ID'
    end
    object DokumentDECL: TStringField [45]
      FieldName = 'DECL'
      Size = 300
    end
    object DokumentSPRAV_NOMER: TStringField [46]
      FieldName = 'SPRAV_NOMER'
      Size = 15
    end
    object DokumentSPRAV_DATE: TDateField [47]
      FieldName = 'SPRAV_DATE'
    end
    object DokumentSDAN_DOK: TMemoField [48]
      FieldName = 'SDAN_DOK'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSDAN_VB: TMemoField [49]
      FieldName = 'SDAN_VB'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentZAMETKA: TMemoField [50]
      FieldName = 'ZAMETKA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentRUKOV: TStringField [51]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentSOATO: TStringField [52]
      FieldName = 'SOATO'
      Size = 10
    end
    object DokumentSM_B_RESP: TBooleanField [53]
      FieldName = 'SM_B_RESP'
    end
    object DokumentSM_B_OBL: TBooleanField [54]
      FieldName = 'SM_B_OBL'
    end
    object DokumentRG_B_RESP: TBooleanField [55]
      FieldName = 'RG_B_RESP'
    end
    object DokumentRG_B_OBL: TBooleanField [56]
      FieldName = 'RG_B_OBL'
    end
    object DokumentGT_B_RESP: TBooleanField [57]
      FieldName = 'GT_B_RESP'
    end
    object DokumentGT_B_OBL: TBooleanField [58]
      FieldName = 'GT_B_OBL'
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
    object DokumentMAT_SCHET: TSmallintField [81]
      FieldName = 'MAT_SCHET'
    end
    object DokumentMAT_DATER: TDateField [82]
      FieldName = 'MAT_DATER'
    end
    object DokumentVUS: TBooleanField [84]
      FieldName = 'VUS'
    end
    object DokumentRESH_SUDA: TBooleanField [85]
      FieldName = 'RESH_SUDA'
    end
    object DokumentVb: TBooleanField [86]
      FieldName = 'Vb'
    end
    object DokumentLICH_NOMER: TStringField [87]
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object DokumentARX_ADRESAT: TMemoField [88]
      FieldName = 'ARX_ADRESAT'
      BlobType = ftMemo
    end
    object DokumentARX_NOMER: TStringField [89]
      FieldName = 'ARX_NOMER'
      Size = 10
    end
    object DokumentARX_DATE: TDateField [90]
      FieldName = 'ARX_DATE'
    end
    object DokumentARX_TEXT: TMemoField [91]
      FieldName = 'ARX_TEXT'
      BlobType = ftMemo
    end
    object DokumentGT_B_RN: TBooleanField [94]
      FieldName = 'GT_B_RN'
    end
    object DokumentGT_RNGOROD: TStringField [95]
      FieldName = 'GT_RNGOROD'
      Size = 30
    end
    object DokumentONLYGOD: TSmallintField [96]
      FieldName = 'ONLYGOD'
    end
    object DokumentONLYGOD_R: TSmallintField [97]
      FieldName = 'ONLYGOD_R'
    end
    object DokumentVOZR: TSmallintField [98]
      FieldName = 'VOZR'
    end
    object DokumentVOENKOM: TIntegerField [99]
      FieldName = 'VOENKOM'
    end
    object DokumentSM_B_GOROD: TSmallintField [100]
      FieldName = 'SM_B_GOROD'
    end
    object DokumentRG_B_GOROD: TSmallintField [101]
      FieldName = 'RG_B_GOROD'
    end
    object DokumentGT_B_GOROD: TSmallintField [102]
      FieldName = 'GT_B_GOROD'
    end
    object DokumentPOLE_GRN: TIntegerField [103]
      FieldName = 'POLE_GRN'
    end
    object DokumentTYPEMESSAGE: TStringField [104]
      FieldName = 'TYPEMESSAGE'
      Size = 4
    end
    object DokumentTYPEREG: TSmallintField [105]
      FieldName = 'TYPEREG'
    end
    object DokumentSTATUS: TStringField [106]
      FieldName = 'STATUS'
      Size = 1
    end
    object DokumentIS_SDAN_DOK: TBooleanField [107]
      FieldName = 'IS_SDAN_DOK'
    end
    object DokumentDOK_TYPE: TSmallintField [108]
      FieldName = 'DOK_TYPE'
    end
    object DokumentDOK_SERIA: TStringField [109]
      FieldName = 'DOK_SERIA'
      Size = 7
    end
    object DokumentDOK_NOMER: TStringField [110]
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object DokumentDOK_DATE: TDateField [111]
      FieldName = 'DOK_DATE'
    end
    object DokumentDOK_ORGAN: TIntegerField [112]
      FieldName = 'DOK_ORGAN'
    end
    object DokumentDOK_NAME: TMemoField [113]
      FieldName = 'DOK_NAME'
      BlobType = ftMemo
    end
    object DokumentSPEC_B: TStringField [114]
      FieldName = 'SPEC_B'
      Size = 60
    end
    object DokumentRN_SM_B_GOROD: TStringField [115]
      FieldName = 'RN_SM_B_GOROD'
      Size = 10
    end
    object DokumentRN_RG_B_GOROD: TStringField [116]
      FieldName = 'RN_RG_B_GOROD'
      Size = 10
    end
    object DokumentRN_GT_B_GOROD: TStringField [117]
      FieldName = 'RN_GT_B_GOROD'
      Size = 10
    end
    object DokumentGT_DOM: TStringField [118]
      FieldName = 'GT_DOM'
      Size = 10
    end
    object DokumentGT_KORP: TStringField [119]
      FieldName = 'GT_KORP'
      Size = 7
    end
    object DokumentGT_KV: TStringField [120]
      FieldName = 'GT_KV'
      Size = 10
    end
    object DokumentTYPE_SPRAV: TSmallintField [125]
      FieldName = 'TYPE_SPRAV'
    end
    object DokumentDUBL_SPR: TBooleanField [126]
      FieldName = 'DUBL_SPR'
    end
    object DokumentBOMG: TBooleanField [127]
      FieldName = 'BOMG'
    end
    object DokumentSUD_SILA: TDateField [128]
      FieldName = 'SUD_SILA'
    end
    object DokumentEMPTY_PRICH: TBooleanField [130]
      DisplayLabel = #1055#1091#1089#1090#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1088#1090#1080
      FieldName = 'EMPTY_PRICH'
    end
    object DokumentDECL_DOK: TStringField [131]
      FieldName = 'DECL_DOK'
      Size = 200
    end
    object DokumentTEXT_VOZR: TStringField [132]
      FieldName = 'TEXT_VOZR'
      Size = 30
    end
    object DokumentTEXT_DATES: TStringField [133]
      FieldName = 'TEXT_DATES'
      Size = 30
    end
    object DokumentMESTO_Z: TMemoField [134]
      FieldName = 'MESTO_Z'
      BlobType = ftMemo
    end
    object DokumentDECL_IN: TStringField
      FieldName = 'DECL_IN'
      Size = 14
    end
    object DokumentPRICH_NOT_DOK: TStringField
      FieldName = 'PRICH_NOT_DOK'
      Size = 250
    end
    object DokumentLICH_NOMER_GIS: TStringField
      FieldName = 'LICH_NOMER_GIS'
      Size = 1
    end
    object DokumentATEID: TIntegerField
      FieldName = 'ATEID'
    end
    object DokumentSM_TEXT: TStringField
      FieldName = 'SM_TEXT'
      Size = 200
    end
    object DokumentSM_TEXT_B: TStringField
      FieldName = 'SM_TEXT_B'
      Size = 200
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 148
    Top = 153
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 804
    Top = 153
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 560
    Top = 146
  end
  inherited HistZAGS: TkbmMemTable
    Left = 512
    Top = 146
  end
  inherited dsSeria: TDataSource
    Left = 648
    Top = 338
  end
  inherited dsObl: TDataSource
    Left = 616
    Top = 338
  end
  object dsGragd: TDataSource [14]
    Left = 764
    Top = 137
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 552
    Top = 386
  end
  inherited dsPovtor: TDataSource
    Left = 728
    Top = 242
  end
  inherited dsRN: TDataSource
    Top = 322
  end
  inherited dsGorod: TDataSource
    Left = 720
    Top = 282
  end
  inherited dsRnGor: TDataSource
    Left = 720
    Top = 378
  end
  inherited dsTypeGorod: TDataSource
    Left = 688
    Top = 154
  end
  inherited ImGISUN: TImageList
    Top = 107
  end
  inherited dsVoenkom: TDataSource
    Top = 82
  end
  inherited dsRovd: TDataSource
    Left = 704
    Top = 82
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 640
    Top = 154
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 496
    Top = 130
  end
  inherited tbReshSud: TkbmMemTable
    Left = 776
    Top = 258
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 758
    Top = 384
  end
end
