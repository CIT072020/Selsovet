inherited dmBase: TdmBase
  OldCreateOrder = True
  Left = 480
  Top = 186
  Height = 532
  Width = 572
  inherited AdsConnection: TAdsConnection
    ConnectPath = 'E:\Projects\SelSovet7\Data\Base.add'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    Password = 'sysdba'
  end
  inherited AdsSharedConnection: TAdsConnection
    ConnectPath = 'E:\Projects\SelSovet7\Spr\SysSpr.add'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    Password = 'sysdba'
    Left = 152
    Top = 16
  end
  inherited WorkTable: TAdsTable
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    Left = 408
    Top = 16
  end
  inherited WorkQuery: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 336
    Top = 16
    ParamData = <>
  end
  inherited AdsSettings: TAdsSettings
    DateFormat = 'dd.mm.yyyy'
    SetDelphiDate = False
    NumCachedTables = 50
    NumCachedCursors = 50
    Left = 254
    Top = 14
  end
  object SprSoato: TAdsTable
    Tag = 1
    DatabaseName = 'AdsSharedConnection'
    IndexDefs = <
      item
        Name = 'PR_KEY'
        Fields = 'KOD'
        Options = [ixUnique]
      end>
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    FieldDefs = <
      item
        Name = 'KOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NAME_D'
        DataType = ftString
        Size = 30
      end>
    StoreDefs = True
    TableName = #1057#1087#1088#1057#1054#1040#1058#1054
    Left = 32
    Top = 80
  end
  object LookUpSoatoSovet: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = #1057#1087#1088#1057#1054#1040#1058#1054
    Left = 312
    Top = 80
  end
  object SprStran: TAdsTable
    Tag = 1
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'NOMER_KEY'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1057#1090#1088#1072#1085
    Left = 96
    Top = 80
  end
  object SprNac: TAdsTable
    Tag = 1
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = #1057#1087#1088#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1077#1081
    Left = 24
    Top = 128
  end
  object SprTypeUl: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1058#1080#1087#1059#1083#1080#1094
    Left = 176
    Top = 224
  end
  object SprUL: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1059#1083#1080#1094
    Left = 184
    Top = 280
  end
  object tbAllDokums: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1086#1079#1076#1072#1085#1080#1077#1054#1073#1098#1077#1082#1090#1072
    Left = 248
    Top = 232
  end
  object SprWork: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1052#1077#1089#1090#1056#1072#1073#1086#1090#1099
    Left = 40
    Top = 224
  end
  object SprDolg: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1044#1086#1083#1078#1085#1086#1089#1090#1077#1081
    Left = 104
    Top = 224
  end
  object tbDelObj: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1059#1076#1072#1083#1077#1085#1080#1077#1054#1073#1098#1077#1082#1090#1072
    Left = 112
    Top = 280
  end
  object AktZ: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'AktZ'
    Left = 248
    Top = 288
  end
  object LookUpCitizen: TAdsTable
    IndexName = 'NOMER_KEY'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1057#1090#1088#1072#1085
    Left = 312
    Top = 128
  end
  object LookupObl: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprPerevod'
    Left = 24
    Top = 384
  end
  object SvidSeria: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidSeria'
    Left = 320
    Top = 280
  end
  object LookupRN: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprPerevod'
    Left = 88
    Top = 384
  end
  object LookupGorod: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprPerevod'
    Left = 152
    Top = 384
  end
  object LookupRnGor: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprPerevod'
    Left = 224
    Top = 384
  end
  object TypePunkt: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'TypePunkt'
    Left = 168
    Top = 80
  end
  object SprTypeDok: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'SprTypeDok'
    Left = 168
    Top = 128
  end
  object SprVoenkom: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprVoenkom'
    Left = 232
    Top = 80
  end
  object LookUpPunkt: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 296
    Top = 392
    ParamData = <>
  end
  object LookupUL: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 368
    Top = 392
    ParamData = <>
  end
  object SprRovd: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprRovd'
    Left = 88
    Top = 128
  end
  object LockTypeObj: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'LockTypeObj'
    Left = 32
    Top = 280
  end
  object WorkQueryS: TAdsQuery
    DatabaseName = 'AdsSharedConnection'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    Left = 480
    Top = 16
    ParamData = <>
  end
  object SprMKB10: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprMKB10'
    Left = 232
    Top = 128
  end
  object tbAdres: TAdsTable
    Left = 504
    Top = 152
  end
  object tbMens: TAdsTable
    Left = 504
    Top = 208
  end
  object tbLich: TAdsTable
    Left = 496
    Top = 264
  end
  object SprNames: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsConnection
    TableName = 'SprNames'
    Left = 328
    Top = 232
  end
  object SprPunkt: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1053#1072#1089#1055#1091#1085#1082#1090#1086#1074
    Left = 496
    Top = 376
  end
  object SprPerevod: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsConnection
    TableName = 'SprPerevod'
    Left = 376
    Top = 224
  end
  object SprZAH: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsConnection
    TableName = 'SprZAH'
    Left = 104
    Top = 176
  end
  object SprOtnosh: TAdsTable
    AdsConnection = AdsConnection
    Left = 304
    Top = 192
  end
  object SprRazmer: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprRazmer'
    Left = 248
    Top = 336
  end
  object SysSprZah: TAdsTable
    Tag = 1
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'Gisun_SprZAH'
    Left = 176
    Top = 176
  end
  object tbUpdObj: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'UpdatingObj'
    Left = 496
    Top = 320
  end
end
