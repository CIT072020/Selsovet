inherited fmZAGS_IzvOtsut: TfmZAGS_IzvOtsut
  Left = 408
  Top = 194
  Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077' ('#1086#1073' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1080' '#1072#1082#1090#1072' '#1075#1088#1072#1078#1076#1072#1085#1089#1082#1086#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103')'
  ClientHeight = 289
  ClientWidth = 779
  Constraints.MinHeight = 295
  Constraints.MinWidth = 780
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000110F
    F8FF040284FF36348FFFBABABE48B9B8C52C100EF0FF04027CFF040274FF0000
    000000000000000000000000000000000000000000000000000000000000C4C2
    C4103534E5FF040296FF4947A8FF2B29D7FF040282FF38378EFF000000000000
    000000000000000000000000000000000000000000000000000000000000C0C0
    C048BABAC2104947D6FF0402BCFF04028EFF5A5A9AFFC0C0C02CC0C0C02C0000
    000000000000000000000000000000000000000000000000000000000000BCBE
    BC2CBBB9C02C2B29AFFF0402EAFF040296FF35348DFFBEBFBE48BEBFBE100000
    000000000000403F40FF141214FF141214FF141214FF141214FF141214FF2D2C
    2DFF100E88FF0402F6FF5E5CE2FF3634E7FF040283FF100E80FFC3C2C3480000
    0000606060FF848484FFB6B7B6FFB6B7B6FFB6B7B6FFB6B7B6FFB6B7B6FF0402
    FCFF0402FCFF3A38ECFFC4C2C42CBEBFBE10100EF8FF04027CFF04027CFF0000
    0000909090FF616161FF0A080AFF808080FF808080FF040204FF040204FF2726
    27FFBEBFBEFF4A494AFF00000000000000000000000000000000000000000000
    00000000000000000000100E10FFFCFEFCFFFCFEFCFFB6B7B6FFB6B7B6FFCACB
    CAFFFCFEFCFF4A494AFF00000000000000000000000000000000000000000000
    00000000000000000000110F11FFFCFEFCFFFCFEFCFF141214FF141214FF5655
    56FFFCFEFCFF4A494AFF00000000000000000000000000000000000000000000
    00000000000000000000100E10FFFCFEFCFFFCFEFCFFFCFEFCFFFCFEFCFFFCFE
    FCFFFCFEFCFF4A494AFF00000000000000000000000000000000000000000000
    00000000000000000000100E10FFFCFEFCFFFCFEFCFF040204FF040204FF4A49
    4AFFFCFEFCFF4A494AFF00000000000000000000000000000000000000000000
    00000000000000000000100E10FFFCFEFCFFFCFEFCFFFCFEFCFFFCFEFCFFFCFE
    FCFFFCFEFCFF4A494AFF040204FF040204FF0000000000000000000000000000
    00000000000000000000383738FFB7B5B7FFB7B5B7FFB7B5B7FFB7B5B7FFB7B5
    B7FFB4B4B4FF353435FFDDDFDDFF110F11FF0000000000000000000000000000
    00000000000000000000383738FF383738FF383738FF383738FF383738FF3837
    38FF383738FF383738FF383738FF000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FF00
    0000FF010000FF000000FF000000C000000080000000801F0000E01F0000E01F
    0000E01F0000E01F0000E0070000E0070000E00F0000FFFF0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 267
    Width = 779
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 267
    Width = 779
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 779
    inherited TBToolbar: TTBToolbar
      Stretch = True
      object TBSubmenuGISUN: TTBSubmenuItem [2]
        Caption = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077' '#1089' '#1043#1048#1057#1059#1053
        ImageIndex = 114
        object TBItemStep1: TTBItem
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        end
        object TBItemStep2: TTBItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        end
      end
      inherited TBItemDelList: TTBItem
        Visible = False
      end
      inherited TBItemCopy: TTBItem
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 276
      end
    end
  end
  inherited sb: TScrollBox
    Width = 779
    Height = 217
    Align = alClient
    inherited pnPovtor: TPanel
      Left = 514
      Top = 487
      Width = 295
      Height = 34
      TabOrder = 2
      Visible = False
      inherited DbGridEh1: TDBGridEh
        Left = 3
        Top = 3
        Height = 21
      end
    end
    object pn: TPanel
      Left = 0
      Top = 0
      Width = 779
      Height = 56
      Align = alTop
      TabOrder = 0
      DesignSize = (
        779
        56)
      object Label7: TLabel
        Left = 15
        Top = 12
        Width = 37
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 171
        Top = 12
        Width = 14
        Height = 13
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ImageGISUN: TImage
        Left = 288
        Top = 5
        Width = 20
        Height = 20
        Anchors = [akTop, akRight]
        Transparent = True
        Visible = False
      end
      object Label4: TLabel
        Left = 352
        Top = 9
        Width = 51
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbBel: TLabel
        Left = 34
        Top = 34
        Width = 109
        Height = 16
        Caption = #1085#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomer: TDBEditEh
        Left = 66
        Top = 6
        Width = 93
        Height = 24
        HelpContext = 888
        DataField = 'NOMER'
        DataSource = dsDokument
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
      object edDateZ: TDBDateTimeEditEh
        Left = 201
        Top = 6
        Width = 119
        Height = 24
        DataField = 'DATEZ'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object edAdresat: TDBEditEh
        Left = 414
        Top = 5
        Width = 356
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        AutoSelect = False
        AutoSize = False
        DataField = 'ADRESAT'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
        WantReturns = True
      end
      object N_F_cbBelorus: TDBCheckBoxEh
        Left = 16
        Top = 34
        Width = 17
        Height = 16
        Hint = #1053#1072' '#1073#1077#1083#1086#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbBelorusClick
      end
    end
    object pnMain: TPanel
      Left = 0
      Top = 56
      Width = 779
      Height = 161
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 43
        Width = 53
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 246
        Top = 43
        Width = 26
        Height = 13
        Caption = #1048#1084#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 414
        Top = 43
        Width = 59
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 14
        Width = 234
        Height = 13
        Caption = #1042' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093' '#1072#1088#1093#1080#1074#1072' '#1047#1040#1043#1057'  '#1079#1072#1087#1080#1089#1100' '#1072#1082#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 72
        Width = 146
        Height = 13
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1072' '#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 10
        Top = 101
        Width = 151
        Height = 13
        Caption = #1040#1088#1093#1080#1074#1085#1099#1081' '#1092#1086#1085#1076' '#1089#1086#1093#1088#1072#1085#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 339
        Top = 72
        Width = 14
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 611
        Top = 40
        Width = 22
        Height = 13
        Caption = #1055#1086#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbRukov: TvchDBText
        Left = 7
        Top = 128
        Width = 527
        Height = 17
        Alignment = taRightJustify
        DataField = 'DOLG_RUKOV'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFamilia: TDBEditEh
        Left = 81
        Top = 37
        Width = 131
        Height = 24
        DataField = 'Familia'
        DataSource = dsDokument
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
      object edName: TDBEditEh
        Left = 288
        Top = 37
        Width = 97
        Height = 24
        DataField = 'Name'
        DataSource = dsDokument
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
      object edOtch: TDBEditEh
        Left = 485
        Top = 37
        Width = 107
        Height = 24
        DataField = 'Otch'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edRukov: TDBEditEh
        Left = 546
        Top = 124
        Width = 225
        Height = 24
        HelpContext = 999
        DataField = 'RUKOV'
        DataSource = dsDokument
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edRukovEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = True
      end
      object edTypeAkt: TDBComboBoxEh
        Left = 274
        Top = 8
        Width = 297
        Height = 24
        DataField = 'TYPEAKT'
        DataSource = dsDokument
        DropDownBox.Rows = 10
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
      object edArxivFond: TDBEditEh
        Left = 190
        Top = 95
        Width = 325
        Height = 24
        DataField = 'ARX_FOND'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MRUList.AutoAdd = False
        MRUList.Active = True
        MRUList.Items.Strings = (
          #1089#1086#1093#1088#1072#1085#1080#1083#1089#1103
          #1089#1086#1093#1088#1072#1085#1080#1083#1089#1103' '#1085#1077' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
          #1085#1077' '#1089#1086#1093#1088#1072#1085#1080#1083#1089#1103)
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
      object edDate1: TDBEditEh
        Left = 176
        Top = 66
        Width = 131
        Height = 24
        DataField = 'DATE1'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object edDate2: TDBEditEh
        Left = 371
        Top = 66
        Width = 131
        Height = 24
        DataField = 'DATE2'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object edPol: TDBComboBoxEh
        Left = 649
        Top = 36
        Width = 121
        Height = 24
        DataField = 'POL'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 267
    Width = 779
  end
  inherited pnAdd: TPanel
    Width = 779
  end
  inherited dsDokument: TDataSource
    Left = 672
    Top = 186
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NAME_ZAGS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NAME_ZAGS_B'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_ZAGS'
        DataType = ftInteger
      end
      item
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'NOMER_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
      end
      item
        Name = 'TYPE_EKZ'
        DataType = ftInteger
      end
      item
        Name = 'IS_GOROD'
        DataType = ftBoolean
      end
      item
        Name = 'DATE_ANUL'
        DataType = ftDate
      end
      item
        Name = 'DATEZ'
        DataType = ftDate
      end
      item
        Name = 'MEN_ID'
        DataType = ftInteger
      end
      item
        Name = 'LICH_ID'
        DataType = ftInteger
      end
      item
        Name = 'ADRESAT'
        DataType = ftMemo
      end
      item
        Name = 'Familia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'POL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'GRAG'
        DataType = ftInteger
      end
      item
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ARX_FOND'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TYPEAKT'
        DataType = ftInteger
      end
      item
        Name = 'DATE1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATE2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOLG_RUKOV'
        DataType = ftString
        Size = 200
      end>
    Left = 592
    Top = 146
    object DokumentNOMER: TStringField [1]
      FieldName = 'NOMER'
      Size = 15
    end
    object DokumentID_ZAGS: TIntegerField [4]
      FieldName = 'ID_ZAGS'
    end
    object DokumentDATEZ: TDateField [16]
      FieldName = 'DATEZ'
    end
    object DokumentMEN_ID: TIntegerField [17]
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField [18]
      FieldName = 'LICH_ID'
    end
    object DokumentADRESAT: TMemoField [19]
      FieldName = 'ADRESAT'
      BlobType = ftMemo
    end
    object DokumentFamilia: TStringField [20]
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField [21]
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField [22]
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField [23]
      FieldName = 'POL'
      Size = 1
    end
    object DokumentGRAG: TIntegerField [24]
      FieldName = 'GRAG'
    end
    object DokumentDateR: TDateField [25]
      FieldName = 'DateR'
    end
    object DokumentRUKOV: TStringField [26]
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentARX_FOND: TStringField [27]
      FieldName = 'ARX_FOND'
      Size = 50
    end
    object DokumentTYPEAKT: TIntegerField [28]
      FieldName = 'TYPEAKT'
    end
    object DokumentDATE1: TStringField [29]
      FieldName = 'DATE1'
    end
    object DokumentDATE2: TStringField [30]
      FieldName = 'DATE2'
    end
    object DokumentDOLG_RUKOV: TStringField [31]
      FieldName = 'DOLG_RUKOV'
      Size = 200
    end
  end
  object dsStran: TDataSource [8]
    DataSet = dmBase.SprStran
    Left = 676
    Top = 321
  end
  object dsNation: TDataSource [9]
    DataSet = dmBase.SprNac
    Left = 564
    Top = 185
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 584
    Top = 178
  end
  inherited HistZAGS: TkbmMemTable
    Left = 632
    Top = 82
  end
  inherited dsSeria: TDataSource
    Left = 480
    Top = 362
  end
  inherited dsObl: TDataSource
    Left = 536
    Top = 378
  end
  object dsGragd: TDataSource [14]
    Left = 612
    Top = 321
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 632
    Top = 178
  end
  inherited dsPovtor: TDataSource
    Left = 520
    Top = 178
  end
  inherited dsRN: TDataSource
    Left = 576
    Top = 378
  end
  inherited dsGorod: TDataSource
    Left = 696
    Top = 362
  end
  inherited dsRnGor: TDataSource
    Left = 624
    Top = 354
  end
  inherited dsTypeGorod: TDataSource
    Left = 624
    Top = 146
  end
  inherited ImGISUN: TImageList
    Left = 780
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 600
    Top = 82
  end
  inherited dsRovd: TDataSource
    Left = 672
    Top = 146
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 704
    Top = 170
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 782
    Top = 368
  end
end
