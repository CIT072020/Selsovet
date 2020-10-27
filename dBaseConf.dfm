inherited dmBaseConf: TdmBaseConf
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Left = 474
  Top = 227
  Height = 311
  Width = 499
  inherited AdsConnection: TAdsConnection
    LoginPrompt = False
    Username = 'adssys'
    Password = 'sysdba'
    Left = 40
  end
  inherited AdsSharedConnection: TAdsConnection
    LoginPrompt = False
    Username = 'adssys'
    Password = 'sysdba'
    Left = 136
  end
  inherited WorkTable: TAdsTable
    DatabaseName = 'AdsConnection'
    AdsConnection = AdsConnection
    Left = 32
    Top = 80
  end
  inherited WorkQuery: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 104
    Top = 80
    ParamData = <>
  end
  inherited AdsSettings: TAdsSettings
    Left = 198
    Top = 78
  end
  object NewConn: TAdsConnection
    LoginPrompt = False
    Left = 48
    Top = 160
  end
  object AdsDictionary: TAdsDictionary
    LoginPrompt = False
    Left = 240
    Top = 16
  end
  object NewDict: TAdsDictionary
    LoginPrompt = False
    Left = 104
    Top = 160
  end
end
