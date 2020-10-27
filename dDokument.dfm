object dmDokument: TdmDokument
  OldCreateOrder = False
  Left = 495
  Top = 233
  Height = 325
  Width = 474
  object mtDokument: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 2
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DATE_FIKS'
        DataType = ftDate
      end
      item
        Name = 'NEWDOK'
        DataType = ftBoolean
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
    Left = 48
    Top = 16
    object mtDokumentID: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'ID'
    end
    object mtDokumentNOMER: TStringField
      FieldName = 'NOMER'
      Size = 12
    end
    object mtDokumentDATE_FIKS: TDateField
      FieldName = 'DATE_FIKS'
    end
    object mtDokumentNEWDOK: TBooleanField
      FieldName = 'NEWDOK'
    end
  end
  object tbDopProp: TkbmMemTable
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
    AfterOpen = tbDopPropAfterOpen
    Left = 48
    Top = 72
  end
  object tbPropertys: TkbmMemTable
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
    Left = 40
    Top = 136
    object tbPropertysNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object tbPropertysVALUE: TMemoField
      FieldName = 'VALUE'
      BlobType = ftMemo
    end
    object tbPropertysTYPE: TIntegerField
      FieldName = 'TYPE'
    end
  end
  object tbHistory: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'HistoryIndex'
    IndexDefs = <
      item
        Name = 'HistoryIndex'
        Fields = 'fieldname;dateizm'
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
    Left = 176
    Top = 18
    object tbHistoryID: TIntegerField
      FieldName = 'ID'
    end
    object tbHistoryFieldName: TStringField
      FieldName = 'FieldName'
      Size = 15
    end
    object tbHistoryValue: TStringField
      FieldName = 'Value'
      Size = 70
    end
    object tbHistoryStringValue: TStringField
      FieldName = 'StringValue'
      Size = 200
    end
    object tbHistoryDateIzm: TDateTimeField
      FieldName = 'DateIzm'
    end
    object tbHistoryTypeDate: TSmallintField
      FieldName = 'TypeDate'
    end
    object tbHistoryDatePropis: TSmallintField
      FieldName = 'DatePropis'
    end
    object tbHistoryInfo: TStringField
      FieldName = 'Info'
      Size = 200
    end
  end
  object tbResh: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'tbReshIndex1'
    IndexDefs = <
      item
        Name = 'tbReshIndex1'
        DescFields = 'DATER;TIP'
        Fields = 'DATER;TIP'
        Options = [ixDescending]
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
    Left = 176
    Top = 88
    object tbReshID: TIntegerField
      FieldName = 'ID'
    end
    object tbReshWHAT: TSmallintField
      FieldName = 'WHAT'
    end
    object tbReshTIP: TIntegerField
      FieldName = 'TIP'
    end
    object tbReshPURPOSE: TIntegerField
      FieldName = 'PURPOSE'
    end
    object tbReshDATER: TDateField
      FieldName = 'DATER'
    end
    object tbReshNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object tbReshNVALUE: TFloatField
      FieldName = 'NVALUE'
    end
    object tbReshSROK: TDateField
      FieldName = 'SROK'
    end
    object tbReshDATEO: TDateField
      FieldName = 'DATEO'
    end
    object tbReshPRIM: TMemoField
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object tbReshMESTO: TStringField
      FieldName = 'MESTO'
      Size = 200
    end
    object tbReshADRES_ID: TIntegerField
      FieldName = 'ADRES_ID'
    end
    object tbReshID_OTM: TIntegerField
      FieldName = 'ID_OTM'
    end
  end
  object tbNalogi: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'PR_KEY'
    IndexDefs = <
      item
        Name = 'PR_KEY'
        Fields = 'GOD;NALOG;TYPEOBJ;DATE_OPL;ID'
        Options = [ixUnique, ixDescending]
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
    AfterInsert = tbNalogiAfterInsert
    BeforePost = tbNalogiBeforePost
    OnCalcFields = tbNalogiCalcFields
    Left = 288
    Top = 88
    object tbNalogiGOD: TSmallintField
      FieldName = 'GOD'
    end
    object tbNalogiNALOG: TSmallintField
      FieldName = 'NALOG'
    end
    object tbNalogiPERIOD: TSmallintField
      DefaultExpression = '1'
      FieldName = 'PERIOD'
    end
    object tbNalogiTYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
    end
    object tbNalogiID: TIntegerField
      FieldName = 'ID'
    end
    object tbNalogiNOMER: TSmallintField
      DefaultExpression = '1'
      FieldName = 'NOMER'
    end
    object tbNalogiDATE_VIST: TDateField
      FieldName = 'DATE_VIST'
    end
    object tbNalogiDATE_SROK: TDateField
      FieldName = 'DATE_SROK'
    end
    object tbNalogiSUMMA_VIST: TFloatField
      FieldName = 'SUMMA_VIST'
    end
    object tbNalogiDATE_OPL: TDateField
      FieldName = 'DATE_OPL'
    end
    object tbNalogiSUMMA_OPL: TFloatField
      FieldName = 'SUMMA_OPL'
    end
    object tbNalogiNOMER_OPL: TStringField
      FieldName = 'NOMER_OPL'
      Size = 15
    end
    object tbNalogiNALOG_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'NALOG_NAME'
      LookupDataSet = dmBase.SprNalogi
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'NALOG'
      Size = 70
      Lookup = True
    end
    object tbNalogiDELTA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DELTA'
      Calculated = True
    end
    object tbNalogiMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
    end
  end
end
