object fmEditRecSprPunkt: TfmEditRecSprPunkt
  Left = 622
  Top = 246
  ActiveControl = edNameB
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 670
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 279
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      586
      279)
    object lbOrgan: TLabel
      Left = 9
      Top = 14
      Width = 125
      Height = 16
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 66
      Width = 22
      Height = 16
      Caption = #1058#1080#1087
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 13
      Top = 96
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 127
      Width = 125
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1073#1077#1083'.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 219
      Width = 144
      Height = 16
      Caption = #1050#1086#1076' '#1088#1072#1076#1080#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1086#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 250
      Width = 106
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1087#1086#1082#1072#1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 188
      Width = 102
      Height = 16
      Caption = #1044#1072#1090#1072' '#1083#1080#1082#1074#1080#1076#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 13
      Top = 158
      Width = 87
      Height = 16
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edOrgan: TDBEditEh
      Left = 9
      Top = 32
      Width = 556
      Height = 24
      Color = clInfoBk
      EditButtons = <
        item
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' (F10) '
          Style = ebsEllipsisEh
          Width = 20
          OnClick = edOrganEditButtons0Click
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
          Width = 20
          OnClick = edOrganEditButtons1Click
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
      OnChange = edOrganChange
    end
    object edNameB: TDBEditEh
      Left = 176
      Top = 122
      Width = 168
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object edB_GOROD: TDBLookupComboboxEh
      Left = 176
      Top = 61
      Width = 168
      Height = 26
      Alignment = taLeftJustify
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'FNAME'
      ListSource = dsTypePunkt
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object edName: TDBEditEh
      Left = 176
      Top = 91
      Width = 168
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object cbChern: TCheckBox
      Left = 325
      Top = 236
      Width = 301
      Height = 17
      TabStop = False
      Caption = #1042#1093#1086#1076#1080#1090' '#1074' '#1063#1077#1088#1085#1086#1073#1099#1083#1100#1089#1082#1091#1102' '#1079#1086#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = cbNotStatClick
    end
    object cbGorod: TCheckBox
      Left = 325
      Top = 217
      Width = 166
      Height = 17
      TabStop = False
      Caption = #1043#1086#1088#1086#1076#1089#1082#1086#1077' '#1085#1072#1089#1077#1083#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = cbNotStatClick
    end
    object cbNotStat: TCheckBox
      Left = 325
      Top = 199
      Width = 289
      Height = 17
      TabStop = False
      Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100'  '#1074' '#1092#1086#1088#1084#1099' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = cbNotStatClick
    end
    object cbNotRiap: TCheckBox
      Left = 325
      Top = 255
      Width = 224
      Height = 17
      TabStop = False
      Caption = #1053#1077' '#1074#1099#1075#1088#1091#1078#1072#1090#1100' '#1085#1072' '#1087#1086#1088#1090#1072#1083' '#1056#1048#1040#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = cbNotStatClick
    end
    object edNomer: TDBNumberEditEh
      Left = 176
      Top = 245
      Width = 121
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object edZona: TDBEditEh
      Left = 176
      Top = 214
      Width = 121
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object edDateCreate: TDBDateTimeEditEh
      Left = 176
      Top = 153
      Width = 121
      Height = 26
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
      OnUpdateData = edB_GORODUpdateData
    end
    object edDateLikv: TDBDateTimeEditEh
      Left = 176
      Top = 183
      Width = 121
      Height = 26
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 5
      Visible = True
      OnUpdateData = edB_GORODUpdateData
    end
    object cbVxod: TCheckBox
      Left = 227
      Top = 14
      Width = 334
      Height = 17
      Caption = #1042#1093#1086#1076#1080#1090' '#1074' '#1089#1086#1089#1090#1072#1074' '#1085#1072#1089#1077#1083#1077#1085#1085#1086#1075#1086' '#1087#1091#1085#1082#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = cbVxodClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 629
    Width = 586
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      586
      41)
    object btOk: TBitBtn
      Left = 365
      Top = 7
      Width = 89
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' (F2)'
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = btOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 477
      Top = 7
      Width = 89
      Height = 25
      Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' (ESC)'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      OnClick = btCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object gbEva: TGroupBox
    Left = 0
    Top = 279
    Width = 586
    Height = 350
    Align = alClient
    Caption = ' '#1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1091#1083#1080#1094' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      586
      350)
    object Grid: TDBGridEh
      Left = 6
      Top = 16
      Width = 540
      Height = 328
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = True
      DataSource = DataSource
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
      FrozenCols = 1
      HorzScrollBar.Visible = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      OptionsEh = [dghFixed3D, dghFrozen3D, dghData3D, dghHighlightFocus, dghClearSelection, dghDialogFind]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnColEnter = GridColEnter
      OnGetCellParams = GridGetCellParams
      Columns = <
        item
          Color = clBtnFace
          EditButtons = <>
          FieldName = 'EVA_FNAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1074#1085#1091#1090#1088#1077#1085#1085#1077#1075#1086' '#1072#1076#1088#1077#1089#1072' '#1080#1079' '#1082#1072#1076#1072#1089#1090#1088#1086#1074#1086#1075#1086' '#1072#1075#1077#1085#1089#1090#1074#1072
          Width = 264
        end
        item
          EditButtons = <>
          FieldName = 'UL_NAME'
          Footers = <>
          Title.Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1083#1080#1094' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          Width = 228
        end>
    end
    object btAdd: TBitBtn
      Left = 553
      Top = 92
      Width = 26
      Height = 26
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072' '#1082#1072#1076#1072#1089#1090#1088#1086#1074#1086#1075#1086' ('#1069#1042#1040') '
      TabOrder = 1
      Visible = False
      OnClick = btAddClick
    end
    object btSetSootv: TBitBtn
      Left = 553
      Top = 20
      Width = 26
      Height = 26
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1091#1083#1080#1094' '
      TabOrder = 2
      OnClick = btSetSootvClick
    end
  end
  object DataSource1: TDataSource
    DataSet = Query
    Left = 397
    Top = 157
  end
  object Query: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    AdsConnection = dmBase.AdsConnection
    Left = 481
    Top = 162
    ParamData = <>
  end
  object QuerySeek: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    StoreActive = False
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    AdsTableOptions.AdsIndexPageSize = 512
    SQL.Strings = (
      'SELECT ID '
      '   FROM SprNames '
      '   WHERE Substring(SOATO,1,2)='#39'90'#39
      '   ORDER BY ID DESC')
    AdsConnection = dmBase.AdsConnection
    Left = 442
    Top = 154
    ParamData = <>
  end
  object dsTypePunkt: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 365
    Top = 160
  end
  object mtEva: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'EVA_NAME'
    IndexDefs = <
      item
        Name = 'mtEvaIndex1'
        Fields = 'EVA_NAME'
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
    Left = 152
    Top = 408
    object mtEvaEVA: TIntegerField
      FieldName = 'EVA'
    end
    object mtEvaEVA_NAME: TStringField
      FieldName = 'EVA_NAME'
      Size = 200
    end
    object mtEvaEVA_FNAME: TStringField
      FieldName = 'EVA_FNAME'
      Size = 200
    end
    object mtEvaUL: TIntegerField
      FieldName = 'UL'
    end
    object mtEvaUL_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'UL_NAME'
      LookupDataSet = dmBase.LookupUL
      LookupKeyFields = 'ID'
      LookupResultField = 'name3'
      KeyFields = 'UL'
      Size = 100
      Lookup = True
    end
    object mtEvaUL_KNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'UL_KNAME'
      LookupDataSet = dmBase.LookupUL
      LookupKeyFields = 'id'
      LookupResultField = 'kname'
      KeyFields = 'UL'
      Size = 100
      Lookup = True
    end
  end
  object DataSource: TDataSource
    DataSet = mtEva
    OnDataChange = DataSourceDataChange
    Left = 208
    Top = 408
  end
end
