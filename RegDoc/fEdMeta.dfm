object fmEdMeta: TfmEdMeta
  Left = 346
  Top = 168
  AutoScroll = False
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1081' '#1090#1072#1073#1083#1080#1094
  ClientHeight = 432
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tbaEdMeta: TToolBar
    Left = 0
    Top = 0
    Width = 569
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    Images = imEdMeta
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbOk: TToolButton
      Left = 0
      Top = 0
      Action = acOk
    end
    object tbSep1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 31
      Top = 0
      Action = acCancel
    end
  end
  object pcMeta: TPageControl
    Left = 0
    Top = 22
    Width = 569
    Height = 410
    ActivePage = tsMetaMain
    Align = alClient
    TabOrder = 1
    object tsMetaMain: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099
      object paAll: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 382
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object spTop: TSplitter
          Left = 0
          Top = 137
          Width = 561
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object dgTable: TDBGridEh
          Left = 0
          Top = 17
          Width = 561
          Height = 120
          Align = alTop
          DataSource = dsoTable
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Width = 78
            end
            item
              EditButtons = <>
              FieldName = 'TABLE_NAME'
              Footers = <>
              Width = 124
            end
            item
              EditButtons = <>
              FieldName = 'ALIAS'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SHORT'
              Footers = <>
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'CAPTION'
              Footers = <>
              Width = 107
            end
            item
              EditButtons = <>
              FieldName = 'COMM'
              Footers = <>
              Width = 165
            end
            item
              EditButtons = <>
              FieldName = 'INDEX_NAME'
              Footers = <>
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'MASTER_FIELD'
              Footers = <>
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'KEY_FIELD'
              Footers = <>
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'NAME_FIELD'
              Footers = <>
              Width = 81
            end
            item
              EditButtons = <>
              FieldName = 'AUTO_INC'
              Footers = <>
              Width = 84
            end
            item
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                  OnClick = dgTableColumns11EditButtons0Click
                end>
              FieldName = 'STYLE'
              Footers = <>
              Width = 77
            end>
        end
        object pcBottom: TPageControl
          Left = 0
          Top = 140
          Width = 561
          Height = 242
          ActivePage = tsField
          Align = alClient
          Style = tsButtons
          TabOrder = 1
          object tsField: TTabSheet
            Caption = 'tsField'
            object dgField: TDBGridEh
              Left = 0
              Top = 17
              Width = 553
              Height = 194
              Align = alClient
              DataSource = dsoField
              Flat = True
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'Tahoma'
              FooterFont.Style = []
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footers = <>
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = 'FIELD_NAME'
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = 'SYNONIM'
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = 'CAPTION'
                  Footers = <>
                  Width = 127
                end
                item
                  EditButtons = <>
                  FieldName = 'COMM'
                  Footers = <>
                  Width = 107
                end
                item
                  EditButtons = <>
                  FieldName = 'GROUP'
                  Footers = <>
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'SPR_NAME'
                  Footers = <>
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'ENUM_NAME'
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = 'ORDER'
                  Footers = <>
                  Width = 51
                end
                item
                  EditButtons = <
                    item
                      Style = ebsEllipsisEh
                      OnClick = dgFieldColumns9EditButtons0Click
                    end>
                  FieldName = 'STYLE'
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = 'LINK_STYLE'
                  Footers = <>
                  KeyList.Strings = (
                    'lsNone'
                    'lsLinkSpr'
                    'lsLinkEnum'
                    'lsOwnPickList')
                  PickList.Strings = (
                    'lsNone'
                    'lsLinkSpr'
                    'lsLinkEnum'
                    'lsOwnPickList')
                  Width = 78
                end
                item
                  EditButtons = <>
                  FieldName = 'SEL_STYLE'
                  Footers = <>
                  KeyList.Strings = (
                    'ssNone'
                    'ssPickList'
                    'ssShowWindow')
                  PickList.Strings = (
                    'ssNone'
                    'ssPickList'
                    'ssShowWindow')
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = 'DATA_KIND'
                  Footers = <>
                  KeyList.Strings = (
                    'dkString'
                    'dkBoolean'
                    'dkNumber'
                    'dkFloat'
                    'dkDate')
                  PickList.Strings = (
                    'dkString'
                    'dkBoolean'
                    'dkNumber'
                    'dkFloat'
                    'dkDate')
                  Width = 72
                end
                item
                  EditButtons = <>
                  FieldName = 'LOOKUP'
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = 'EXCLUDE'
                  Footers = <>
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = 'WIDTH'
                  Footers = <>
                  Width = 52
                end
                item
                  EditButtons = <>
                  FieldName = 'TITLE'
                  Footers = <>
                  Width = 84
                end
                item
                  EditButtons = <>
                  FieldName = 'EXCLUDE_STYLE'
                  Footers = <>
                  Width = 91
                end
                item
                  EditButtons = <>
                  FieldName = 'INCLUDE_STYLE'
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = 'FIELD_MODE'
                  Footers = <>
                  KeyList.Strings = (
                    'nmNone'
                    'nmWithValue'
                    'nmOnlyName'
                    'nmNewColumn'
                    'nmLookup')
                  PickList.Strings = (
                    'nmNone'
                    'nmWithValue'
                    'nmOnlyName'
                    'nmNewColumn'
                    'nmLookup')
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = 'FIELD_KIND'
                  Footers = <>
                  KeyList.Strings = (
                    'nsFullName'
                    'nsShortName'
                    'nsFieldForName'
                    'nsSelectForName')
                  PickList.Strings = (
                    'nsFullName'
                    'nsShortName'
                    'nsFieldForName'
                    'nsSelectForName')
                  Width = 76
                end>
            end
            object stField: TStaticText
              Left = 0
              Top = 0
              Width = 553
              Height = 17
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Caption = #1057#1055#1048#1057#1054#1050' '#1055#1054#1051#1045#1049
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clHighlightText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
          end
        end
        object stTable: TStaticText
          Left = 0
          Top = 0
          Width = 561
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = #1057#1055#1048#1057#1054#1050' '#1058#1040#1041#1051#1048#1062
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          Transparent = False
        end
      end
    end
    object tsMetaFind: TTabSheet
      Caption = #1055#1086#1080#1089#1082
      ImageIndex = 1
      object stFindOper: TStaticText
        Left = 0
        Top = 0
        Width = 561
        Height = 17
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1054#1055#1045#1056#1040#1062#1048#1048' '#1055#1054#1048#1057#1050#1040
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Transparent = False
      end
      object dgFindOper: TDBGridEh
        Left = 0
        Top = 17
        Width = 561
        Height = 365
        Align = alClient
        DataSource = dsoFindOper
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Name'
            Footers = <>
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'Caption'
            Footers = <>
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'SQL'
            Footers = <>
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'FieldKinds'
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'NeedValue'
            Footers = <>
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'TwoValue'
            Footers = <>
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'IgnoreCase'
            Footers = <>
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'MultiSel'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'MultiOr'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'Order'
            Footers = <>
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'Visible'
            Footers = <>
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'OwnValue'
            Footers = <>
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'OwnValName'
            Footers = <>
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'OwnValKind'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'SprName'
            Footers = <>
            Width = 75
          end>
      end
    end
  end
  object dsTable: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TABLE_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TABLE_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ALIAS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SHORT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CAPTION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COMM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'INDEX_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MASTER_FIELD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'KEY_FIELD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NAME_FIELD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'AUTO_INC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'STYLE'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <
      item
        Name = 'indPrimary'
        Fields = 'TABLE_ID'
        Options = [ixPrimary, ixUnique]
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
    Left = 48
    Top = 288
    object dsTableTABLE_ID: TAutoIncField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object dsTableNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object dsTableTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object dsTableALIAS: TStringField
      FieldName = 'ALIAS'
      Size = 10
    end
    object dsTableSHORT: TStringField
      FieldName = 'SHORT'
      Size = 30
    end
    object dsTableCAPTION: TStringField
      FieldName = 'CAPTION'
      Size = 100
    end
    object dsTableCOMM: TStringField
      FieldName = 'COMM'
      Size = 100
    end
    object dsTableINDEX_NAME: TStringField
      FieldName = 'INDEX_NAME'
      Size = 30
    end
    object dsTableMASTER_FIELD: TStringField
      FieldName = 'MASTER_FIELD'
      Size = 100
    end
    object dsTableKEY_FIELD: TStringField
      FieldName = 'KEY_FIELD'
      Size = 100
    end
    object dsTableNAME_FIELD: TStringField
      FieldName = 'NAME_FIELD'
      Size = 100
    end
    object dsTableAUTO_INC: TStringField
      FieldName = 'AUTO_INC'
      Size = 30
    end
    object dsTableSTYLE: TStringField
      FieldName = 'STYLE'
      Size = 250
    end
  end
  object fmtCSV: TkbmCSVStreamFormat
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    CSVTrueString = 'True'
    CSVFalseString = 'False'
    sfLocalFormat = []
    sfQuoteOnlyStrings = []
    sfNoHeader = []
    Version = '3.00'
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = []
    sfIndexDef = []
    sfPlaceHolders = []
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = []
    sfFromStart = [sfLoadFromStart]
    Left = 368
    Top = 56
  end
  object dsoTable: TDataSource
    DataSet = dsTable
    Left = 48
    Top = 336
  end
  object dsoField: TDataSource
    DataSet = dsField
    Left = 125
    Top = 335
  end
  object dsField: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TABLE_ID'
        DataType = ftInteger
      end
      item
        Name = 'FIELD_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FIELD_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SYNONIM'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CAPTION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COMM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'GROUP'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SPR_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENUM_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ORDER'
        DataType = ftInteger
      end
      item
        Name = 'STYLE'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'LINK_STYLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SEL_STYLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_KIND'
        DataType = ftString
        Size = 30
      end>
    IndexFieldNames = 'TABLE_ID;ORDER'
    IndexDefs = <
      item
        Name = 'indPrimary'
        Fields = 'TABLE_ID;FIELD_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'indOrder'
        Fields = 'TABLE_ID;ORDER'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    MasterFields = 'TABLE_ID'
    MasterSource = dsoTable
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 125
    Top = 287
    object dsFieldTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Visible = False
    end
    object dsFieldFIELD_ID: TAutoIncField
      FieldName = 'FIELD_ID'
      Visible = False
    end
    object dsFieldNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object dsFieldFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Size = 30
    end
    object dsFieldSYNONIM: TStringField
      DisplayWidth = 30
      FieldName = 'SYNONIM'
      Size = 30
    end
    object dsFieldCAPTION: TStringField
      FieldName = 'CAPTION'
      Size = 100
    end
    object dsFieldCOMM: TStringField
      FieldName = 'COMM'
      Size = 100
    end
    object dsFieldGROUP: TStringField
      FieldName = 'GROUP'
      Size = 100
    end
    object dsFieldSPR_NAME: TStringField
      FieldName = 'SPR_NAME'
      Size = 30
    end
    object dsFieldENUM_NAME: TStringField
      FieldName = 'ENUM_NAME'
      Size = 30
    end
    object dsFieldORDER: TIntegerField
      FieldName = 'ORDER'
    end
    object dsFieldSTYLE: TStringField
      FieldName = 'STYLE'
      Size = 250
    end
    object dsFieldLINK_STYLE: TStringField
      FieldName = 'LINK_STYLE'
      Size = 30
    end
    object dsFieldSEL_STYLE: TStringField
      FieldName = 'SEL_STYLE'
      Size = 30
    end
    object dsFieldDATA_KIND: TStringField
      FieldName = 'DATA_KIND'
      Size = 30
    end
  end
  object imEdMeta: TImageList
    Left = 472
    Top = 8
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFF0000FF000000FFFF00
      00FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFFFFFFFF000000FFFF00
      00FFFFFFFFFFFF0000FF000000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000FFFFFFFFFFFF0000FF0000
      00FFC0C0C0FF000000FFFF0000FFC0C0C0FFFFFFFFFF000000FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFFFFFFFF000000FFFF00
      00FF000000FFFF0000FF000000FFFF0000FFFFFFFFFFFF0000FFC0C0C0FFFFFF
      FFFFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000FFFFFFFFFFFF0000FFFFFF
      FFFFFF0000FF000000FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0C0FFFFFF
      FFFFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFF0000FF000000FFFFFF
      FFFF000000FFFF0000FFFFFFFFFFFF0000FF000000FFFF0000FFFFFFFFFFFFFF
      FFFFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000FF000000FFFF0000FF0000
      00FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFC0C0C0FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF
      FFFF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000FF000000FFFF0000FF0000
      00FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFFFFFFFFFFFF
      FFFF808080FFFFFFFFFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF808080FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
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
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000008000000080000000800000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      80000000000080808000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000080
      0000008000000080000000800000008000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C000FFFF00008080
      80008080800000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF0000000000000000000000FF000000
      FF00000000000000000000000000000000000000000080808000008000000080
      0000000000000000000000800000008000000080000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFF0000C0C0C000C0C0C0008080
      8000C0C0C00000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000008080800000800000000000000000
      0000000000000000000000000000008000000080000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000FFFF0000FFFF0000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000800000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      800000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF0000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000080000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000800000008000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E000000000000000E000000000000000
      E000000000000000E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      E003000000000000E007000000000000FFFFFFFFFFFFFFFFFFFFFFFF000CC007
      EFFDF9FF00088003C7FFF0FF00010001C3FBF0FF00030001E3F7E07F00030001
      F1E7C07F00030000F8CF843F00030000FC1F1E3F00038000FE3FFE1F0007C000
      FC1FFF1F000FE001F8CFFF8F000FE007E1E7FFC7000FF007C3F3FFE3001FF003
      C7FDFFF8003FF803FFFFFFFF007FFFFF00000000000000000000000000000000
      000000000000}
  end
  object alEdMeta: TActionList
    Images = imEdMeta
    Left = 520
    Top = 8
    object acOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074' '#1073#1072#1079#1077
      ImageIndex = 1
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      ImageIndex = 0
      OnExecute = acCancelExecute
    end
  end
  object fmtSave: TkbmCSVStreamFormat
    CSVQuote = #0
    CSVFieldDelimiter = ';'
    CSVRecordDelimiter = #0
    CSVTrueString = 'True'
    CSVFalseString = 'False'
    sfLocalFormat = []
    sfQuoteOnlyStrings = []
    sfNoHeader = []
    Version = '3.00'
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef]
    sfIndexDef = [sfSaveIndexDef]
    sfPlaceHolders = []
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    Left = 424
    Top = 56
  end
  object dsFindOper: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Caption'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SQL'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'FieldKinds'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NeedValue'
        DataType = ftBoolean
      end
      item
        Name = 'TwoValue'
        DataType = ftBoolean
      end
      item
        Name = 'IgnoreCase'
        DataType = ftBoolean
      end
      item
        Name = 'MultiSel'
        DataType = ftBoolean
      end
      item
        Name = 'MultiOr'
        DataType = ftBoolean
      end
      item
        Name = 'Order'
        DataType = ftInteger
      end
      item
        Name = 'Visible'
        DataType = ftBoolean
      end
      item
        Name = 'OwnValue'
        DataType = ftBoolean
      end
      item
        Name = 'OwnValName'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'OwnValKind'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SprName'
        DataType = ftString
        Size = 50
      end>
    IndexFieldNames = 'ORDER'
    IndexName = 'indOrder'
    IndexDefs = <
      item
        Name = 'indPrimary'
        Fields = 'NAME'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'indOrder'
        Fields = 'ORDER'
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
    Left = 212
    Top = 286
    object dsFindOperName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object dsFindOperCaption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object dsFindOperSQL: TStringField
      FieldName = 'SQL'
      Size = 300
    end
    object dsFindOperFieldKinds: TStringField
      FieldName = 'FieldKinds'
      Size = 50
    end
    object dsFindOperNeedValue: TBooleanField
      FieldName = 'NeedValue'
    end
    object dsFindOperTwoValue: TBooleanField
      FieldName = 'TwoValue'
    end
    object dsFindOperIgnoreCase: TBooleanField
      FieldName = 'IgnoreCase'
    end
    object dsFindOperMultiSel: TBooleanField
      FieldName = 'MultiSel'
    end
    object dsFindOperMultiOr: TBooleanField
      FieldName = 'MultiOr'
    end
    object dsFindOperOrder: TIntegerField
      FieldName = 'Order'
    end
    object dsFindOperVisible: TBooleanField
      FieldName = 'Visible'
    end
    object dsFindOperOwnValue: TBooleanField
      FieldName = 'OwnValue'
    end
    object dsFindOperOwnValName: TStringField
      FieldName = 'OwnValName'
      Size = 100
    end
    object dsFindOperOwnValKind: TStringField
      FieldName = 'OwnValKind'
      Size = 50
    end
    object dsFindOperSprName: TStringField
      FieldName = 'SprName'
      Size = 50
    end
  end
  object dsoFindOper: TDataSource
    DataSet = dsFindOper
    Left = 216
    Top = 333
  end
end
