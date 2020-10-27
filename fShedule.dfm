inherited fmShedule: TfmShedule
  Left = 441
  Top = 264
  Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1074#1099#1075#1088#1091#1079#1082#1080
  ClientHeight = 194
  ClientWidth = 605
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 150
    Width = 605
    object Label1: TLabel [0]
      Left = 8
      Top = 16
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
    inherited btOk: TBitBtn
      Left = 380
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 496
    end
  end
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 605
    Height = 150
    Align = alClient
    DataSource = DataSource1
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAY'
        Footers = <>
        Title.Caption = #1044#1077#1085#1100' '#1084#1077#1089#1103#1094#1072
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'TIME1'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'TIME2'
        Footers = <>
        Title.Caption = #1050#1086#1085#1077#1095#1085#1086#1077' '#1074#1088#1077#1084#1103
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'COMM'
        Footers = <>
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Width = 308
      end>
  end
  object tbShedule: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'DAY'
        DataType = ftInteger
      end
      item
        Name = 'TIME1'
        DataType = ftTime
      end
      item
        Name = 'TIME2'
        DataType = ftTime
      end
      item
        Name = 'COMM'
        DataType = ftString
        Size = 70
      end>
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
    Left = 208
    Top = 56
    object tbSheduleDAY: TIntegerField
      FieldName = 'DAY'
    end
    object tbSheduleTIME1: TTimeField
      FieldName = 'TIME1'
      DisplayFormat = 'HH:NN'
      EditMask = '!90:00;1;_'
    end
    object tbSheduleTIME2: TTimeField
      FieldName = 'TIME2'
      DisplayFormat = 'HH:NN'
      EditMask = '!90:00;1;_'
    end
    object tbSheduleCOMM: TStringField
      FieldName = 'COMM'
      Size = 70
    end
  end
  object DataSource1: TDataSource
    DataSet = tbShedule
    Left = 136
    Top = 56
  end
end
