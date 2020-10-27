object fmLoadKamN: TfmLoadKamN
  Left = 312
  Top = 151
  Width = 1247
  Height = 664
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 161
    Width = 1231
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 300
    Width = 1231
    Height = 326
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 149
      Width = 1229
      Height = 7
      Cursor = crVSplit
      Align = alBottom
    end
    object DBGridEh3: TDBGridEh
      Left = 1
      Top = 156
      Width = 1229
      Height = 169
      Align = alBottom
      DataSource = DataSource3
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
    end
    object edSQL: TSynEdit
      Left = 1
      Top = 1
      Width = 1229
      Height = 148
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 1
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynSQLSyn1
      Lines.Strings = (
        'SELECT * FROM XTFIO')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1231
    Height = 161
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 289
      Top = 1
      Width = 941
      Height = 159
      Align = alClient
      DataSource = DataSource2
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
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 288
      Height = 159
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 193
        Height = 159
        Align = alLeft
        DataSource = DataSource1
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
            FieldName = 'RDB$RELATION_NAME'
            Footers = <>
            Title.Caption = #1058#1072#1073#1083#1080#1094#1072
            Width = 135
          end>
      end
      object Button1: TButton
        Left = 207
        Top = 48
        Width = 65
        Height = 25
        Caption = 'Open ->'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 166
    Width = 1231
    Height = 134
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1231
      134)
    object Label1: TLabel
      Left = 40
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Button3: TButton
      Left = 32
      Top = 16
      Width = 59
      Height = 25
      Caption = 'Run SQL'
      TabOrder = 0
      OnClick = Button3Click
    end
    object btLoad: TButton
      Left = 104
      Top = 16
      Width = 51
      Height = 25
      Caption = 'Load'
      TabOrder = 1
      OnClick = btLoadClick
    end
    object edDebug: TMemo
      Left = 168
      Top = 4
      Width = 1057
      Height = 126
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
    object Button2: TButton
      Left = 40
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object pFIBDatabase: TpFIBDatabase
    DBName = 'e:\woch.gdb'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 1
    Timeout = 0
    LibraryName = 'e:\gds32.dll'
    AliasName = 'woch'
    WaitForRestoreConnect = 0
    Left = 48
    Top = 96
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 48
  end
  object tbListTable: TpFIBDataSet
    SelectSQL.Strings = (
      'select RDB$RELATION_NAME from RDB$RELATIONS'
      'where (RDB$SYSTEM_FLAG = 0)'
      'order by RDB$RELATION_NAME ')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 216
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = tbListTable
    Left = 136
    Top = 104
  end
  object tbView: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM Oadres_dom')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 344
    Top = 112
    oTrimCharFields = False
    oRefreshAfterPost = False
    oStartTransaction = False
    oAutoFormatFields = False
  end
  object DataSource2: TDataSource
    DataSet = tbView
    Left = 344
    Top = 72
  end
  object pFIBDataSet1: TpFIBDataSet
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 216
    Top = 88
  end
  object DataSource3: TDataSource
    DataSet = pFIBDataSet2
    Left = 104
    Top = 456
  end
  object SynSQLSyn1: TSynSQLSyn
    Left = 200
    Top = 376
  end
  object pFIBDataSet2: TpFIBDataSet
    UniDirectional = True
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 256
    Top = 368
  end
  object fbSprOsn: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XOSN ORDER BY KOSN')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 568
    Top = 24
    object fbSprOsnKOSN: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KOSN'
    end
    object fbSprOsnNOSN: TFIBStringField
      FieldName = 'NOSN'
      Size = 80
      EmptyStrToNull = True
    end
    object fbSprOsnNNOSN: TFIBStringField
      FieldName = 'NNOSN'
      Size = 200
      EmptyStrToNull = True
    end
  end
  object fbSostavSem: TpFIBDataSet
    SelectSQL.Strings = (
      'select osem.*, xsem.nsem, xsem.pmn FROM OSEM'
      'left join xsem on xsem.ksem=osem.ksem'
      'ORDER BY osem.tn')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 1008
    Top = 24
    object fbSostavSemKOSEM: TFIBIntegerField
      FieldName = 'KOSEM'
    end
    object fbSostavSemTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object fbSostavSemKSEM: TFIBIntegerField
      FieldName = 'KSEM'
    end
    object fbSostavSemSM: TFIBIntegerField
      FieldName = 'SM'
    end
    object fbSostavSemNSEM: TFIBStringField
      FieldName = 'NSEM'
      EmptyStrToNull = True
    end
    object fbSostavSemPMN: TFIBBooleanField
      FieldName = 'PMN'
    end
  end
  object fbOchered: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM OOCH WHERE KOCH=0 '
      'ORDER BY TN,KOCH ')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 672
    Top = 24
    object fbOcheredKOSN: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KOSN'
    end
    object fbOcheredTN: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'TN'
    end
    object fbOcheredKOCH: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KOCH'
    end
    object fbOcheredKR_P: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KR_P'
    end
    object fbOcheredKR_S: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KR_S'
    end
    object fbOcheredKPR: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KPR'
    end
    object fbOcheredNMP: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'NMP'
    end
    object fbOcheredDATA_Z: TFIBDateTimeField
      DefaultExpression = '11.11.1111'
      FieldName = 'DATA_Z'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object fbOcheredPRIM: TFIBStringField
      FieldName = 'PRIM'
      Size = 200
      EmptyStrToNull = True
    end
    object fbOcheredDNOW: TFIBDateTimeField
      DefaultExpression = 'NOW'
      FieldName = 'DNOW'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object fbOcheredNMPP: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'NMPP'
    end
    object fbOcheredTIME_Z: TFIBDateTimeField
      FieldName = 'TIME_Z'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
  end
  object fbMens: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XTFIO ORDER BY TN')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 912
    Top = 24
    object fbMensTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object fbMensFNAME: TFIBStringField
      FieldName = 'FNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object fbMensINAME: TFIBStringField
      FieldName = 'INAME'
      EmptyStrToNull = True
    end
    object fbMensONAME: TFIBStringField
      FieldName = 'ONAME'
      EmptyStrToNull = True
    end
    object fbMensKEM: TFIBStringField
      FieldName = 'KEM'
      Size = 80
      EmptyStrToNull = True
    end
    object fbMensKPR: TFIBIntegerField
      FieldName = 'KPR'
    end
    object fbMensKOTR: TFIBIntegerField
      FieldName = 'KOTR'
    end
    object fbMensFSEARCH: TFIBStringField
      FieldName = 'FSEARCH'
      Size = 40
      EmptyStrToNull = True
    end
    object fbMensKRAB: TFIBIntegerField
      FieldName = 'KRAB'
    end
    object fbMensD_ROZ: TFIBDateTimeField
      FieldName = 'D_ROZ'
    end
  end
  object fbSprLgot: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XLGOTA ORDER BY KLGOTA')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 568
    Top = 56
    object fbSprLgotKLGOTA: TFIBIntegerField
      FieldName = 'KLGOTA'
    end
    object fbSprLgotNLGOTA: TFIBStringField
      FieldName = 'NLGOTA'
      Size = 80
      EmptyStrToNull = True
    end
  end
  object fbSprTypeHouse: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XZIL ORDER BY KZIL')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 568
    Top = 88
    object fbSprTypeHouseKZIL: TFIBIntegerField
      FieldName = 'KZIL'
    end
    object fbSprTypeHouseNZIL: TFIBStringField
      FieldName = 'NZIL'
      EmptyStrToNull = True
    end
    object fbSprTypeHouseSZIL: TFIBStringField
      FieldName = 'SZIL'
      Size = 80
      EmptyStrToNull = True
    end
  end
  object fbSprOtnosh: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XSEM ORDER BY KSEM')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 528
    Top = 24
    object fbSprOtnoshKSEM: TFIBIntegerField
      FieldName = 'KSEM'
    end
    object fbSprOtnoshNSEM: TFIBStringField
      FieldName = 'NSEM'
      EmptyStrToNull = True
    end
    object fbSprOtnoshPMN: TFIBBooleanField
      FieldName = 'PMN'
    end
  end
  object fbSprInternat: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XINTERN ORDER BY KINT')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 528
    Top = 56
  end
  object fbSprReshen: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XRESHEN ORDER BY KR')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 528
    Top = 88
    object fbSprReshenKR: TFIBIntegerField
      FieldName = 'KR'
    end
    object fbSprReshenNR: TFIBStringField
      FieldName = 'NR'
      EmptyStrToNull = True
    end
    object fbSprReshenDR: TFIBDateTimeField
      FieldName = 'DR'
    end
  end
  object fbMensLgota: TpFIBDataSet
    SelectSQL.Strings = (
      'select OLGOTA.*, xlgota.nlgota FROM OLGOTA'
      'left join xlgota on xlgota.klgota=olgota.klgota'
      'ORDER BY TN,KLGOTA')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 960
    Top = 24
    object fbMensLgotaKSLGOT: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KSLGOT'
    end
    object fbMensLgotaKLGOTA: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'KLGOTA'
    end
    object fbMensLgotaTN: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'TN'
    end
    object fbMensLgotaNLGOTA: TFIBStringField
      FieldName = 'NLGOTA'
      Size = 80
      EmptyStrToNull = True
    end
  end
  object fbAdresDom: TpFIBDataSet
    SelectSQL.Strings = (
      'select o.*, ul.sul ul_tip, ul.nul ul_name from oadres_dom o'
      '  left join  xulic ul on ul.kul=o.kul'
      ''
      '')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 776
    Top = 24
    object fbAdresDomKADR_DOM: TFIBIntegerField
      FieldName = 'KADR_DOM'
    end
    object fbAdresDomKUL: TFIBIntegerField
      FieldName = 'KUL'
    end
    object fbAdresDomDOM: TFIBIntegerField
      FieldName = 'DOM'
    end
    object fbAdresDomDDOM: TFIBStringField
      FieldName = 'DDOM'
      Size = 5
      EmptyStrToNull = True
    end
    object fbAdresDomKORPUS: TFIBIntegerField
      FieldName = 'KORPUS'
    end
    object fbAdresDomKPR: TFIBIntegerField
      FieldName = 'KPR'
    end
    object fbAdresDomUL_TIP: TFIBStringField
      FieldName = 'UL_TIP'
      Size = 5
      EmptyStrToNull = True
    end
    object fbAdresDomUL_NAME: TFIBStringField
      FieldName = 'UL_NAME'
      Size = 40
      EmptyStrToNull = True
    end
  end
  object fbMensAdres: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM OADRMAN m'
      '  left join  oadres a on a.kadr=m.kadr'
      'ORDER BY TN')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 912
    Top = 64
    object fbMensAdresKMAN: TFIBIntegerField
      FieldName = 'KMAN'
    end
    object fbMensAdresKADR: TFIBIntegerField
      FieldName = 'KADR'
    end
    object fbMensAdresTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object fbMensAdresNDATA: TFIBDateTimeField
      FieldName = 'NDATA'
    end
    object fbMensAdresKDATA: TFIBDateTimeField
      FieldName = 'KDATA'
    end
    object fbMensAdresPKW: TFIBBooleanField
      FieldName = 'PKW'
    end
    object fbMensAdresPRIM: TFIBStringField
      FieldName = 'PRIM'
      Size = 200
      EmptyStrToNull = True
    end
    object fbMensAdresLSCH: TFIBIntegerField
      FieldName = 'LSCH'
    end
    object fbMensAdresPCOUNT: TFIBBooleanField
      FieldName = 'PCOUNT'
    end
    object fbMensAdresKCOUNT: TFIBBooleanField
      FieldName = 'KCOUNT'
    end
    object fbMensAdresSCOUNT: TFIBBooleanField
      FieldName = 'SCOUNT'
    end
    object fbMensAdresKZIL: TFIBIntegerField
      FieldName = 'KZIL'
    end
    object fbMensAdresKW: TFIBIntegerField
      FieldName = 'KW'
    end
    object fbMensAdresDKW: TFIBStringField
      FieldName = 'DKW'
      Size = 5
      EmptyStrToNull = True
    end
    object fbMensAdresOS: TFIBFloatField
      FieldName = 'OS'
    end
    object fbMensAdresZS: TFIBFloatField
      FieldName = 'ZS'
    end
    object fbMensAdresPPRIVAT: TFIBBooleanField
      FieldName = 'PPRIVAT'
    end
    object fbMensAdresKPR: TFIBIntegerField
      FieldName = 'KPR'
    end
    object fbMensAdresETAZ: TFIBBooleanField
      FieldName = 'ETAZ'
    end
    object fbMensAdresKADR_DOM: TIntegerField
      FieldName = 'KADR_DOM'
    end
  end
  object fbSprSoato: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM XRAON ORDER BY KRAON')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 528
    Top = 120
    object fbSprSoatoKRAON: TFIBIntegerField
      FieldName = 'KRAON'
    end
    object fbSprSoatoNRAON: TFIBStringField
      FieldName = 'NRAON'
      Size = 80
      EmptyStrToNull = True
    end
    object fbSprSoatoKPRAON: TFIBIntegerField
      FieldName = 'KPRAON'
    end
    object fbSprSoatoKCITY: TFIBIntegerField
      FieldName = 'KCITY'
    end
    object fbSprSoatoPRF: TFIBStringField
      FieldName = 'PRF'
      Size = 5
      EmptyStrToNull = True
    end
  end
  object fbOcheredAdd: TpFIBDataSet
    SelectSQL.Strings = (
      'select * FROM OOCH WHERE KOCH>0 '
      'ORDER BY TN,KOCH ')
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    Left = 672
    Top = 72
    object fbOcheredAddKOSN: TFIBIntegerField
      FieldName = 'KOSN'
    end
    object fbOcheredAddTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object fbOcheredAddKOCH: TFIBIntegerField
      FieldName = 'KOCH'
    end
    object fbOcheredAddKR_P: TFIBIntegerField
      FieldName = 'KR_P'
    end
    object fbOcheredAddKR_S: TFIBIntegerField
      FieldName = 'KR_S'
    end
    object fbOcheredAddKPR: TFIBIntegerField
      FieldName = 'KPR'
    end
    object fbOcheredAddNMP: TFIBIntegerField
      FieldName = 'NMP'
    end
    object fbOcheredAddDATA_Z: TFIBDateTimeField
      FieldName = 'DATA_Z'
    end
    object fbOcheredAddDNOW: TFIBDateTimeField
      FieldName = 'DNOW'
    end
    object fbOcheredAddPRIM: TFIBStringField
      FieldName = 'PRIM'
      Size = 200
      EmptyStrToNull = True
    end
    object fbOcheredAddNMPP: TFIBIntegerField
      FieldName = 'NMPP'
    end
    object fbOcheredAddTIME_Z: TFIBDateTimeField
      FieldName = 'TIME_Z'
    end
  end
  object pFIBQuery: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = pFIBDatabase
    SQL.Strings = (
      'select * from oadres_dom order by kadr_dom')
    Left = 328
    Top = 214
  end
end
