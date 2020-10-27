object fmMainGetATE: TfmMainGetATE
  Left = 398
  Top = 177
  Width = 623
  Height = 469
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072' '#1040#1058#1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnLoad: TPanel
    Left = 0
    Top = 126
    Width = 607
    Height = 62
    Align = alTop
    TabOrder = 0
    Visible = False
    object lbRead: TLabel
      Left = 304
      Top = 9
      Width = 18
      Height = 13
      Caption = '222'
    end
    object lbMax: TLabel
      Left = 304
      Top = 33
      Width = 18
      Height = 13
      Caption = '222'
    end
    object Animate1: TAnimate
      Left = 6
      Top = 0
      Width = 272
      Height = 60
      CommonAVI = aviCopyFile
      StopFrame = 20
    end
  end
  object Grid: TDBGridEh
    Left = 0
    Top = 188
    Width = 607
    Height = 224
    Align = alClient
    DataSource = DataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 607
    Height = 126
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 14
      Width = 26
      Height = 13
      Caption = 'URL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 44
      Width = 32
      Height = 13
      Caption = 'Proxy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 76
      Width = 37
      Height = 13
      Caption = #1054#1088#1075#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 338
      Top = 76
      Width = 31
      Height = 13
      Caption = #1044#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbLoad: TLabel
      Left = 424
      Top = 40
      Width = 24
      Height = 13
      Caption = '1111'
    end
    object Label5: TLabel
      Left = 151
      Top = 76
      Width = 91
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088' '#1087#1072#1082#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTime: TLabel
      Left = 424
      Top = 53
      Width = 24
      Height = 13
      Caption = '1111'
    end
    object edURL: TDBEditEh
      Left = 61
      Top = 8
      Width = 338
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'http://195.222.87.190:8888/gisun/class/ws'
      Visible = True
    end
    object edProxy: TDBEditEh
      Left = 61
      Top = 38
      Width = 338
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object btLoad: TButton
      Left = 424
      Top = 10
      Width = 75
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 2
      OnClick = btLoadClick
    end
    object btClear: TButton
      Left = 520
      Top = 10
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 3
      OnClick = btClearClick
    end
    object edOrgan: TDBEditEh
      Left = 61
      Top = 70
      Width = 75
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '19194'
      Visible = True
    end
    object edDate: TDBDateTimeEditEh
      Left = 353
      Top = 70
      Width = 48
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object btFTP: TButton
      Left = 426
      Top = 72
      Width = 170
      Height = 25
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1085#1072' "'#1042#1062' '#1041#1088#1077#1089#1090'"'
      TabOrder = 6
      OnClick = btFTPClick
    end
    object pb: TProgressBar
      Left = 427
      Top = 101
      Width = 168
      Height = 17
      TabOrder = 7
      Visible = False
    end
    object edSize: TDBNumberEditEh
      Left = 254
      Top = 70
      Width = 60
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 5000.000000000000000000
      MinValue = 50.000000000000000000
      ParentFont = False
      TabOrder = 8
      Value = 300.000000000000000000
      Visible = True
    end
  end
  object sb: TStatusBar
    Left = 0
    Top = 412
    Width = 607
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object AdsConnection: TAdsConnection
    IsConnected = False
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    CommunicationType = ctAdsDefault
    Left = 160
    Top = 216
  end
  object ate: TAdsTable
    StoreActive = False
    AdsConnection = AdsConnection
    Exclusive = True
    TableName = 'ate'
    Left = 216
    Top = 216
  end
  object DataSource: TDataSource
    DataSet = ate
    Left = 312
    Top = 216
  end
  object HTTPRIO: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.OnReceivingData = HTTPRIOHTTPWebNode1ReceivingData
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 80
    Top = 248
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clNormal
    CompressionMode = 6
    CurrentVersion = '4.03 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.Recurse = False
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 384
    Top = 232
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    Host = 'vc.brest.by'
    Password = 'IOlnelxy'
    Username = 'vc'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 264
    Top = 328
  end
end
