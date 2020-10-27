inherited fmEnterDokument: TfmEnterDokument
  Left = 558
  Top = 300
  ActiveControl = edDOK_TYPE
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
  ClientWidth = 346
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label69: TLabel [0]
    Left = 169
    Top = 52
    Width = 12
    Height = 13
    Caption = #1086#1090
  end
  inherited Panel1: TPanel
    Width = 346
    TabOrder = 5
    inherited btOk: TBitBtn
      Left = 131
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 238
    end
  end
  object edDOK_NAME: TDBEditEh
    Left = 19
    Top = 79
    Width = 307
    Height = 24
    HelpContext = 999
    AutoSize = False
    DataField = 'DOK_NAME'
    DataSource = DataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edDOK_NAMEEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object edDOK_TYPE: TDBComboBoxEh
    Left = 19
    Top = 15
    Width = 308
    Height = 24
    HelpContext = 888
    DataField = 'DOK_TYPE'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object edDOK_SERIA: TDBEditEh
    Left = 19
    Top = 47
    Width = 33
    Height = 24
    CharCase = ecUpperCase
    DataField = 'DOK_SERIA'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edDOK_NOMER: TDBEditEh
    Left = 66
    Top = 47
    Width = 89
    Height = 24
    DataField = 'DOK_NOMER'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object edDOK_DATE: TDBDateTimeEditEh
    Left = 195
    Top = 47
    Width = 107
    Height = 24
    DataField = 'DOK_DATE'
    DataSource = DataSource
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object tb: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'DOK_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'DOK_SERIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DOK_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DOK_DATE'
        DataType = ftDate
      end
      item
        Name = 'DOK_ORGAN'
        DataType = ftInteger
      end
      item
        Name = 'DOK_NAME'
        DataType = ftMemo
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
    Left = 312
    Top = 40
    object tbDOK_TYPE: TSmallintField
      FieldName = 'DOK_TYPE'
    end
    object tbDOK_SERIA: TStringField
      FieldName = 'DOK_SERIA'
      Size = 5
    end
    object tbDOK_NOMER: TStringField
      FieldName = 'DOK_NOMER'
      Size = 10
    end
    object tbDOK_DATE: TDateField
      FieldName = 'DOK_DATE'
    end
    object tbDOK_ORGAN: TIntegerField
      FieldName = 'DOK_ORGAN'
    end
    object tbDOK_NAME: TMemoField
      FieldName = 'DOK_NAME'
      BlobType = ftMemo
    end
  end
  object DataSource: TDataSource
    DataSet = tb
    Left = 16
    Top = 112
  end
end
