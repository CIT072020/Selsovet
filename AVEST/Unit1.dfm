object Form1: TForm1
  Left = 412
  Top = 135
  Width = 736
  Height = 671
  Caption = 'Form1'
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
  object Label1: TLabel
    Left = 528
    Top = 44
    Width = 37
    Height = 16
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 607
    Top = 44
    Width = 37
    Height = 16
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 195
    Top = 46
    Width = 37
    Height = 16
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Debug: TMemo
    Left = 6
    Top = 192
    Width = 708
    Height = 337
    Lines.Strings = (
      'Debug')
    TabOrder = 0
  end
  object cbOrg: TComboBox
    Left = 8
    Top = 8
    Width = 249
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
    Items.Strings = (
      #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
      #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074)
  end
  object Button1: TButton
    Left = 8
    Top = 40
    Width = 121
    Height = 25
    Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 76
    Width = 121
    Height = 25
    Caption = #1057#1082#1072#1095#1072#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object edUrl: TEdit
    Left = 288
    Top = 8
    Width = 409
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'http://86.57.146.82:9080/spr/ws/actualDictionaryWebService'
  end
  object edId: TMaskEdit
    Left = 10
    Top = 113
    Width = 279
    Height = 24
    EditMask = '!AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 36
    ParentFont = False
    TabOrder = 5
    Text = '11111111-1111-1111-1111-111111111111'
  end
  object Button3: TButton
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = 'save debug'
    TabOrder = 6
    OnClick = Button3Click
  end
  object edDate: TEdit
    Left = 120
    Top = 152
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = '2016-07-25'
  end
  object Button4: TButton
    Left = 656
    Top = 72
    Width = 59
    Height = 25
    Caption = 'stop timer'
    TabOrder = 8
    OnClick = Button4Click
  end
  object RadioButton1: TRadioButton
    Left = 176
    Top = 80
    Width = 129
    Height = 17
    Caption = #1055#1086#1083#1085#1099#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
    Checked = True
    TabOrder = 9
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 328
    Top = 80
    Width = 113
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 10
    OnClick = RadioButton2Click
  end
  object edDate1: TDBDateTimeEditEh
    Left = 344
    Top = 154
    Width = 119
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 11
    Value = 42583d
    Visible = True
  end
  object edDate2: TDBDateTimeEditEh
    Left = 504
    Top = 154
    Width = 118
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 12
    Value = 42592d
    Visible = True
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 680
    Top = 16
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 552
    Top = 72
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 560
    Top = 96
  end
end
