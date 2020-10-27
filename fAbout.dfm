object fmAbout: TfmAbout
  Left = 428
  Top = 226
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 395
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbAdres: TGroupBox
    Left = 0
    Top = 132
    Width = 354
    Height = 130
    Align = alTop
    Caption = ' '#1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object bvLogo: TBevel
      Left = 7
      Top = 15
      Width = 72
      Height = 72
    end
    object lbAdres: TLabel
      Left = 167
      Top = 14
      Width = 174
      Height = 13
      Caption = '224000, '#1075'.'#1041#1088#1077#1089#1090' '#1087#1088'. '#1052#1072#1096#1077#1088#1086#1074#1072', 18'
    end
    object lbTel: TLabel
      Left = 167
      Top = 29
      Width = 173
      Height = 13
      Caption = '(0162)-53-52-83, (0162)-20-04-00  '
    end
    object lbFax: TLabel
      Left = 167
      Top = 45
      Width = 80
      Height = 13
      Caption = '(0162)-21-45-84'
    end
    object lbMail: TLabel
      Left = 167
      Top = 91
      Width = 91
      Height = 13
      Cursor = crHandPoint
      Caption = 'vc_bous@brest.by'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lbMailClick
    end
    object imLogo: TImage
      Left = 10
      Top = 18
      Width = 66
      Height = 66
      AutoSize = True
    end
    object lbEmail: TLabel
      Left = 101
      Top = 91
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lbAdr: TLabel
      Left = 101
      Top = 14
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object lbTelCaption: TLabel
      Left = 101
      Top = 29
      Width = 52
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099
    end
    object lbFaxCaption: TLabel
      Left = 101
      Top = 45
      Width = 25
      Height = 13
      Caption = #1060#1072#1082#1089
    end
    object Label1: TLabel
      Left = 101
      Top = 107
      Width = 22
      Height = 13
      Caption = 'Web'
    end
    object lbWWW: TLabel
      Left = 167
      Top = 107
      Width = 88
      Height = 13
      Cursor = crHandPoint
      Caption = 'http://vc.brest.by'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lbWWWClick
    end
    object lbTelNameM1: TLabel
      Left = 101
      Top = 60
      Width = 13
      Height = 13
      Caption = 'A1'
    end
    object lbTelM1: TLabel
      Left = 167
      Top = 60
      Width = 126
      Height = 13
      Caption = '+375-29-3370046  (Viber)'
    end
    object lbTelNameM2: TLabel
      Left = 101
      Top = 76
      Width = 21
      Height = 13
      Caption = #1052#1058#1057
    end
    object lbTelM2: TLabel
      Left = 167
      Top = 76
      Width = 88
      Height = 13
      Caption = '+375-33-3033470'
    end
  end
  object paBottom: TPanel
    Left = 0
    Top = 360
    Width = 354
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btOk: TButton
      Left = 263
      Top = 3
      Width = 75
      Height = 23
      Cancel = True
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object paInfo: TPanel
    Left = 0
    Top = 262
    Width = 354
    Height = 98
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbOS: TLabel
      Left = 11
      Top = 6
      Width = 36
      Height = 13
      Caption = '%OS%'
    end
    object lbMemory: TLabel
      Left = 11
      Top = 24
      Width = 60
      Height = 13
      Caption = '%Memory%'
    end
    object lbOracleServer: TLabel
      Left = 11
      Top = 42
      Width = 72
      Height = 13
      Caption = '%AdsServer%'
    end
    object lbSMDO: TLabel
      Left = 11
      Top = 61
      Width = 59
      Height = 13
      Caption = '%SMDO%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAvest: TLabel
      Left = 11
      Top = 79
      Width = 50
      Height = 13
      Cursor = crHelp
      Caption = '%Avest%'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = lbAvestClick
    end
  end
  object paAll: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 132
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object lbCopyright: TLabel
      Left = 11
      Top = 32
      Width = 94
      Height = 13
      Caption = '%LegalCopyright%'
    end
    object lbVersion: TLabel
      Left = 11
      Top = 48
      Width = 419
      Height = 13
      Caption = 
        #1042#1077#1088#1089#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' %MajorVersion%.%MinorVersion%%Release% , %Compi' +
        'leDate%'
    end
    object lbEgr: TLabel
      Left = 12
      Top = 8
      Width = 143
      Height = 22
      Caption = #1057#1077#1083#1100#1089#1082#1080#1081' '#1057#1086#1074#1077#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbBase: TLabel
      Left = 11
      Top = 81
      Width = 26
      Height = 13
      Caption = #1041#1072#1079#1072' '
    end
    object lbBuild: TLabel
      Left = 11
      Top = 65
      Width = 109
      Height = 13
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' %Build%'
    end
    object lbFull: TLabel
      Left = 11
      Top = 97
      Width = 75
      Height = 13
      Caption = #1055#1086#1083#1085#1072#1103' '#1074#1077#1088#1089#1080#1103
    end
    object lbFolder: TLabel
      Left = 11
      Top = 113
      Width = 74
      Height = 13
      Caption = #1055#1072#1087#1082#1072' '#1079#1072#1087#1091#1089#1082#1072
    end
    object lbFolder2: TLabel
      Left = 104
      Top = 113
      Width = 18
      Height = 13
      Cursor = crHandPoint
      Caption = '___'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lbFolder2Click
    end
  end
end
