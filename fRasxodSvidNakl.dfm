inherited fmRasxodSvidNakl: TfmRasxodSvidNakl
  Left = 369
  Top = 154
  ActiveControl = edOrg
  Caption = #1055#1088#1080#1093#1086#1076#1085#1086'-'#1088#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
  ClientHeight = 588
  ClientWidth = 769
  Constraints.MinHeight = 550
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008887
    7778888800008877777788888888087000000088000088777777888888880870
    0000008800008887777888888888088000000088000088888888888888888000
    0000000000088888888888888888080808080808080808080808080808080008
    0008008808080808080808088008080880080808880888888888888888880000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 414
    Width = 769
  end
  inherited pnTable: TPanel
    Top = 417
    Width = 769
    Height = 149
    object GridList: TDBGridEh
      Left = 0
      Top = 0
      Width = 728
      Height = 149
      Align = alClient
      DataSource = DataSource
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
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
          FieldName = 'TYPE_BLANK'
          Footers = <>
          Width = 126
        end
        item
          EditButtons = <>
          FieldName = 'V_SERIA'
          Footers = <>
          Title.Caption = #1042#1099#1076#1072#1085#1086'|'#1089#1077#1088#1080#1103' '#1073#1083#1072#1085#1082#1086#1074
        end
        item
          AlwaysShowEditButton = True
          EditButtons = <
            item
              Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1073#1083#1072#1085#1082#1072
              Style = ebsPlusEh
              OnClick = GridListColumns2EditButtons0Click
            end>
          FieldName = 'V_NOMER1'
          Footers = <>
          Title.Caption = #1042#1099#1076#1072#1085#1086'|'#1089' '#1085#1086#1084#1077#1088#1072' '#1073#1083#1072#1085#1082#1072
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'V_NOMER2'
          Footers = <>
          Title.Caption = #1042#1099#1076#1072#1085#1086'|'#1087#1086' '#1085#1086#1084#1077#1088' '#1073#1083#1072#1085#1082#1072
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'V_KOLKN'
          Footers = <>
          Title.Caption = #1042#1099#1076#1072#1085#1086'|'#1082#1086#1083'-'#1074#1086' '#1082#1085#1080#1078#1077#1082
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'P_SERIA'
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086'|'#1089#1077#1088#1080#1103' '#1073#1083#1072#1085#1082#1086#1074
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'P_NOMER1'
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086'|'#1089' '#1085#1086#1084#1077#1088#1072' '#1073#1083#1072#1085#1082#1072
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'P_NOMER2'
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086'|'#1087#1086' '#1085#1086#1084#1077#1088' '#1073#1083#1072#1085#1082#1072
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'P_KOLKN'
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086'|'#1082#1086#1083'-'#1074#1086' '#1082#1085#1080#1078#1077#1082
          Width = 52
        end>
    end
    object Panel1: TPanel
      Left = 728
      Top = 0
      Width = 41
      Height = 149
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
        Top = 9
        Width = 28
        Height = 28
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
        OnClick = btAddChildClick
      end
      object btDelChild: TBitBtn
        Left = 6
        Top = 42
        Width = 28
        Height = 28
        Hint = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 1
        OnClick = btDelChildClick
      end
    end
  end
  inherited TBDock: TTBDock
    Width = 769
    inherited TBToolbar: TTBToolbar
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBSubmenuRun: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 276
      end
    end
  end
  inherited sb: TScrollBox
    Width = 769
    Height = 364
    Constraints.MinHeight = 310
    DockSite = True
    inherited pnPovtor: TPanel
      Left = 784
      Top = 112
      Width = 73
      TabOrder = 11
      Visible = False
    end
    inherited N_F_edTypeEkz: TComboBox
      Left = 619
      TabOrder = 19
    end
    object edDateDok: TDBDateTimeEditEh
      Left = 161
      Top = 66
      Width = 121
      Height = 24
      DataField = 'DATE_DOK'
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
    object edKomu: TDBEditEh
      Left = 161
      Top = 93
      Width = 336
      Height = 24
      DataField = 'KOMU'
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
      OnUpdateData = edKomuUpdateData
    end
    object edKogo: TDBEditEh
      Left = 161
      Top = 120
      Width = 205
      Height = 24
      DataField = 'KOGO'
      DataSource = dsDokument
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edKogoEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object edDoverNomer: TDBEditEh
      Left = 161
      Top = 147
      Width = 81
      Height = 24
      DataField = 'DOVER_NOMER'
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
    object edDoverDate: TDBDateTimeEditEh
      Left = 284
      Top = 147
      Width = 121
      Height = 24
      DataField = 'DOVER_DATE'
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
    object gbOtpRazr: TGroupBox
      Left = 7
      Top = 173
      Width = 761
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1054#1090#1087#1091#1089#1082' '#1088#1072#1079#1088#1077#1096#1080#1083' '
      TabOrder = 7
      object Label7: TLabel
        Left = 16
        Top = 20
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
      object Label10: TLabel
        Left = 449
        Top = 20
        Width = 67
        Height = 13
        Caption = #1048'.'#1054'.'#1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edOtpRazr: TDBEditEh
        Left = 534
        Top = 16
        Width = 161
        Height = 24
        DataField = 'OTP_RAZR'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edOtpRazrEditButtons0Click
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
      object edOtpRazrDolg: TDBEditEh
        Left = 91
        Top = 16
        Width = 289
        Height = 24
        DataField = 'OTP_RAZR_DOLG'
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
    object gbOtpProizv: TGroupBox
      Left = 7
      Top = 267
      Width = 761
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1054#1090#1087#1091#1089#1082' '#1087#1088#1086#1080#1079#1074#1077#1083' '
      TabOrder = 9
      object Label8: TLabel
        Left = 16
        Top = 20
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
      object Label9: TLabel
        Left = 449
        Top = 20
        Width = 67
        Height = 13
        Caption = #1048'.'#1054'.'#1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edOtpProizv: TDBEditEh
        Left = 534
        Top = 16
        Width = 161
        Height = 24
        DataField = 'OTP_PROIZV'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edOtpProizvEditButtons0Click
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
      object edOtpProizvDolg: TDBEditEh
        Left = 91
        Top = 16
        Width = 289
        Height = 24
        DataField = 'OTP_PROIZV_DOLG'
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
    object gbPoluch: TGroupBox
      Left = 5
      Top = 314
      Width = 761
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1055#1086#1083#1091#1095#1080#1083' '
      TabOrder = 10
      object Label11: TLabel
        Left = 16
        Top = 20
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
      object Label12: TLabel
        Left = 449
        Top = 20
        Width = 67
        Height = 13
        Caption = #1048'.'#1054'.'#1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edPoluch: TDBEditEh
        Left = 534
        Top = 16
        Width = 161
        Height = 24
        HelpContext = 999
        DataField = 'POLUCH'
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
        OnUpdateData = edPoluchUpdateData
      end
      object edPoluchDolg: TDBEditEh
        Left = 91
        Top = 16
        Width = 289
        Height = 24
        DataField = 'POLUCH_DOLG'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.Active = True
        MRUList.Items.Strings = (
          #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081' '#1076#1077#1083#1072#1084#1080)
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
    end
    object edNomer: TDBEditEh
      Left = 161
      Top = 39
      Width = 74
      Height = 24
      DataField = 'NOMER'
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
    object StaticText2: TStaticText
      Left = 17
      Top = 43
      Width = 35
      Height = 17
      Caption = #1053#1086#1084#1077#1088
      TabOrder = 12
    end
    object StaticText3: TStaticText
      Left = 17
      Top = 70
      Width = 30
      Height = 17
      Caption = #1044#1072#1090#1072
      TabOrder = 13
    end
    object StaticText4: TStaticText
      Left = 17
      Top = 97
      Width = 83
      Height = 17
      Caption = #1050#1086#1084#1091' '#1086#1090#1087#1091#1097#1077#1085#1086
      TabOrder = 14
    end
    object StaticText5: TStaticText
      Left = 17
      Top = 124
      Width = 60
      Height = 17
      Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086
      TabOrder = 15
    end
    object StaticText6: TStaticText
      Left = 17
      Top = 151
      Width = 92
      Height = 17
      Caption = #1055#1086' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      TabOrder = 16
    end
    object StaticText7: TStaticText
      Left = 256
      Top = 151
      Width = 16
      Height = 17
      Caption = #1086#1090
      TabOrder = 17
    end
    object StaticText1: TStaticText
      Left = 17
      Top = 14
      Width = 133
      Height = 17
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      TabOrder = 18
    end
    object edOrg: TDBComboBoxEh
      Left = 161
      Top = 12
      Width = 480
      Height = 24
      HelpContext = 888
      DataField = 'ID_ZAGS'
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
      OnUpdateData = edOrgUpdateData
    end
    object gbOtpRazr2: TGroupBox
      Left = 7
      Top = 220
      Width = 761
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1054#1090#1087#1091#1089#1082' '#1088#1072#1079#1088#1077#1096#1080#1083' '
      TabOrder = 8
      object Label1: TLabel
        Left = 16
        Top = 20
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
      object Label2: TLabel
        Left = 449
        Top = 20
        Width = 67
        Height = 13
        Caption = #1048'.'#1054'.'#1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edOtpRazr2: TDBEditEh
        Left = 534
        Top = 16
        Width = 161
        Height = 24
        DataField = 'OTP_RAZR2'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edOtpRazr2EditButtons0Click
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
      object edOtpRazrDolg2: TDBEditEh
        Left = 91
        Top = 16
        Width = 289
        Height = 24
        DataField = 'OTP_RAZR_DOLG2'
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
  inherited StBar: TStatusBar
    Top = 566
    Width = 769
  end
  inherited pnAdd: TPanel
    Width = 769
  end
  inherited dsDokument: TDataSource
    Left = 608
    Top = 90
  end
  inherited Dokument: TkbmMemTable
    object DokumentID_ZAGS: TIntegerField
      FieldName = 'ID_ZAGS'
    end
    object DokumentNOMER: TStringField
      FieldName = 'NOMER'
      Size = 10
    end
    object DokumentDATE_DOK: TDateField
      FieldName = 'DATE_DOK'
    end
    object DokumentKOMU: TStringField
      FieldName = 'KOMU'
      Size = 100
    end
    object DokumentKOGO: TStringField
      FieldName = 'KOGO'
      Size = 100
    end
    object DokumentDOVER_NOMER: TStringField
      FieldName = 'DOVER_NOMER'
      Size = 15
    end
    object DokumentDOVER_DATE: TDateField
      FieldName = 'DOVER_DATE'
    end
    object DokumentOTP_RAZR: TStringField
      FieldName = 'OTP_RAZR'
      Size = 100
    end
    object DokumentOTP_RAZR_DOLG: TStringField
      FieldName = 'OTP_RAZR_DOLG'
      Size = 100
    end
    object DokumentOTP_PROIZV: TStringField
      FieldName = 'OTP_PROIZV'
      Size = 100
    end
    object DokumentOTP_PROIZV_DOLG: TStringField
      FieldName = 'OTP_PROIZV_DOLG'
      Size = 100
    end
    object DokumentPOLUCH: TStringField
      FieldName = 'POLUCH'
      Size = 100
    end
    object DokumentPOLUCH_DOLG: TStringField
      FieldName = 'POLUCH_DOLG'
      Size = 100
    end
    object DokumentOTP_RAZR2: TStringField
      FieldName = 'OTP_RAZR2'
      Size = 100
    end
    object DokumentOTP_RAZR_DOLG2: TStringField
      FieldName = 'OTP_RAZR_DOLG2'
      Size = 100
    end
  end
  inherited HistZAGS: TkbmMemTable
    Left = 552
    Top = 178
  end
  inherited dsObl: TDataSource
    Left = 472
    Top = 194
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 672
    Top = 74
  end
  inherited dsPovtor: TDataSource
    DataSet = dmBase.SprNames
  end
  inherited ImGISUN: TImageList
    Left = 556
    Top = 83
  end
  inherited dsVoenkom: TDataSource
    Left = 720
    Top = 106
  end
  inherited dsRovd: TDataSource
    Left = 704
    Top = 154
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 544
    Top = 130
  end
  object tbList: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'NPP'
        DataType = ftAutoInc
      end
      item
        Name = 'TYPE_BLANK'
        DataType = ftInteger
      end
      item
        Name = 'V_KOLKN'
        DataType = ftInteger
      end
      item
        Name = 'V_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'V_NOMER1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'V_NOMER2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'P_KOLKN'
        DataType = ftInteger
      end
      item
        Name = 'P_SERIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'P_NOMER1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'P_NOMER2'
        DataType = ftString
        Size = 20
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
    Left = 512
    Top = 146
    object tbListNPP: TAutoIncField
      FieldName = 'NPP'
    end
    object tbListTYPE_BLANK: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1073#1083#1072#1085#1082#1072
      FieldName = 'TYPE_BLANK'
    end
    object tbListV_KOLKN: TIntegerField
      FieldName = 'V_KOLKN'
    end
    object tbListV_SERIA: TStringField
      FieldName = 'V_SERIA'
      Size = 10
    end
    object tbListV_NOMER1: TStringField
      FieldName = 'V_NOMER1'
    end
    object tbListV_NOMER2: TStringField
      FieldName = 'V_NOMER2'
    end
    object tbListP_KOLKN: TIntegerField
      FieldName = 'P_KOLKN'
    end
    object tbListP_SERIA: TStringField
      FieldName = 'P_SERIA'
      Size = 10
    end
    object tbListP_NOMER1: TStringField
      FieldName = 'P_NOMER1'
    end
    object tbListP_NOMER2: TStringField
      FieldName = 'P_NOMER2'
    end
  end
  object DataSource: TDataSource
    DataSet = tbList
    OnDataChange = DataSourceDataChange
    Left = 288
    Top = 494
  end
end
