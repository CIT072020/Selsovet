inherited dmAdres: TdmAdres
  OldCreateOrder = True
  Left = 557
  Top = 245
  Height = 315
  Width = 490
  inherited mtDokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATE_FIKS'
        DataType = ftDate
      end
      item
        Name = 'PUNKT'
        DataType = ftInteger
      end
      item
        Name = 'UL'
        DataType = ftInteger
      end
      item
        Name = 'DOM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KORP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'KV'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TIP'
        DataType = ftInteger
      end
      item
        Name = 'PRIM'
        DataType = ftMemo
      end
      item
        Name = 'OSNOV'
        DataType = ftMemo
      end
      item
        Name = 'OSNOV_DATE'
        DataType = ftDate
      end
      item
        Name = 'UCH_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ETAG'
        DataType = ftInteger
      end
      item
        Name = 'KOL_ETAG'
        DataType = ftInteger
      end
      item
        Name = 'PREDST'
        DataType = ftInteger
      end
      item
        Name = 'GILFOND'
        DataType = ftSmallint
      end
      item
        Name = 'NOT_DOM'
        DataType = ftBoolean
      end>
    object mtDokumentADRES_TEXT: TStringField
      FieldName = 'ADRES_TEXT'
      Size = 150
    end
    object mtDokumentPUNKT: TIntegerField
      FieldName = 'PUNKT'
    end
    object mtDokumentPUNKT_NAME: TStringField
      FieldName = 'PUNKT_NAME'
      Size = 100
    end
    object mtDokumentUL: TIntegerField
      FieldName = 'UL'
    end
    object mtDokumentUL_NAME: TStringField
      FieldName = 'UL_NAME'
      Size = 100
    end
    object mtDokumentDOM: TStringField
      FieldName = 'DOM'
      Size = 7
    end
    object mtDokumentKORP: TStringField
      FieldName = 'KORP'
      Size = 7
    end
    object mtDokumentKV: TStringField
      FieldName = 'KV'
      Size = 7
    end
    object mtDokumentNOT_DOM: TBooleanField
      FieldName = 'NOT_DOM'
    end
    object mtDokumentNAMEHOUSE: TStringField
      FieldName = 'NAMEHOUSE'
      Size = 100
    end
    object mtDokumentTIP: TIntegerField
      FieldName = 'TIP'
    end
    object mtDokumentPRIM: TMemoField
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object mtDokumentOSNOV: TMemoField
      FieldName = 'OSNOV'
      BlobType = ftMemo
    end
    object mtDokumentOSNOV_NOMER: TStringField
      FieldName = 'OSNOV_NOMER'
      Size = 12
    end
    object mtDokumentOSNOV_DATE: TDateField
      FieldName = 'OSNOV_DATE'
    end
    object mtDokumentPLOSH_UCH: TFloatField
      FieldName = 'PLOSH_UCH'
    end
    object mtDokumentUCH_TYPEOWNER: TIntegerField
      FieldName = 'UCH_TYPEOWNER'
    end
    object mtDokumentUCH_NOMER: TStringField
      FieldName = 'UCH_NOMER'
      Size = 18
    end
    object mtDokumentUCH_PRED_DATE: TDateField
      FieldName = 'UCH_PRED_DATE'
    end
    object mtDokumentUCH_FOR: TSmallintField
      FieldName = 'UCH_FOR'
    end
    object mtDokumentUCH_ISKL_DATE: TDateField
      FieldName = 'UCH_ISKL_DATE'
    end
    object mtDokumentUCH_ISKL_OSNOV: TMemoField
      FieldName = 'UCH_ISKL_OSNOV'
      BlobType = ftMemo
    end
    object mtDokumentUCH_PRIM: TMemoField
      FieldName = 'UCH_PRIM'
      BlobType = ftMemo
    end
    object mtDokumentETAG: TIntegerField
      FieldName = 'ETAG'
      MaxValue = 100
    end
    object mtDokumentKOL_ETAG: TIntegerField
      FieldName = 'KOL_ETAG'
      MaxValue = 100
    end
    object mtDokumentPREDST: TIntegerField
      FieldName = 'PREDST'
    end
    object mtDokumentGILFOND: TSmallintField
      FieldName = 'GILFOND'
    end
    object mtDokumentDATE_KN: TDateField
      FieldName = 'DATE_KN'
    end
    object mtDokumentKOLVO_KN: TSmallintField
      FieldName = 'KOLVO_KN'
      MaxValue = 999
    end
    object mtDokumentABONENT_GAZ: TStringField
      FieldName = 'ABONENT_GAZ'
      Size = 10
    end
    object mtDokumentMS_DATE: TDateField
      FieldName = 'MS_DATE'
    end
    object mtDokumentMS_API: TSmallintField
      FieldName = 'MS_API'
    end
    object mtDokumentMS_OUT: TSmallintField
      FieldName = 'MS_OUT'
    end
    object mtDokumentMS_OTOPL: TBooleanField
      FieldName = 'MS_OTOPL'
    end
    object mtDokumentMS_ELPR: TBooleanField
      FieldName = 'MS_ELPR'
    end
    object mtDokumentMS_PRIM: TMemoField
      FieldName = 'MS_PRIM'
      BlobType = ftMemo
    end
    object mtDokumentMS_ZA_PRED: TBooleanField
      FieldName = 'MS_ZA_PRED'
    end
    object mtDokumentSPEC_UCH: TBooleanField
      FieldName = 'SPEC_UCH'
    end
    object mtDokumentNOM_XOZ: TIntegerField
      FieldName = 'NOM_XOZ'
    end
  end
  inherited tbDopProp: TkbmMemTable
    Top = 88
  end
  inherited tbPropertys: TkbmMemTable
    Top = 152
  end
  inherited tbResh: TkbmMemTable
    IndexDefs = <
      item
        Name = 'tbReshIndex1'
        Fields = 'DATER;TIP'
        Options = [ixDescending]
      end>
    Left = 160
    Top = 96
  end
  object mtLichSchet: TkbmMemTable
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
    Left = 120
    Top = 48
    object mtLichSchetNOMER: TStringField
      FieldName = 'NOMER'
      Size = 12
    end
    object mtLichSchetFIRST: TIntegerField
      FieldName = 'FIRST'
    end
    object mtLichSchetFIO: TStringField
      FieldName = 'FIO'
      Size = 70
    end
    object mtLichSchetKNIGA_NOMER: TStringField
      FieldName = 'KNIGA_NOMER'
      Size = 5
    end
    object mtLichSchetKNIGA_STR: TStringField
      FieldName = 'KNIGA_STR'
      Size = 5
    end
    object mtLichSchetTELEFON: TStringField
      FieldName = 'TELEFON'
      Size = 30
    end
    object mtLichSchetDATE_SOZD: TDateField
      FieldName = 'DATE_SOZD'
    end
    object mtLichSchetDATE_LIKV: TDateField
      FieldName = 'DATE_LIKV'
    end
    object mtLichSchetCANDELETE: TBooleanField
      FieldName = 'CANDELETE'
    end
    object mtLichSchetPRESENT: TBooleanField
      FieldName = 'PRESENT'
    end
    object mtLichSchetOWN_HOUSE: TBooleanField
      FieldName = 'OWN_HOUSE'
    end
    object mtLichSchetTYPEHOUSE: TIntegerField
      FieldName = 'TYPEHOUSE'
    end
  end
  object tbHouseProps: TkbmMemTable
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
    Left = 216
    Top = 64
    object tbHousePropsKOD: TSmallintField
      FieldName = 'KOD'
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
    Left = 216
    Top = 120
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
    object tbHouseOwnersADRES: TStringField
      FieldName = 'ADRES'
      Size = 150
    end
    object tbHouseOwnersPRIM: TMemoField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object tbHouseOwnersNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object tbHouseOwnersPROPIS: TBooleanField
      FieldName = 'PROPIS'
    end
  end
  object mtBigHouse: TkbmMemTable
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
    Left = 120
    Top = 144
    object mtBigHouseID: TIntegerField
      FieldName = 'ID'
    end
    object mtBigHousePUNKT: TIntegerField
      FieldName = 'PUNKT'
    end
    object mtBigHouseUL: TIntegerField
      FieldName = 'UL'
    end
    object mtBigHouseDOM: TStringField
      FieldName = 'DOM'
      Size = 5
    end
    object mtBigHouseKORP: TStringField
      FieldName = 'KORP'
      Size = 5
    end
    object mtBigHouseNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object mtBigHouseKOL_ETAG: TSmallintField
      FieldName = 'KOL_ETAG'
    end
    object mtBigHouseKOL_KV: TSmallintField
      FieldName = 'KOL_KV'
    end
    object mtBigHouseGILOE: TBooleanField
      FieldName = 'GILOE'
    end
    object mtBigHouseCHET: TBooleanField
      FieldName = 'CHET'
    end
    object mtBigHouseOTDELNO: TBooleanField
      FieldName = 'OTDELNO'
    end
    object mtBigHouseTIP: TIntegerField
      FieldName = 'TIP'
    end
    object mtBigHouseTYPE_VOZV: TIntegerField
      FieldName = 'TYPE_VOZV'
    end
    object mtBigHouseGOD_VOZV: TSmallintField
      FieldName = 'GOD_VOZV'
    end
    object mtBigHouseMAT_STEN: TSmallintField
      FieldName = 'MAT_STEN'
    end
    object mtBigHousePLOSH_ZDAN: TFloatField
      FieldName = 'PLOSH_ZDAN'
    end
    object mtBigHouseKANALIZ: TBooleanField
      FieldName = 'KANALIZ'
    end
    object mtBigHouseCENT_OTOP: TBooleanField
      FieldName = 'CENT_OTOP'
    end
    object mtBigHouseGOR_VODA: TBooleanField
      FieldName = 'GOR_VODA'
    end
    object mtBigHouseVODOPROV: TBooleanField
      FieldName = 'VODOPROV'
    end
    object mtBigHouseGAZ: TBooleanField
      FieldName = 'GAZ'
    end
    object mtBigHouseLIFT: TBooleanField
      FieldName = 'LIFT'
    end
    object mtBigHouseMUSOROPR: TBooleanField
      FieldName = 'MUSOROPR'
    end
    object mtBigHousePRIVATE_SECT: TBooleanField
      FieldName = 'PRIVATE_SECT'
    end
    object mtBigHouseCONTROL: TIntegerField
      FieldName = 'CONTROL'
    end
    object mtBigHouseUSE_GILFOND: TIntegerField
      FieldName = 'USE_GILFOND'
    end
  end
  object tbHouseOwnersHist: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'DATES;NOMER'
    IndexDefs = <
      item
        Name = 'tbHouseOwnersHistIndex1'
        Fields = 'DATES;NOMER'
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
    Left = 216
    Top = 176
    object tbHouseOwnersHistNOMER: TSmallintField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NOMER'
    end
    object tbHouseOwnersHistTYPEKOD: TSmallintField
      FieldName = 'TYPEKOD'
    end
    object tbHouseOwnersHistKOD: TIntegerField
      FieldName = 'KOD'
    end
    object tbHouseOwnersHistTAIL: TStringField
      DisplayLabel = #1063#1072#1089#1090#1100
      FieldName = 'TAIL'
    end
    object tbHouseOwnersHistDATES: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATES'
    end
    object tbHouseOwnersHistDATEP: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086
      FieldName = 'DATEP'
    end
    object tbHouseOwnersHistADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object tbHouseOwnersHistPRIM: TMemoField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      BlobType = ftMemo
    end
    object tbHouseOwnersHistNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object tbHouseOwnersHistNAME_MEN: TStringField
      FieldName = 'NAME_MEN'
      Size = 30
    end
    object tbHouseOwnersHistOTCH_MEN: TStringField
      FieldName = 'OTCH_MEN'
      Size = 30
    end
    object tbHouseOwnersHistDATE_ROGD: TDateField
      FieldName = 'DATE_ROGD'
    end
    object tbHouseOwnersHistDATE_SMER: TDateField
      FieldName = 'DATE_SMER'
    end
    object tbHouseOwnersHistLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 14
    end
    object tbHouseOwnersHistUNP: TStringField
      FieldName = 'UNP'
      Size = 9
    end
    object tbHouseOwnersHistPASSPORT: TMemoField
      FieldName = 'PASSPORT'
      BlobType = ftMemo
    end
    object tbHouseOwnersHistTELEFON: TStringField
      FieldName = 'TELEFON'
      Size = 30
    end
  end
end
