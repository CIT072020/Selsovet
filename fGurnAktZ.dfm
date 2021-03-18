inherited fmGurnAktZ: TfmGurnAktZ
  Left = 37
  Top = 125
  Width = 1021
  Height = 562
  ActiveControl = Grid
  Caption = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1091#1095#1072#1089#1090#1082#1086#1074' '#1076#1083#1103' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1081
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 1005
    Height = 59
    inherited TBToolbarMenu: TTBToolbar
      inherited TBItemGrantSprav: TTBItem
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      end
      inherited TBItemDelayRegister: TTBItem
        Visible = True
      end
      object TBItemAddGraf: TTBItem [16]
        Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1072#1092#1099
        ImageIndex = 104
        Visible = False
        OnClick = TBItemAddGrafClick
      end
      object TBItem1: TTBItem
        ImageIndex = 130
        Visible = False
        OnClick = TBItem1Click
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 0
      Top = 26
      Align = alLeft
      Caption = 'TBToolWindow'
      ClientAreaHeight = 29
      ClientAreaWidth = 1990
      DockPos = -9
      DockRow = 1
      TabOrder = 1
      object Label1: TLabel
        Left = 15
        Top = 8
        Width = 31
        Height = 13
        Caption = #1052#1077#1089#1090#1086
      end
      object Label2: TLabel
        Left = 325
        Top = 8
        Width = 30
        Height = 13
        Caption = #1050#1085#1080#1075#1072
      end
      object edSeek: TDBEditEh
        Left = 736
        Top = 2
        Width = 186
        Height = 24
        Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103
        EditButtons = <
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000232E0000232E00000000000000000001FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5BFBFBF9F9F9F88
              88888888889F9F9FBFBFBFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFCDCDCD9696969E9E9EACACACB5B5B5B5B5B5ACACAC9E9E9E969696CDCD
              CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF8E8E8EACACACB4B4B4B4B4B4B4
              B4B4B4B4B4B4B4B4B4B4B4ACACAC8E8E8ECFCFCFFFFFFFFFFFFFFFFFFFE8E8E8
              A0A0A0A9A9A9AFAFAFAFAFAF5F5F5FACACACAFAFAFAFAFAFAFAFAFAFAFAFA9A9
              A9A0A0A0E8E8E8FFFFFFFFFFFFC8C8C89E9E9EA9A9A9A9A9A9A9A9A900000049
              49499C9C9CA9A9A9A9A9A9A9A9A9A9A9A99E9E9EC8C8C8FFFFFFFFFFFFB1B1B1
              A0A0A0A3A3A3A3A3A3A3A3A30000000000002424247C7C7CA3A3A3A3A3A3A3A3
              A3A0A0A0B1B1B1FFFFFFFFFFFFA4A4A49D9D9D9D9D9D9D9D9D9D9D9D00000000
              00000000000707075454549D9D9D9D9D9D9D9D9DA4A4A4FFFFFFFFFFFFA8A8A8
              9797979696969696969696960000000000000000000606064F4F4F9696969696
              96979797A8A8A8FFFFFFFFFFFFBDBDBD96969690909090909090909000000000
              00001F1F1F6D6D6D909090909090909090969696BDBDBDFFFFFFFFFFFFD6D6D6
              9B9B9B8A8A8A8A8A8A8A8A8A0000003A3A3A7F7F7F8A8A8A8A8A8A8A8A8A8A8A
              8A9B9B9BD6D6D6FFFFFFFFFFFFEFEFEFBEBEBE8D8D8D85858585858547474782
              82828585858585858585858585858D8D8DBEBEBEEFEFEFFFFFFFFFFFFFFFFFFF
              E2E2E2BABABA8A8A8A8080808080808080808080808080808080808A8A8ABABA
              BAE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3C5C5C59B9B9B8B8B8B80
              80808080808B8B8B9B9B9BC5C5C5E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF2F2F2DEDEDECECECEC2C2C2C2C2C2CECECEDEDEDEF2F2F2FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Hint = #1053#1072#1081#1090#1080' (Enter)'
            Style = ebsGlyphEh
            Width = 24
            OnClick = edSeekEditButtons0Click
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
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' (Ctrl-E)'
            ShortCut = 16453
            Style = ebsGlyphEh
            OnClick = edSeekEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = edSeekChange
        OnEnter = edSeekEnter
        OnExit = edSeekExit
        OnKeyDown = edSeekKeyDown
      end
      object edTypeSeek: TComboBox
        Left = 486
        Top = 2
        Width = 228
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = #1060#1072#1084#1080#1083#1080#1103
        OnChange = edTypeSeekChange
        Items.Strings = (
          #1060#1072#1084#1080#1083#1080#1103
          #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
          #1041#1088#1086#1085#1100
          #1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1076#1077#1085'. '#1085#1086#1084#1077#1088#1086#1074
          #1044#1072#1090#1072' '#1082#1086#1088#1088'. > '#1076#1072#1090#1099' '#1086#1090#1087#1088'. '#1074' '#1043#1048#1057' '#1056#1053)
      end
      object edKlad: TDBLookupComboboxEh
        Left = 58
        Top = 2
        Width = 227
        Height = 24
        DropDownBox.Rows = 20
        EditButtons = <
          item
            Style = ebsGlyphEh
            OnClick = edKladEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsSprZah
        ParentFont = False
        TabOrder = 2
        Visible = True
        OnChange = edKladChange
      end
      object edBook: TDBNumberEditEh
        Left = 369
        Top = 2
        Width = 70
        Height = 24
        DecimalPlaces = 0
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <
          item
            Style = ebsGlyphEh
            OnClick = edBookEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 1000.000000000000000000
        MinValue = 1.000000000000000000
        ParentFont = False
        TabOrder = 3
        Visible = True
        OnChange = edBookChange
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Top = 85
    Width = 1005
    Height = 415
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 500
    Width = 1005
  end
  inherited TBDock24: TTBDock
    Top = 59
    Width = 1005
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
  object dsSprZah: TDataSource
    Left = 664
    Top = 64
  end
  object mtBooks: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'KLAD'
        DataType = ftInteger
      end
      item
        Name = 'BOOK'
        DataType = ftInteger
      end
      item
        Name = 'BOOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'BOOK_DATE_END'
        DataType = ftDate
      end
      item
        Name = 'ZH_TYPE'
        DataType = ftSmallint
      end>
    IndexFieldNames = 'KLAD;BOOK_DATE'
    IndexName = 'mtBooksIndex1'
    IndexDefs = <
      item
        Name = 'mtBooksIndex1'
        Fields = 'KLAD;BOOK_DATE'
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
    Left = 584
    Top = 136
    object mtBooksKLAD: TIntegerField
      FieldName = 'KLAD'
    end
    object mtBooksBOOK: TIntegerField
      FieldName = 'BOOK'
    end
    object mtBooksBOOK_DATE: TDateField
      FieldName = 'BOOK_DATE'
    end
    object mtBooksBOOK_DATE_END: TDateField
      FieldName = 'BOOK_DATE_END'
    end
    object mtBooksZH_TYPE: TSmallintField
      FieldName = 'ZH_TYPE'
    end
  end
  object mtAdres: TkbmMemTable
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
    Left = 488
    Top = 168
    object mtAdresAR_GOSUD: TIntegerField
      FieldName = 'AR_GOSUD'
    end
    object mtAdresAR_B_OBL: TBooleanField
      FieldName = 'AR_B_OBL'
    end
    object mtAdresAR_OBL: TStringField
      FieldName = 'AR_OBL'
      Size = 100
    end
    object mtAdresAR_RAION: TStringField
      FieldName = 'AR_RAION'
      Size = 100
    end
    object mtAdresAR_B_GOROD: TIntegerField
      FieldName = 'AR_B_GOROD'
    end
    object mtAdresAR_GOROD: TStringField
      FieldName = 'AR_GOROD'
      Size = 60
    end
    object mtAdresAR_GOROD_R: TStringField
      FieldName = 'AR_GOROD_R'
      Size = 100
    end
    object mtAdresAR_DOM: TStringField
      FieldName = 'AR_DOM'
      Size = 10
    end
    object mtAdresAR_KORP: TStringField
      FieldName = 'AR_KORP'
      Size = 10
    end
    object mtAdresAR_KV: TStringField
      FieldName = 'AR_KV'
      Size = 10
    end
  end
end
