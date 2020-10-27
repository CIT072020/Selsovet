object fmLoadAccess: TfmLoadAccess
  Left = 389
  Top = 141
  Width = 1003
  Height = 649
  Caption = 'fmLoadAccess'
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
    Left = 24
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edDebug: TMemo
    Left = 208
    Top = 8
    Width = 774
    Height = 321
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 336
    Width = 969
    Height = 265
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ListBox1: TListBox
    Left = 8
    Top = 120
    Width = 193
    Height = 209
    ItemHeight = 13
    TabOrder = 3
    OnClick = ListBox1Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1046#1080#1083#1100#1077'\'#1046#1080#1083#1100#1077#1058#1072#1073'.m' +
      'db;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 264
    Top = 16
  end
  object tbOchered: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = #1050#1086#1076#1043#1076#1077#1053#1072#1054#1095#1077#1088#1077#1076#1080'=2'
    Filtered = True
    TableName = #1043#1076#1077#1050#1090#1086
    Left = 216
    Top = 56
  end
  object tbNasel: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1054#1095#1077#1088#1077#1076#1100
    Left = 216
    Top = 96
  end
  object tbSostav: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterFields = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterSource = dsMaster
    TableName = #1063#1083#1077#1085#1099#1057#1077#1084#1100#1080
    Left = 216
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = tbOchered
    Left = 808
    Top = 400
  end
  object SprOsnPost: TADOTable
    Connection = ADOConnection1
    TableName = 'L_OrdersOn'
    Left = 288
    Top = 216
  end
  object tbPer: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterFields = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterSource = dsMaster
    TableName = #1055#1077#1088#1077#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    Left = 224
    Top = 216
  end
  object tbLgot: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterFields = #1050#1086#1076#1054#1095#1077#1088#1077#1076#1085#1080#1082#1072
    MasterSource = dsMaster
    TableName = #1051#1100#1075#1086#1090#1099
    Left = 224
    Top = 256
  end
  object SprLgot: TADOTable
    Connection = ADOConnection1
    TableName = #1057#1087#1080#1089#1086#1082#1051#1100#1075#1086#1090
    Left = 288
    Top = 256
  end
  object tbPast: TADOTable
    Connection = ADOConnection1
    TableName = 'IdentCards'
    Left = 224
    Top = 288
  end
  object SprTypeHouse: TADOTable
    Connection = ADOConnection1
    TableName = #1058#1080#1087#1099#1046#1080#1083#1100#1103
    Left = 288
    Top = 288
  end
  object dsMaster: TDataSource
    DataSet = tbNasel
    Left = 264
    Top = 96
  end
end
