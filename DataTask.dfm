object dmTask: TdmTask
  OldCreateOrder = False
  Left = 588
  Top = 335
  Height = 242
  Width = 436
  object AdsConnection: TAdsConnection
    StoreConnected = False
    Left = 48
    Top = 16
  end
  object AdsSharedConnection: TAdsConnection
    StoreConnected = False
    Left = 192
    Top = 8
  end
  object WorkTable: TAdsTable
    StoreActive = False
    Exclusive = True
    Left = 48
    Top = 72
  end
  object WorkQuery: TAdsQuery
    Left = 112
    Top = 72
    ParamData = <>
  end
  object AdsSettings: TAdsSettings
    DateFormat = 'dd.MM.yyyy'
    ShowDeleted = False
    AdsServerTypes = [stADS_LOCAL]
    NumCachedCursors = 20
    Left = 206
    Top = 86
  end
end
