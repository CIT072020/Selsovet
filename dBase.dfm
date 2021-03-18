inherited dmBase: TdmBase
  OldCreateOrder = True
  Left = 390
  Top = 193
  Height = 606
  Width = 805
  inherited AdsConnection: TAdsConnection
    ConnectPath = 'E:\Projects\SelSovet7\Data\SelSovet.add'
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
    Left = 160
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
  object SprPunkt: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1053#1072#1089#1055#1091#1085#1082#1090#1086#1074
    Left = 200
    Top = 120
  end
  object LookUpSoatoSovet: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = #1057#1087#1088#1057#1054#1040#1058#1054
    Left = 256
    Top = 504
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
  object SprLgot: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1051#1100#1075#1086#1090#1085#1080#1082#1086#1074
    Left = 392
    Top = 80
  end
  object SprTypeUl: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1058#1080#1087#1059#1083#1080#1094
    Left = 464
    Top = 136
  end
  object SprUL: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1059#1083#1080#1094
    Left = 448
    Top = 80
  end
  object tbLich: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1051#1080#1094#1077#1074#1099#1077#1057#1095#1077#1090#1072
    Left = 16
    Top = 254
  end
  object tbAdres: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1041#1072#1079#1072#1044#1086#1084#1086#1074
    Left = 112
    Top = 254
  end
  object tbMens: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077
    Left = 320
    Top = 270
  end
  object tbMensDvig: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077#1044#1074#1080#1078#1077#1085#1080#1077
    Left = 376
    Top = 272
  end
  object tbAllDokums: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1086#1079#1076#1072#1085#1080#1077#1054#1073#1098#1077#1082#1090#1072
    Left = 552
    Top = 272
  end
  object sprEdIzm: TAdsTable
    Tag = 1
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = #1057#1087#1088#1045#1076#1048#1079#1084#1077#1088#1077#1085#1080#1103
    Left = 80
    Top = 128
  end
  object tbPropMemo: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1041#1072#1079#1072#1057#1090#1088#1086#1082
    Left = 88
    Top = 312
  end
  object tbProp: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1041#1072#1079#1072#1057#1074#1086#1081#1089#1090#1074#1054#1073#1098#1077#1082#1090#1086#1074
    Left = 160
    Top = 254
  end
  object SprPrNasel: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1055#1088#1053#1072#1089#1077#1083#1077#1085#1080#1103
    Left = 144
    Top = 192
  end
  object SprPrLich: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1055#1088#1051#1080#1094#1057#1095#1077#1090#1072
    Left = 552
    Top = 40
  end
  object tbMensPr: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077#1055#1088#1080#1079#1085#1072#1082#1080
    Left = 160
    Top = 312
  end
  object tbMensLgot: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1053#1072#1089#1077#1083#1077#1085#1080#1077#1051#1100#1075#1086#1090#1099
    Left = 448
    Top = 272
  end
  object tbLichPr: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1051#1080#1094#1077#1074#1099#1077#1057#1095#1077#1090#1072#1055#1088#1080#1079#1085#1072#1082#1080
    Left = 24
    Top = 312
  end
  object SprOtnosh: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1054#1090#1085#1086#1096#1077#1085#1080#1081
    Left = 456
    Top = 208
  end
  object SprUchZaved: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1059#1095#1047#1072#1074#1077#1076#1077#1085#1080#1081
    Left = 376
    Top = 200
  end
  object SprWork: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1052#1077#1089#1090#1056#1072#1073#1086#1090#1099
    Left = 216
    Top = 192
  end
  object SprDolg: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1044#1086#1083#1078#1085#1086#1089#1090#1077#1081
    Left = 296
    Top = 208
  end
  object SprTypePens: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexDefs = <
      item
        Name = 'PR_KEY'
        Fields = 'ID'
        Options = [ixUnique]
      end
      item
        Name = 'NAME_KEY'
        Fields = 'NAME'
      end>
    IndexName = 'PR_KEY'
    StoreActive = False
    AdsConnection = AdsConnection
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end>
    StoreDefs = True
    TableName = #1057#1087#1088#1058#1080#1087#1086#1074#1055#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074
    Left = 328
    Top = 144
  end
  object SprTypeMigr: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1058#1080#1087#1052#1080#1075#1088#1072#1094#1080#1080
    Left = 400
    Top = 136
  end
  object SprMatSten: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1052#1072#1090#1077#1088#1080#1072#1083#1057#1090#1077#1085
    Left = 472
    Top = 32
  end
  object SprPrSozd: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1055#1088#1080#1095#1080#1085#1057#1086#1079#1076
    Left = 528
    Top = 128
  end
  object SprPrLikv: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1055#1088#1080#1095#1080#1085#1051#1080#1082#1074
    Left = 536
    Top = 176
  end
  object SprTypeHouse: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1058#1080#1087#1046#1080#1083#1100#1103
    Left = 520
    Top = 224
  end
  object tbDelObj: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1059#1076#1072#1083#1077#1085#1080#1077#1054#1073#1098#1077#1082#1090#1072
    Left = 216
    Top = 264
  end
  object tbPassports: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1055#1072#1089#1087#1086#1088#1090
    Left = 24
    Top = 368
  end
  object tbPaspChildren: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1055#1072#1089#1087#1086#1088#1090#1044#1077#1090#1080
    Left = 96
    Top = 368
  end
  object tbPaspOsnov: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1055#1072#1089#1087#1086#1088#1090#1054#1089#1085#1086#1074#1072#1085#1080#1103
    Left = 168
    Top = 368
  end
  object tbZapisBrak: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077#1041#1088#1072#1082#1086#1074
    Left = 264
    Top = 328
  end
  object tbZapisRogd: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1040#1082#1090#1099#1056#1086#1078#1076#1077#1085#1080#1081
    Left = 336
    Top = 328
  end
  object tbZapisSmert: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1040#1082#1090#1099#1057#1084#1077#1088#1090#1077#1081
    Left = 408
    Top = 328
  end
  object tbZapisUstOtc: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1040#1082#1090#1099#1059#1089#1090#1054#1090#1094#1086#1074#1089#1090#1074#1072
    Left = 488
    Top = 328
  end
  object tbTalonPrib: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1058#1072#1083#1086#1085#1099#1055#1088#1080#1073#1099#1090#1080#1103
    Left = 264
    Top = 384
  end
  object tbTalonPribDeti: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1058#1072#1083#1086#1085#1099#1055#1088#1080#1073#1099#1090#1080#1103#1044#1077#1090#1080
    Left = 344
    Top = 384
  end
  object SprIst: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1057#1087#1088#1048#1089#1090#1057#1091#1097#1077#1089#1090#1074#1086#1074#1072#1085#1080#1103
    Left = 272
    Top = 72
  end
  object tbTalonUbit: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1058#1072#1083#1086#1085#1099#1059#1073#1099#1090#1080#1103
    Left = 432
    Top = 384
  end
  object tbTalonUbitDeti: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = #1058#1072#1083#1086#1085#1099#1059#1073#1099#1090#1080#1103#1044#1077#1090#1080
    Left = 512
    Top = 384
  end
  object tbNalogi: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'Nalogi'
    Left = 24
    Top = 416
  end
  object SprNalogi: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'SprNalog'
    Left = 144
    Top = 128
  end
  object SprNames: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexDefs = <
      item
        Name = 'PR_KEY'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'SOATO_KEY'
        Fields = 'SOATO'
      end>
    IndexName = 'PR_KEY'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'NAME_B'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'KNAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'KNAME_B'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HANDLED'
        DataType = ftBoolean
      end
      item
        Name = 'SHTAMP'
        DataType = ftMemo
        Size = 1
      end>
    StoreDefs = True
    TableName = 'SprNames'
    Left = 592
    Top = 96
  end
  object LookUpCitizen: TAdsTable
    IndexName = 'NOMER_KEY'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = #1057#1087#1088#1057#1090#1088#1072#1085
    Left = 128
    Top = 416
  end
  object LookupObl: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprPerevod'
    Left = 344
    Top = 504
  end
  object SvidPovtor: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidPovtor'
    Left = 480
    Top = 440
  end
  object SvidSeria: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SvidSeria'
    Left = 552
    Top = 440
  end
  object LookupRN: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprPerevod'
    Left = 424
    Top = 504
  end
  object SprPredst: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprPredst'
    Left = 592
    Top = 184
  end
  object LookupGorod: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprPerevod'
    Left = 496
    Top = 504
  end
  object LookupRnGor: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SprPerevod'
    Left = 600
    Top = 496
  end
  object tbDeclBrak: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'DeclareMarriage'
    Left = 272
    Top = 280
  end
  object tbBigHouse: TAdsTable
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'BigHouse'
    Left = 64
    Top = 264
  end
  object TypePunkt: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'TypePunkt'
    Left = 152
    Top = 72
  end
  object SprTypeDok: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'SprTypeDok'
    Left = 656
    Top = 96
  end
  object SprVoenkom: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprVoenkom'
    Left = 656
    Top = 152
  end
  object LookUpPunkt: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 680
    Top = 496
    ParamData = <>
  end
  object LookupUL: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    SQL.Strings = (
      'select s.id, trim(isnull(tt.name,'#39#39'))+'#39' '#39'+trim(s.name) as name, '
      '       trim(s.name)+'#39' '#39'+trim(isnull(tt.name,'#39#39')) as name2, '
      '       trim(s.name)+'#39' '#39'+trim(isnull(tt.fname,'#39#39')) as name3, '
      #9'   trim(s.name) as kname'
      '  from '#1089#1087#1088#1059#1083#1080#1094' s'
      '  left join '#1057#1087#1088#1058#1080#1087#1059#1083#1080#1094' tt on s.tip=tt.id  '
      'order by s.name')
    AdsConnection = AdsConnection
    Left = 584
    Top = 376
    ParamData = <>
  end
  object SprRovd: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprRovd'
    Left = 656
    Top = 208
  end
  object tbOchered: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'Ochered'
    Left = 24
    Top = 480
  end
  object tbSostavSem: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'SostavSem'
    Left = 168
    Top = 480
  end
  object SprPostOch: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    TableName = 'SprPostOch'
    Left = 624
    Top = 16
  end
  object SprSnOch: TAdsTable
    DatabaseName = 'AdsSharedConnection'
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprSnOch'
    Left = 688
    Top = 16
  end
  object tbVUS: TAdsTable
    IndexName = 'ADS_DEFAULT'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'VUS'
    Left = 88
    Top = 480
  end
  object LockTypeObj: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    TableName = 'LockTypeObj'
    Left = 320
    Top = 448
  end
  object tbDokuments: TAdsTable
    DatabaseName = 'AdsConnection'
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsConnection
    TableName = 'Dokuments'
    Left = 208
    Top = 424
  end
  object WorkQueryS: TAdsQuery
    DatabaseName = 'AdsSharedConnection'
    StoreActive = False
    AdsConnection = AdsSharedConnection
    Left = 336
    Top = 72
    ParamData = <>
  end
  object SprMKB10: TAdsTable
    IndexName = 'ADS_DEFAULT'
    AdsConnection = AdsSharedConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'SprMKB10'
    Left = 648
    Top = 264
  end
  object LookUpDocMain: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 672
    Top = 440
    ParamData = <>
  end
  object LookUpSMDOCode: TAdsQuery
    DatabaseName = 'AdsConnection'
    StoreActive = False
    AdsConnection = AdsConnection
    Left = 673
    Top = 392
    ParamData = <>
  end
  object tbUpdObj: TAdsTable
    IndexName = 'VIEW_KEY'
    StoreActive = False
    AdsConnection = AdsConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'UpdatingObj'
    Left = 216
    Top = 312
  end
end
