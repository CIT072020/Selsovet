inherited dmLichSchet: TdmLichSchet
  OldCreateOrder = True
  Left = 606
  Top = 216
  Height = 330
  Width = 469
  inherited mtDokument: TkbmMemTable
    object mtDokumentADRES_ID: TIntegerField [1]
      FieldName = 'ADRES_ID'
    end
    object mtDokumentGRUPPA: TIntegerField [2]
      FieldName = 'GRUPPA'
    end
    object mtDokumentKADASTR: TStringField [3]
      FieldName = 'KADASTR'
      Size = 18
    end
    object mtDokumentKNIGA_NOMER: TStringField [4]
      FieldName = 'KNIGA_NOMER'
      Size = 8
    end
    object mtDokumentADRES_TEXT: TStringField [5]
      FieldName = 'ADRES_TEXT'
      Size = 200
    end
    object mtDokumentPUNKT: TIntegerField [6]
      FieldName = 'PUNKT'
    end
    object mtDokumentPUNKT_NAME: TStringField [7]
      FieldName = 'PUNKT_NAME'
      Size = 100
    end
    object mtDokumentUL: TIntegerField [8]
      FieldName = 'UL'
    end
    object mtDokumentUL_NAME: TStringField [9]
      FieldName = 'UL_NAME'
      Size = 100
    end
    object mtDokumentDOM: TStringField [10]
      FieldName = 'DOM'
      Size = 10
    end
    object mtDokumentKORP: TStringField [11]
      FieldName = 'KORP'
      Size = 10
    end
    object mtDokumentKV: TStringField [12]
      FieldName = 'KV'
      Size = 10
    end
    object mtDokumentNOT_DOM: TBooleanField [13]
      FieldName = 'NOT_DOM'
    end
    object mtDokumentNAMEHOUSE: TStringField [14]
      FieldName = 'NAMEHOUSE'
      Size = 100
    end
    object mtDokumentFIRST: TIntegerField [15]
      FieldName = 'FIRST'
    end
    object mtDokumentFIRST_FIO: TStringField [16]
      FieldName = 'FIRST_FIO'
      Size = 60
    end
    object mtDokumentKNIGA_STR: TStringField [17]
      FieldName = 'KNIGA_STR'
      Size = 5
    end
    object mtDokumentDOPOLN: TMemoField [19]
      FieldName = 'DOPOLN'
      BlobType = ftMemo
    end
    object mtDokumentOWN_HOUSE: TBooleanField [20]
      FieldName = 'OWN_HOUSE'
    end
    object mtDokumentDATE_SOZD: TDateField [21]
      FieldName = 'DATE_SOZD'
    end
    object mtDokumentDATE_LIKV: TDateField [22]
      FieldName = 'DATE_LIKV'
    end
    object mtDokumentPRICH_SOZD: TIntegerField [23]
      FieldName = 'PRICH_SOZD'
    end
    object mtDokumentPRICH_LIKV: TIntegerField [24]
      FieldName = 'PRICH_LIKV'
    end
    object mtDokumentTYPEHOUSE: TIntegerField [25]
      FieldName = 'TYPEHOUSE'
    end
    object mtDokumentNOMER_TWO_S: TIntegerField [26]
      FieldName = 'NOMER_TWO_S'
    end
    object mtDokumentNOMER_TWO_L: TIntegerField [27]
      FieldName = 'NOMER_TWO_L'
    end
    object mtDokumentCANDELETE: TBooleanField [29]
      FieldName = 'CANDELETE'
    end
    object mtDokumentTELEFON: TStringField [30]
      FieldName = 'TELEFON'
      Size = 30
    end
    object mtDokumentTAIL: TStringField [31]
      FieldName = 'TAIL'
      Size = 10
    end
    object mtDokumentPREDST: TIntegerField [32]
      FieldName = 'PREDST'
    end
    object mtDokumentETAG: TIntegerField [33]
      FieldName = 'ETAG'
    end
    object mtDokumentKOL_ETAG: TIntegerField [34]
      FieldName = 'KOL_ETAG'
    end
    object mtDokumentPRESENT: TBooleanField [35]
      FieldName = 'PRESENT'
    end
    object mtDokumentDOGOVOR: TMemoField [36]
      FieldName = 'DOGOVOR'
      BlobType = ftMemo
    end
    object mtDokumentPRIVATE_SECT: TBooleanField [37]
      FieldName = 'PRIVATE_SECT'
    end
    object mtDokumentCONTROL: TIntegerField [38]
      FieldName = 'CONTROL'
    end
    object mtDokumentOSNOV_ID: TIntegerField [39]
      FieldName = 'OSNOV_ID'
    end
    object mtDokumentOSNOV_DATE: TDateField [40]
      FieldName = 'OSNOV_DATE'
    end
    object mtDokumentOSNOV_NOMER: TStringField [41]
      FieldName = 'OSNOV_NOMER'
      Size = 15
    end
    object mtDokumentABONENT_GAZ: TStringField
      FieldName = 'ABONENT_GAZ'
      Size = 10
    end
    object mtDokumentNOT_STAT: TBooleanField
      FieldName = 'NOT_STAT'
    end
    object mtDokumentUSE_GILFOND: TIntegerField
      FieldName = 'USE_GILFOND'
    end
    object mtDokumentPL_ZANIM: TFloatField
      FieldName = 'PL_ZANIM'
    end
    object mtDokumentTAIL_HOUSE: TStringField
      FieldName = 'TAIL_HOUSE'
      Size = 25
    end
    object mtDokumentKOM_ZANIM: TSmallintField
      FieldName = 'KOM_ZANIM'
    end
    object mtDokumentDATE_LPX1: TDateField
      FieldName = 'DATE_LPX1'
    end
    object mtDokumentDATE_LPX2: TDateField
      FieldName = 'DATE_LPX2'
    end
    object mtDokumentMNS_LPX: TBooleanField
      FieldName = 'MNS_LPX'
    end
    object mtDokumentPLOSH_UCH: TFloatField
      FieldName = 'PLOSH_UCH'
    end
    object mtDokumentUCH_NOMER: TStringField
      FieldName = 'UCH_NOMER'
      Size = 18
    end
  end
  inherited tbHistory: TkbmMemTable
    Left = 208
  end
  inherited tbResh: TkbmMemTable
    IndexDefs = <
      item
        Name = 'tbReshIndex1'
        Fields = 'DATER;TIP'
        Options = [ixDescending]
      end>
  end
  object tbPriznaki: TkbmMemTable
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
    Left = 144
    Top = 24
    object tbPriznakiKOD: TIntegerField
      FieldName = 'KOD'
    end
    object tbPriznakiNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = dmBase.SprPrLich
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'KOD'
      Size = 100
      Lookup = True
    end
  end
  object frDBPriznaki: TfrDBDataSet
    DataSet = tbPriznaki
    Left = 144
    Top = 128
  end
  object tbDokumens: TkbmMemTable
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
    Left = 272
    Top = 24
    object tbDokumensDate_Dok: TDateField
      FieldName = 'Date_Dok'
    end
    object tbDokumensTypeDok: TIntegerField
      FieldName = 'TypeDok'
    end
    object tbDokumensNomer: TStringField
      FieldName = 'Nomer'
    end
    object tbDokumensKomm: TMemoField
      FieldName = 'Komm'
      BlobType = ftMemo
    end
    object tbDokumensSubject: TMemoField
      FieldName = 'Subject'
      BlobType = ftMemo
    end
  end
  object tbHouseOwners: TkbmMemTable
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
    Left = 128
    Top = 192
    object tbHouseOwnersNOMER: TSmallintField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NOMER'
    end
    object tbHouseOwnersTYPEKOD: TSmallintField
      FieldName = 'TYPEKOD'
    end
    object tbHouseOwnersKOD: TIntegerField
      FieldName = 'KOD'
    end
    object tbHouseOwnersTAIL: TStringField
      DisplayLabel = #1063#1072#1089#1090#1100
      FieldName = 'TAIL'
    end
    object tbHouseOwnersDATES: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATES'
    end
    object tbHouseOwnersDATEP: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086
      FieldName = 'DATEP'
    end
    object tbHouseOwnersPRIM: TMemoField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object tbHouseOwnersADRES: TStringField
      FieldName = 'ADRES'
      Size = 150
    end
    object tbHouseOwnersNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object tbHouseOwnersPROPIS: TBooleanField
      FieldName = 'PROPIS'
    end
  end
end
