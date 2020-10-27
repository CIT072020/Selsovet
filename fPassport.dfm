inherited fmPassport: TfmPassport
  Left = 394
  Top = 75
  ActiveControl = ENG_edLichNomer
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1072#1089#1087#1086#1088#1090
  ClientHeight = 695
  ClientWidth = 803
  Constraints.MinHeight = 733
  Constraints.MinWidth = 800
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 50
    Width = 803
    Height = 0
    Visible = False
  end
  inherited pnTable: TPanel
    Height = 1
    Align = alNone
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 803
    inherited TBToolbar: TTBToolbar
      object TBItemChoiceMen: TTBItem [5]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '
        ImageIndex = 2
        OnClick = TBItemChoiceMenClick
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      object TBItemTalonPrib: TTBItem [16]
        Caption = #1058#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1087#1088#1080#1073#1099#1090#1080#1103
        ImageIndex = 48
        OnClick = TBItemTalonPribClick
      end
      object TBItemTalonUbit: TTBItem [17]
        Caption = #1058#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
        Hint = #1042#1099#1087#1080#1089#1072#1090#1100' '#1090#1072#1083#1086#1085' '#1091#1073#1099#1090#1080#1103
        ImageIndex = 47
        OnClick = TBItemTalonUbitClick
      end
      object TBItemParPrint: TTBItem [22]
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1077#1095#1072#1090#1080
        Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1077#1095#1072#1090#1080
        ImageIndex = 105
        OnClick = TBItemParPrintClick
      end
      inherited TBSubmenuPar: TTBSubmenuItem [23]
      end
      inherited TBItemZAGS: TTBItem [24]
      end
      inherited TBItemShablon: TTBItem [25]
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem [26]
      end
      inherited TBItemAdresat: TTBItem [27]
      end
      inherited TBItemSprAkt: TTBItem [28]
      end
      inherited TBItemDeclSvid: TTBItem [29]
      end
      inherited TBItemOnlySvid: TTBItem [30]
      end
      inherited TBItemDolg: TTBItem [31]
      end
      inherited TBItemSvidIspor: TTBItem [32]
      end
      inherited TBItemSetUp: TTBItem
        Visible = False
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 799
        Top = 22
      end
    end
  end
  inherited sb: TScrollBox
    Width = 803
    Height = 623
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 2
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 803
      Height = 623
      ActivePage = tsMain
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072
        object Pn2: TPanel
          Left = 0
          Top = 62
          Width = 795
          Height = 247
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label21: TLabel
            Left = 520
            Top = 82
            Width = 19
            Height = 13
            Caption = #1055#1086#1083
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 155
            Height = 247
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 19
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
              Left = 8
              Top = 44
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
              Left = 8
              Top = 71
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
            object Label4: TLabel
              Left = 8
              Top = 98
              Width = 108
              Height = 13
              Caption = '4. '#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 8
              Top = 123
              Width = 114
              Height = 13
              Caption = '5. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 28
              Top = 142
              Width = 122
              Height = 13
              Caption = #1076#1077#1088#1077#1074#1085#1103','#1087#1086#1089#1077#1083#1086#1082','#1075#1086#1088#1086#1076
            end
            object Label7: TLabel
              Left = 28
              Top = 169
              Width = 30
              Height = 13
              Caption = #1088#1072#1081#1086#1085
            end
            object Label8: TLabel
              Left = 28
              Top = 194
              Width = 76
              Height = 13
              Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
            end
            object Label9: TLabel
              Left = 28
              Top = 219
              Width = 35
              Height = 13
              Caption = #1089#1090#1088#1072#1085#1072
            end
          end
          object gbRus: TGroupBox
            Left = 333
            Top = 0
            Width = 177
            Height = 247
            Align = alLeft
            Caption = ' '#1087#1086'-'#1088#1091#1089#1089#1082#1080' '
            TabOrder = 2
            object edFam: TDBEditEh
              Left = 11
              Top = 16
              Width = 156
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
            object edName: TDBEditEh
              Left = 11
              Top = 42
              Width = 156
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
              Left = 11
              Top = 68
              Width = 156
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
            object edGor: TDBEditEh
              Left = 11
              Top = 141
              Width = 156
              Height = 24
              DataField = 'GOR'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 3
              Visible = True
            end
            object edRn: TDBEditEh
              Left = 11
              Top = 167
              Width = 156
              Height = 24
              DataField = 'RN'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 4
              Visible = True
            end
            object edObl: TDBEditEh
              Left = 11
              Top = 192
              Width = 156
              Height = 24
              DataField = 'OBL'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 5
              Visible = True
            end
            object edStrana: TDBEditEh
              Left = 11
              Top = 218
              Width = 156
              Height = 24
              DataField = 'STRANA'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 5
              MRUList.Rows = 5
              ParentFont = False
              TabOrder = 6
              Visible = True
            end
          end
          object gbBel: TGroupBox
            Left = 155
            Top = 0
            Width = 178
            Height = 247
            Align = alLeft
            Caption = ' '#1087#1086'-'#1073#1077#1083#1086#1088#1091#1089#1089#1082#1080' '
            TabOrder = 1
            object BLR_edFamB: TDBEditEh
              Left = 10
              Top = 16
              Width = 156
              Height = 24
              DataField = 'FAMILIA_B'
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
            object BLR_edNameB: TDBEditEh
              Left = 10
              Top = 41
              Width = 156
              Height = 24
              DataField = 'NAME_B'
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
            object BLR_edOtchB: TDBEditEh
              Left = 10
              Top = 67
              Width = 156
              Height = 24
              DataField = 'OTCH_B'
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
            object BLR_edGorB: TDBEditEh
              Left = 10
              Top = 140
              Width = 156
              Height = 24
              DataField = 'GOR_B'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 4
              Visible = True
            end
            object BLR_edRnB: TDBEditEh
              Left = 10
              Top = 166
              Width = 156
              Height = 24
              DataField = 'RN_B'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 5
              Visible = True
            end
            object BLR_edOblB: TDBEditEh
              Left = 10
              Top = 192
              Width = 156
              Height = 24
              DataField = 'OBL_B'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 10
              MRUList.Rows = 10
              ParentFont = False
              TabOrder = 6
              Visible = True
            end
            object BLR_edStranaB: TDBEditEh
              Left = 10
              Top = 218
              Width = 156
              Height = 24
              DataField = 'STRANA_B'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MRUList.Limit = 5
              MRUList.Rows = 5
              ParentFont = False
              TabOrder = 7
              Visible = True
            end
            object edDateRogd: TDBDateTimeEditEh
              Left = 10
              Top = 93
              Width = 126
              Height = 24
              DataField = 'DATE_ROGD'
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
          end
          object gbLatin: TGroupBox
            Left = 520
            Top = 0
            Width = 196
            Height = 69
            Caption = ' '#1083#1072#1090#1080#1085#1080#1094#1072' '
            TabOrder = 3
            object ENG_edFamilia_Engl: TDBEditEh
              Left = 12
              Top = 16
              Width = 171
              Height = 24
              DataField = 'FAMILIA_ENGL'
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
            object ENG_edName_Engl: TDBEditEh
              Left = 12
              Top = 41
              Width = 171
              Height = 24
              DataField = 'NAME_ENGL'
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
          object edPol: TDBComboBoxEh
            Left = 552
            Top = 77
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
            Items.Strings = (
              #1052#1091#1078#1089#1082#1086#1081
              #1046#1077#1085#1089#1082#1080#1081)
            KeyItems.Strings = (
              #1052
              #1046)
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
        end
        object Pn5: TPanel
          Left = 0
          Top = 511
          Width = 795
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 795
            Height = 81
            Align = alClient
            Caption = ' 9. '#1040#1076#1088#1077#1089' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              795
              81)
            object Label11: TLabel
              Left = 16
              Top = 23
              Width = 74
              Height = 13
              Caption = #1087#1086'-'#1073#1077#1083#1086#1088#1091#1089#1089#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 16
              Top = 50
              Width = 50
              Height = 13
              Caption = #1087#1086'-'#1088#1091#1089#1089#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object BLR_edAdresB: TDBEditEh
              Left = 104
              Top = 20
              Width = 680
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataField = 'ADRES_B'
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
            object edAdres: TDBEditEh
              Left = 104
              Top = 47
              Width = 680
              Height = 24
              HelpContext = 999
              Anchors = [akLeft, akTop, akRight]
              DataField = 'ADRES'
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
        end
        object Pn4: TPanel
          Left = 0
          Top = 309
          Width = 795
          Height = 74
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 795
            Height = 74
            Align = alClient
            Caption = ' 6. '#1056#1086#1076#1080#1090#1077#1083#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label13: TLabel
              Left = 24
              Top = 21
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
            object Label14: TLabel
              Left = 24
              Top = 43
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
            object Label16: TLabel
              Left = 232
              Top = 0
              Width = 50
              Height = 13
              Caption = ' '#1060#1072#1084#1080#1083#1080#1103' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 438
              Top = -1
              Width = 25
              Height = 13
              Caption = ' '#1048#1084#1103' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 616
              Top = -2
              Width = 55
              Height = 13
              Caption = ' '#1054#1090#1095#1077#1089#1090#1074#1086' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object BLR_edFaserFam: TDBEditEh
              Left = 164
              Top = 17
              Width = 180
              Height = 24
              DataField = 'FASER_FAMILIA'
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
            object BLR_edFaserName: TDBEditEh
              Left = 356
              Top = 17
              Width = 180
              Height = 24
              DataField = 'FASER_NAME'
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
            object BLR_edFaserOtch: TDBEditEh
              Left = 548
              Top = 17
              Width = 180
              Height = 24
              DataField = 'FASER_OTCH'
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
            object BLR_edMaserFam: TDBEditEh
              Left = 164
              Top = 42
              Width = 180
              Height = 24
              DataField = 'MASER_FAMILIA'
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
            object BLR_edMaserName: TDBEditEh
              Left = 356
              Top = 42
              Width = 180
              Height = 24
              DataField = 'MASER_NAME'
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
            object BLR_edMaserOtch: TDBEditEh
              Left = 548
              Top = 42
              Width = 180
              Height = 24
              DataField = 'MASER_OTCH'
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
        end
        object pn1: TPanel
          Left = 0
          Top = 0
          Width = 795
          Height = 62
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            795
            62)
          object Label18: TLabel
            Left = 12
            Top = 10
            Width = 83
            Height = 13
            Caption = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 12
            Top = 37
            Width = 86
            Height = 13
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1072
          end
          object Label20: TLabel
            Left = 336
            Top = 10
            Width = 43
            Height = 13
            Caption = #1055#1088#1080#1095#1080#1085#1072
          end
          object ENG_edLichNomer: TDBEditEh
            Left = 109
            Top = 4
            Width = 120
            Height = 24
            HelpContext = 888
            DataField = 'LICH_NOMER'
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
            OnUpdateData = ENG_edLichNomerUpdateData
          end
          object edOrgan: TDBEditEh
            Left = 109
            Top = 32
            Width = 667
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ORGAN'
            DataSource = dsDokument
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = edOrganEditButtons0Click
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Limit = 5
            MRUList.Rows = 5
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edPrich: TDBEditEh
            Left = 392
            Top = 4
            Width = 384
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PRICHINA'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MRUList.Limit = 5
            MRUList.Rows = 5
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object gbBrak: TGroupBox
          Left = 0
          Top = 383
          Width = 795
          Height = 43
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label15: TLabel
            Left = 7
            Top = 16
            Width = 88
            Height = 13
            Caption = ' 7.  '#1052#1091#1078', '#1078#1077#1085#1072' '
          end
          object BLR_edSuprugFam: TDBEditEh
            Left = 165
            Top = 13
            Width = 180
            Height = 24
            DataField = 'SUPRUG_FAMILIA'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
                Style = ebsGlyphEh
                Width = 21
                OnClick = BLR_edSuprugFamEditButtons0Click
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
          object BLR_edSuprugName: TDBEditEh
            Left = 357
            Top = 13
            Width = 180
            Height = 24
            DataField = 'SUPRUG_NAME'
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
          object BLR_edSuprugOtch: TDBEditEh
            Left = 549
            Top = 13
            Width = 180
            Height = 24
            DataField = 'SUPRUG_OTCH'
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
        object pnBrak: TPanel
          Left = 0
          Top = 426
          Width = 795
          Height = 85
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object Label10: TLabel
            Left = 8
            Top = 11
            Width = 93
            Height = 13
            Caption = #1060#1072#1084#1080#1083#1080#1103' '#1076#1086' '#1073#1088#1072#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label25: TLabel
            Left = 301
            Top = 11
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
          object Label26: TLabel
            Left = 525
            Top = 11
            Width = 93
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 8
            Top = 39
            Width = 121
            Height = 13
            Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1074#1099#1076#1072#1085#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 601
            Top = 39
            Width = 15
            Height = 13
            Caption = #1072'/'#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object BLR_edSuprugFamDoBrak: TDBEditEh
            Left = 127
            Top = 8
            Width = 164
            Height = 24
            DataField = 'DOBRAK_FAMILIA'
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
          object edSuprugRogd: TDBDateTimeEditEh
            Left = 391
            Top = 8
            Width = 103
            Height = 24
            DataField = 'SUPRUG_DATE'
            DataSource = dsDokument
            DragKind = dkDock
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
            EditFormat = 'DD/MM/YYYY'
          end
          object edBrakDate: TDBDateTimeEditEh
            Left = 639
            Top = 8
            Width = 103
            Height = 24
            DataField = 'BRAK_DATE'
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
          object BLR_edBrakMesto: TDBEditEh
            Left = 146
            Top = 36
            Width = 440
            Height = 24
            DataField = 'BRAK_MESTO'
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
          object edNomerAZ: TDBNumberEditEh
            Left = 629
            Top = 36
            Width = 73
            Height = 24
            DataField = 'NOMER_AZ'
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
          object edSem1: TDBCheckBoxEh
            Left = 8
            Top = 63
            Width = 156
            Height = 17
            Alignment = taLeftJustify
            Caption = #1061#1086#1083#1086#1089#1090'/'#1053#1077' '#1079#1072#1084#1091#1078#1077#1084'        '
            DataField = 'SEM_1'
            DataSource = dsDokument
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edSem2: TDBCheckBoxEh
            Left = 216
            Top = 63
            Width = 100
            Height = 17
            Alignment = taLeftJustify
            Caption = #1056#1072#1079#1074#1077#1076#1077#1085'('#1072')'
            DataField = 'SEM_2'
            DataSource = dsDokument
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object edSem3: TDBCheckBoxEh
            Left = 364
            Top = 63
            Width = 118
            Height = 17
            Alignment = taLeftJustify
            Caption = #1042#1076#1086#1074#1077#1094'('#1074#1076#1086#1074#1072')'
            DataField = 'SEM_3'
            DataSource = dsDokument
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object tsChildren: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 1
        DesignSize = (
          795
          595)
        object Label23: TLabel
          Left = 552
          Top = 550
          Width = 88
          Height = 13
          Caption = #1044#1072#1090#1072' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
        end
        object NF_lbERIP: TLabel
          Left = 36
          Top = 502
          Width = 80
          Height = 13
          Caption = #1054#1087#1083#1072#1090#1072' '#1074' '#1045#1056#1048#1055':'
        end
        object Label22: TLabel
          Left = 36
          Top = 526
          Width = 48
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085':'
        end
        object gbZag: TGroupBox
          Left = 0
          Top = 0
          Width = 795
          Height = 47
          Align = alTop
          Caption = ' 10. '#1048#1085#1086#1089#1090#1088#1072#1085#1085#1086#1077'  '#1075#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086' '#1080' '#1075#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086' '#1056#1077#1089#1087#1091#1073#1083#1080#1082#1080' '#1041#1077#1083#1072#1088#1091#1089#1100' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            795
            47)
          object BLR_DBEditEh1: TDBEditEh
            Left = 9
            Top = 16
            Width = 778
            Height = 24
            HelpContext = 888
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ZAGR'
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
        object GroupBox2: TGroupBox
          Left = 0
          Top = 47
          Width = 795
          Height = 158
          Align = alTop
          Caption = ' '#1044#1077#1090#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object BLR_GridChildren: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 750
            Height = 141
            Align = alClient
            Ctl3D = True
            DataSource = dsChildren
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
            EnterDirection = mdNextGraph
            OptionsS = [dgsSelectCurrentColor]
            SelRowColor = clAqua
            Color1 = clBlack
            Color2 = clBlack
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FAMILIA'
                Footers = <>
                Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                Width = 121
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1048#1084#1103
                Width = 100
                OnUpdateData = GridChildrenColumns1UpdateData
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                Width = 104
              end
              item
                EditButtons = <>
                FieldName = 'DATE_ROGD'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'POL'
                Footers = <>
                Title.Caption = #1055#1086#1083
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'KOMM'
                Footers = <>
                Title.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
                Width = 160
              end>
          end
          object Panel1: TPanel
            Left = 752
            Top = 15
            Width = 41
            Height = 141
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
              Left = 6
              Top = 4
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              TabStop = False
              OnClick = btAddChildClick
            end
            object btDelChild: TBitBtn
              Left = 6
              Top = 37
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelChildClick
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 205
          Width = 795
          Height = 153
          Align = alTop
          Caption = ' '#1054#1089#1085#1086#1074#1072#1085#1080#1103' '#1076#1083#1103' '#1074#1099#1076#1072#1095#1080' '#1087#1072#1089#1087#1086#1088#1090#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object BLR_GridDok: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 750
            Height = 136
            Align = alClient
            Ctl3D = True
            DataSource = dsDok
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
            EnterDirection = mdNextGraph
            OptionsS = [dgsSelectCurrentColor]
            SelRowColor = clAqua
            Color1 = clBlack
            Color2 = clBlack
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NAME_DOK'
                Footers = <>
                Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                Width = 148
              end
              item
                EditButtons = <>
                FieldName = 'SERIA'
                Footers = <>
                Title.Caption = #1057#1077#1088#1080#1103
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'NOMER'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'DATE_DOK'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = 'AKT_ZAP'
                Footers = <>
                Title.Caption = #1040#1082#1090#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                Width = 123
              end
              item
                EditButtons = <
                  item
                    Style = ebsEllipsisEh
                    OnClick = GridDokColumns5EditButtons0Click
                  end>
                FieldName = 'ORGAN'
                Footers = <>
                Title.Caption = #1050#1077#1084' '#1080' '#1082#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
                Width = 222
              end>
          end
          object Panel3: TPanel
            Left = 752
            Top = 15
            Width = 41
            Height = 136
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object btAddDok: TBitBtn
              Left = 6
              Top = 4
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              TabStop = False
              OnClick = btAddDokClick
            end
            object btDelDok: TBitBtn
              Left = 6
              Top = 37
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 1
              TabStop = False
              OnClick = btDelDokClick
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 358
          Width = 795
          Height = 117
          Align = alTop
          Caption = ' '#1057#1083#1091#1078#1077#1073#1085#1099#1077' '#1086#1090#1084#1077#1090#1082#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          DesignSize = (
            795
            117)
          object BLR_edOtmetka: TDBEditEh
            Left = 8
            Top = 16
            Width = 778
            Height = 90
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'OTMETKA'
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
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Left = 648
          Top = 545
          Width = 143
          Height = 24
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DATE_ZAPOLN'
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
        object N_F_cbERIP_GOSP: TDBCheckBoxEh
          Left = 141
          Top = 500
          Width = 97
          Height = 17
          Caption = #1075#1086#1089#1087#1086#1096#1083#1080#1085#1072
          DataField = 'OPL_GOSP'
          DataSource = dsDokument
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object N_F_cbERIP_SPEED: TDBCheckBoxEh
          Left = 252
          Top = 500
          Width = 89
          Height = 17
          Caption = #1091#1089#1082#1086#1088#1077#1085#1080#1077
          DataField = 'OPL_SPEED'
          DataSource = dsDokument
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object N_F_cbERIP_SMS: TDBCheckBoxEh
          Left = 352
          Top = 500
          Width = 141
          Height = 17
          Caption = #1057#1052#1057'-'#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          DataField = 'OPL_SMS'
          DataSource = dsDokument
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object edTelefon: TDBEditEh
          Left = 141
          Top = 522
          Width = 177
          Height = 24
          HelpContext = 999
          Anchors = [akLeft, akTop, akRight]
          DataField = 'TELEFON'
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
        object N_F_cbStrOtm: TDBCheckBoxEh
          Left = 9
          Top = 481
          Width = 420
          Height = 17
          Caption = #1055#1077#1095#1072#1090#1100' '#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093' '#1089#1083#1091#1078#1077#1073#1085#1099#1093' '#1086#1090#1084#1077#1090#1086#1082
          DataField = 'STD_OTM'
          DataSource = dsDokument
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 673
    Width = 803
  end
  inherited pnAdd: TPanel
    Width = 803
  end
  inherited dsDokument: TDataSource
    Left = 424
    Top = 82
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
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ORGAN'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PRICHINA'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FAMILIA_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH_B'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATE_ROGD'
        DataType = ftDate
      end
      item
        Name = 'GOR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OBL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STRANA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'GOR_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RN_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OBL_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STRANA_B'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FASER_FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FASER_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FASER_OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MASER_FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MASER_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MASER_OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SUPRUG_FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SUPRUG_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SUPRUG_OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DOBRAK_FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BRAK_DATE'
        DataType = ftDate
      end
      item
        Name = 'BRAK_MESTO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ADRES_B'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ZAGR'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'SUPRUG_DATE'
        DataType = ftDate
      end
      item
        Name = 'FAMILIA_ENGL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME_ENGL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATE_ZAPOLN'
        DataType = ftDate
      end
      item
        Name = 'ID_MEN'
        DataType = ftInteger
      end
      item
        Name = 'OTMETKA'
        DataType = ftMemo
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SEM_1'
        DataType = ftBoolean
      end
      item
        Name = 'SEM_2'
        DataType = ftBoolean
      end
      item
        Name = 'SEM_3'
        DataType = ftBoolean
      end
      item
        Name = 'NOMER_AZ'
        DataType = ftInteger
      end
      item
        Name = 'CITIZEN_OLD'
        DataType = ftInteger
      end
      item
        Name = 'PRAV_STATUS'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'LICH_NOMER_OLD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TYPEDOK'
        DataType = ftInteger
      end
      item
        Name = 'DATE_PRIB'
        DataType = ftDate
      end
      item
        Name = 'TDATE_PRIB'
        DataType = ftSmallint
      end
      item
        Name = 'TYPE_CITIZEN'
        DataType = ftSmallint
      end
      item
        Name = 'TDATE_ROGD'
        DataType = ftSmallint
      end>
    Left = 616
    Top = 306
    object DokumentLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 15
    end
    object DokumentORGAN: TMemoField
      FieldName = 'ORGAN'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentPRICHINA: TMemoField
      FieldName = 'PRICHINA'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 30
    end
    object DokumentNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object DokumentOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object DokumentFAMILIA_B: TStringField
      FieldName = 'FAMILIA_B'
      Size = 30
    end
    object DokumentNAME_B: TStringField
      FieldName = 'NAME_B'
      Size = 30
    end
    object DokumentOTCH_B: TStringField
      FieldName = 'OTCH_B'
      Size = 30
    end
    object DokumentDATE_ROGD: TDateField
      FieldName = 'DATE_ROGD'
    end
    object DokumentGOR: TStringField
      FieldName = 'GOR'
      Size = 50
    end
    object DokumentRN: TStringField
      FieldName = 'RN'
      Size = 50
    end
    object DokumentOBL: TStringField
      FieldName = 'OBL'
      Size = 50
    end
    object DokumentSTRANA: TStringField
      FieldName = 'STRANA'
      Size = 50
    end
    object DokumentGOR_B: TStringField
      FieldName = 'GOR_B'
      Size = 50
    end
    object DokumentRN_B: TStringField
      FieldName = 'RN_B'
      Size = 50
    end
    object DokumentOBL_B: TStringField
      FieldName = 'OBL_B'
      Size = 50
    end
    object DokumentSTRANA_B: TStringField
      FieldName = 'STRANA_B'
      Size = 50
    end
    object DokumentFASER_FAMILIA: TStringField
      FieldName = 'FASER_FAMILIA'
      Size = 30
    end
    object DokumentFASER_NAME: TStringField
      FieldName = 'FASER_NAME'
      Size = 30
    end
    object DokumentFASER_OTCH: TStringField
      FieldName = 'FASER_OTCH'
      Size = 30
    end
    object DokumentMASER_FAMILIA: TStringField
      FieldName = 'MASER_FAMILIA'
      Size = 30
    end
    object DokumentMASER_NAME: TStringField
      FieldName = 'MASER_NAME'
      Size = 30
    end
    object DokumentMASER_OTCH: TStringField
      FieldName = 'MASER_OTCH'
      Size = 30
    end
    object DokumentSUPRUG_FAMILIA: TStringField
      FieldName = 'SUPRUG_FAMILIA'
      Size = 30
    end
    object DokumentSUPRUG_NAME: TStringField
      FieldName = 'SUPRUG_NAME'
      Size = 30
    end
    object DokumentSUPRUG_OTCH: TStringField
      FieldName = 'SUPRUG_OTCH'
      Size = 30
    end
    object DokumentDOBRAK_FAMILIA: TStringField
      FieldName = 'DOBRAK_FAMILIA'
      Size = 30
    end
    object DokumentBRAK_DATE: TDateField
      FieldName = 'BRAK_DATE'
    end
    object DokumentBRAK_MESTO: TStringField
      FieldName = 'BRAK_MESTO'
      Size = 150
    end
    object DokumentADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object DokumentADRES_B: TStringField
      FieldName = 'ADRES_B'
      Size = 250
    end
    object DokumentZAGR: TMemoField
      FieldName = 'ZAGR'
      BlobType = ftMemo
      Size = 1
    end
    object DokumentSUPRUG_DATE: TDateField
      FieldName = 'SUPRUG_DATE'
    end
    object DokumentFAMILIA_ENGL: TStringField
      FieldName = 'FAMILIA_ENGL'
      Size = 30
    end
    object DokumentNAME_ENGL: TStringField
      FieldName = 'NAME_ENGL'
      Size = 30
    end
    object DokumentDATE_ZAPOLN: TDateField
      FieldName = 'DATE_ZAPOLN'
    end
    object DokumentID_MEN: TIntegerField
      FieldName = 'ID_MEN'
    end
    object DokumentOTMETKA: TMemoField
      FieldName = 'OTMETKA'
      BlobType = ftMemo
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentSEM_1: TBooleanField
      FieldName = 'SEM_1'
    end
    object DokumentSEM_2: TBooleanField
      FieldName = 'SEM_2'
    end
    object DokumentSEM_3: TBooleanField
      FieldName = 'SEM_3'
    end
    object DokumentNOMER_AZ: TIntegerField
      FieldName = 'NOMER_AZ'
    end
    object DokumentCITIZEN_OLD: TIntegerField
      FieldName = 'CITIZEN_OLD'
    end
    object DokumentPRAV_STATUS: TStringField
      FieldName = 'PRAV_STATUS'
      Size = 100
    end
    object DokumentLICH_NOMER_OLD: TStringField
      FieldName = 'LICH_NOMER_OLD'
    end
    object DokumentTYPEDOK: TIntegerField
      FieldName = 'TYPEDOK'
    end
    object DokumentDATE_PRIB: TDateField
      FieldName = 'DATE_PRIB'
    end
    object DokumentTDATE_PRIB: TSmallintField
      FieldName = 'TDATE_PRIB'
    end
    object DokumentTYPE_CITIZEN: TSmallintField
      FieldName = 'TYPE_CITIZEN'
    end
    object DokumentTDATE_ROGD: TSmallintField
      FieldName = 'TDATE_ROGD'
    end
    object DokumentTELEFON: TStringField
      FieldName = 'TELEFON'
      Size = 12
    end
    object DokumentOPL_SPEED: TBooleanField
      FieldName = 'OPL_SPEED'
    end
    object DokumentOPL_GOSP: TBooleanField
      FieldName = 'OPL_GOSP'
    end
    object DokumentOPL_SMS: TBooleanField
      FieldName = 'OPL_SMS'
    end
    object DokumentSTD_OTM: TBooleanField
      FieldName = 'STD_OTM'
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 672
    Top = 50
  end
  inherited HistZAGS: TkbmMemTable
    Left = 704
    Top = 218
  end
  inherited dsSeria: TDataSource
    Left = 448
    Top = 178
  end
  inherited dsObl: TDataSource
    Left = 408
    Top = 178
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 688
    Top = 266
  end
  inherited dsPovtor: TDataSource
    Left = 712
    Top = 162
  end
  inherited dsRN: TDataSource
    Left = 656
    Top = 234
  end
  inherited dsTypeGorod: TDataSource
    Left = 736
    Top = 218
  end
  inherited dsVoenkom: TDataSource
    Left = 704
  end
  inherited dsRovd: TDataSource
    Left = 736
    Top = 178
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 168
    Top = 122
  end
  object tbChildren: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = 1
    FieldDefs = <
      item
        Name = 'FAMILIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATE_ROGD'
        DataType = ftDate
      end
      item
        Name = 'NOMER'
        DataType = ftAutoInc
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KOMM'
        DataType = ftString
        Size = 100
      end>
    IndexFieldNames = 'NOMER'
    IndexName = 'tbChildrenIndex1'
    IndexDefs = <
      item
        Name = 'tbChildrenIndex1'
        Fields = 'NOMER'
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
    Left = 476
    Top = 226
    object tbChildrenFAMILIA: TStringField
      FieldName = 'FAMILIA'
      Size = 30
    end
    object tbChildrenNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object tbChildrenOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object tbChildrenDATE_ROGD: TDateField
      FieldName = 'DATE_ROGD'
      EditMask = '!99/99/0000;1;_'
    end
    object tbChildrenNOMER: TAutoIncField
      FieldName = 'NOMER'
    end
    object tbChildrenPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object tbChildrenKOMM: TStringField
      FieldName = 'KOMM'
      Size = 100
    end
  end
  object tbDok: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = 1
    FieldDefs = <
      item
        Name = 'NAME_DOK'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SERIA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ORGAN'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'DATE_DOK'
        DataType = ftDate
      end
      item
        Name = 'AKT_ZAP'
        DataType = ftString
        Size = 50
      end>
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
    Left = 556
    Top = 338
    object tbDokNAME_DOK: TStringField
      FieldName = 'NAME_DOK'
      Size = 50
    end
    object tbDokSERIA: TStringField
      FieldName = 'SERIA'
      Size = 15
    end
    object tbDokNOMER: TStringField
      FieldName = 'NOMER'
      Size = 15
    end
    object tbDokORGAN: TStringField
      FieldName = 'ORGAN'
      Size = 250
    end
    object tbDokDATE_DOK: TDateField
      FieldName = 'DATE_DOK'
    end
    object tbDokAKT_ZAP: TStringField
      FieldName = 'AKT_ZAP'
      Size = 50
    end
  end
  object dsChildren: TDataSource
    DataSet = tbChildren
    Left = 492
    Top = 58
  end
  object dsDok: TDataSource
    DataSet = tbDok
    Left = 524
    Top = 58
  end
end
