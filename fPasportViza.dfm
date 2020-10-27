inherited fmPasportViza: TfmPasportViza
  Left = 187
  Top = 93
  Caption = 'Заявление 1-ВВ'
  ClientHeight = 521
  ClientWidth = 762
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000BB
    BBBBBBBBBB0000BB00BBBBBBBB0000BB0BBBBBB0BB0000BBB0BBBB000B0000BB
    B00BB00BBB0000BBBB0B00BBBB0000BBBB000BBBBB0000EEEE000EEEEE0000EE
    0E00000EEE0000EEE0000EEEEE0000EEEE000EEEEE0000EEEEE00EEEEE0000EE
    EEEE00EEEE0000EEEEEE00EEEE0000EEEEEEEEEEEE0000EEEEEEEEEEEE00C003
    0000C0030000C0030000C0030000C0030000C0030000C0030000C2030000C203
    0000C0030000C0030000C0030000C0030000C0030000C0030000C0030000}
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 502
    Width = 762
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited pnTable: TPanel
    Top = 502
    Width = 762
    Height = 0
    Align = alBottom
    Visible = False
  end
  inherited TBDock: TTBDock
    Width = 762
    inherited TBToolbar: TTBToolbar
      inherited TBItemDelList: TTBItem
        Visible = False
      end
      inherited TBItemCopy: TTBItem
        Visible = False
      end
      inherited TBItemPerekl: TTBItem
        Visible = False
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 184
      end
    end
  end
  inherited sb: TScrollBox
    Width = 762
    Height = 476
    Align = alClient
    inherited pnPovtor: TPanel
      TabOrder = 1
    end
    object pc: TPageControl
      Left = 0
      Top = 0
      Width = 762
      Height = 476
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      TabStop = False
      object ts1: TTabSheet
        Caption = 'Часть 1'
        TabVisible = False
        object Label1: TLabel
          Left = 12
          Top = 30
          Width = 61
          Height = 13
          Caption = 'Фамилия '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 253
          Top = 30
          Width = 30
          Height = 13
          Caption = 'Имя '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 426
          Top = 30
          Width = 60
          Height = 13
          Caption = 'Отчество '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 55
          Width = 93
          Height = 13
          Caption = 'Дата рождения'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 10
          Top = 441
          Width = 111
          Height = 13
          Caption = 'Заявление принял'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 311
          Top = 441
          Width = 31
          Height = 13
          Caption = 'Дата'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 249
          Top = 55
          Width = 87
          Height = 13
          Caption = 'Личный номер'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 170
          Top = 2
          Width = 11
          Height = 16
          Caption = 'В'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFamilia: TDBEditEh
          Left = 91
          Top = 27
          Width = 138
          Height = 19
          DataField = 'Familia'
          DataSource = dsDokument
          EditButtons = <
            item
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001863186318631863186318631863186318631863186318631863
                1863186318631863186310420040004010421042100010001042100010001042
                1863186318631863186318631042004010420040104210001042100010421863
                1863186318631863186318631863004010420040104210001042100010421863
                1863186318631863186318631863004010420040104210001042100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1042104218631863004010421863004010001042104210001000100010421042
                1000104218631863004000401042004010001000104210001000100010421000
                1000186318631863186300400040004000401000100010001000100010001000
                1863186318631863186318630040004000400040100010001000100010001863
                1863186318631863186318631863186300401042104218631000104210421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863004000400040104210001000100010421863
                1863186318631863186318631863104200400040186310421000100018631863
                1863186318631863186318631863186318631863186318631863186318631863
                186318631863}
              Style = ebsGlyphEh
              Width = 18
              OnClick = edFamiliaEditButtons0Click
            end>
          Flat = True
          TabOrder = 0
          Visible = True
        end
        object edName: TDBEditEh
          Left = 300
          Top = 27
          Width = 108
          Height = 19
          DataField = 'Name'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Visible = True
        end
        object edOtch: TDBEditEh
          Left = 503
          Top = 27
          Width = 114
          Height = 19
          DataField = 'Otch'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 2
          Visible = True
        end
        object edDateR: TDBDateTimeEditEh
          Left = 111
          Top = 52
          Width = 105
          Height = 19
          DataField = 'DateR'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 3
          Visible = True
          EditFormat = 'DD/MM/YYYY      '
        end
        object gbGit: TGroupBox
          Left = 1
          Top = 161
          Width = 752
          Height = 46
          Caption = ' Место прописки '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object edPropis: TDBEditEh
            Left = 8
            Top = 16
            Width = 736
            Height = 19
            DataField = 'PROPIS'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object gbPasport: TGroupBox
          Left = 0
          Top = 77
          Width = 753
          Height = 83
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Прошу оформить для временных выездов за границу паспорт '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object Label37: TLabel
            Left = 128
            Top = 21
            Width = 11
            Height = 13
            Caption = '№'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 296
            Top = 21
            Width = 26
            Height = 13
            Caption = 'Дата'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label29: TLabel
            Left = 9
            Top = 42
            Width = 211
            Height = 13
            Caption = 'Орган внутренних дел выдавший паспорт'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 11
            Top = 22
            Width = 31
            Height = 13
            Caption = 'Серия'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edPaspNomer: TDBEditEh
            Left = 146
            Top = 18
            Width = 99
            Height = 19
            DataField = 'PASP_NOMER'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edPaspDate: TDBDateTimeEditEh
            Left = 331
            Top = 18
            Width = 121
            Height = 19
            DataField = 'PASP_DATE'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object edPaspVidan: TDBEditEh
            Left = 9
            Top = 56
            Width = 698
            Height = 19
            DataField = 'PASP_VIDAN'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edPaspSeria: TDBEditEh
            Left = 50
            Top = 19
            Width = 39
            Height = 19
            DataField = 'PASP_SERIA'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object gbRogd: TGroupBox
          Left = 2
          Top = 209
          Width = 750
          Height = 68
          Caption = ' Место рождения '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object Label13: TLabel
            Left = 308
            Top = 42
            Width = 132
            Height = 13
            Caption = 'Республика (государство)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 9
            Top = 42
            Width = 76
            Height = 13
            Caption = 'Область (край)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 364
            Top = 18
            Width = 31
            Height = 13
            Caption = 'Район'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edRG_GOSUD: TDBLookupComboboxEh
            Left = 447
            Top = 39
            Width = 155
            Height = 19
            DataField = 'RG_GOSUD'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsStran
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edRG_OBL: TDBEditEh
            Left = 92
            Top = 39
            Width = 180
            Height = 19
            DataField = 'RG_OBL'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edRG_GOROD: TDBEditEh
            Left = 143
            Top = 15
            Width = 196
            Height = 19
            DataField = 'RG_GOROD'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object edRG_RAION: TDBEditEh
            Left = 400
            Top = 15
            Width = 165
            Height = 19
            DataField = 'RG_RAION'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object DBComboBoxEh1: TDBComboBoxEh
            Left = 12
            Top = 15
            Width = 97
            Height = 19
            DataField = 'TYPE_GOROD'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            Items.Strings = (
              'деревня'
              'посёлок'
              'город')
            KeyItems.Strings = (
              '1'
              '2'
              '3')
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
        end
        object gbRabota: TGroupBox
          Left = 2
          Top = 279
          Width = 750
          Height = 147
          Caption = 
            ' Трудовая деятельность за последние 10 лет (включая учебу в учеб' +
            'ных заведениях и военную службу) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object GridDok: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 746
            Height = 130
            Align = alClient
            Ctl3D = True
            DataSource = dsWork
            DrawMemoText = True
            EditActions = [geaCopyEh, geaSelectAllEh]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            EnterDirection = mdNextGraph
            OptionsS = [dgsSelectCurrentColor]
            SelRowColor = clAqua
            Color1 = clBlack
            Color2 = clBlack
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'DatePost'
                Footers = <>
                Title.Caption = 'Дата|Поступления'
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'DateUvol'
                Footers = <>
                Title.Caption = 'Дата|Ухода'
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'WorkName'
                Footers = <>
                Title.Caption = 'Место работы и должность'
                Width = 338
              end
              item
                EditButtons = <>
                FieldName = 'WorkMesto'
                Footers = <>
                Title.Caption = 'Место нахождения предприятия, учреждения, организации'
                Width = 236
              end>
          end
        end
        object edRukov: TDBEditEh
          Left = 130
          Top = 438
          Width = 148
          Height = 19
          DataField = 'RUKOV'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 8
          Visible = True
        end
        object edDateZ: TDBDateTimeEditEh
          Left = 347
          Top = 438
          Width = 105
          Height = 19
          HelpContext = 999
          DataField = 'DATEZ'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 9
          Visible = True
          EditFormat = 'DD/MM/YYYY      '
        end
        object edLichNomer: TDBEditEh
          Left = 342
          Top = 52
          Width = 143
          Height = 19
          DataField = 'LICH_NOMER'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = True
        end
        object edOrgan: TDBEditEh
          Left = 184
          Top = 0
          Width = 449
          Height = 19
          HelpContext = 888
          DataField = 'ORGAN'
          DataSource = dsDokument
          EditButtons = <>
          Flat = True
          TabOrder = 11
          Visible = True
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 502
    Width = 762
  end
  inherited dsDokument: TDataSource
    Left = 656
    Top = 66
  end
  inherited Dokument: TkbmMemTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
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
        Name = 'DateIzm'
        DataType = ftDate
      end
      item
        Name = 'POVTOR'
        DataType = ftBoolean
      end
      item
        Name = 'IS_GOROD'
        DataType = ftBoolean
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
        Name = 'DateR'
        DataType = ftDate
      end
      item
        Name = 'RG_GOSUD'
        DataType = ftInteger
      end
      item
        Name = 'RG_OBL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_RAION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG_GOROD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RUKOV'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SOATO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROV'
        DataType = ftBoolean
      end
      item
        Name = 'PASP_SERIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PASP_NOMER'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PASP_DATE'
        DataType = ftDate
      end
      item
        Name = 'PASP_VIDAN'
        DataType = ftMemo
      end
      item
        Name = 'LICH_NOMER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PROPIS'
        DataType = ftMemo
      end
      item
        Name = 'ORGAN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'TYPE_GOROD'
        DataType = ftSmallint
      end>
    Left = 696
    Top = 66
    object DokumentDATEZ: TDateField
      FieldName = 'DATEZ'
    end
    object DokumentMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
    end
    object DokumentLICH_ID: TIntegerField
      FieldName = 'LICH_ID'
    end
    object DokumentFamilia: TStringField
      FieldName = 'Familia'
      Size = 50
    end
    object DokumentName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object DokumentOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object DokumentPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object DokumentDateR: TDateField
      FieldName = 'DateR'
    end
    object DokumentRG_GOSUD: TIntegerField
      FieldName = 'RG_GOSUD'
    end
    object DokumentRG_OBL: TStringField
      FieldName = 'RG_OBL'
      Size = 30
    end
    object DokumentRG_RAION: TStringField
      FieldName = 'RG_RAION'
      Size = 30
    end
    object DokumentRG_GOROD: TStringField
      FieldName = 'RG_GOROD'
      Size = 30
    end
    object DokumentRUKOV: TStringField
      FieldName = 'RUKOV'
      Size = 60
    end
    object DokumentSOATO: TStringField
      FieldName = 'SOATO'
      Size = 10
    end
    object DokumentPROV: TBooleanField
      FieldName = 'PROV'
    end
    object DokumentPASP_SERIA: TStringField
      FieldName = 'PASP_SERIA'
      Size = 5
    end
    object DokumentPASP_NOMER: TStringField
      FieldName = 'PASP_NOMER'
      Size = 10
    end
    object DokumentPASP_DATE: TDateField
      FieldName = 'PASP_DATE'
    end
    object DokumentPASP_VIDAN: TMemoField
      FieldName = 'PASP_VIDAN'
      BlobType = ftMemo
    end
    object DokumentLICH_NOMER: TStringField
      FieldName = 'LICH_NOMER'
      Size = 15
    end
    object DokumentPROPIS: TMemoField
      FieldName = 'PROPIS'
      BlobType = ftMemo
    end
    object DokumentORGAN: TStringField
      FieldName = 'ORGAN'
      Size = 200
    end
    object DokumentTYPE_GOROD: TSmallintField
      FieldName = 'TYPE_GOROD'
    end
  end
  object dsStran: TDataSource [7]
    DataSet = dmBase.SprStran
    Left = 668
    Top = 121
  end
  object dsNation: TDataSource [8]
    DataSet = dmBase.SprNac
    Left = 700
    Top = 121
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 624
    Top = 122
  end
  object tbWork: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'DatePost'
        DataType = ftDate
      end
      item
        Name = 'DateUvol'
        DataType = ftDate
      end
      item
        Name = 'WorkName'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'WorkMesto'
        DataType = ftString
        Size = 300
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.50'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 556
    Top = 109
    object tbWorkDatePost: TDateField
      FieldName = 'DatePost'
    end
    object tbWorkDateUvol: TDateField
      FieldName = 'DateUvol'
    end
    object tbWorkWorkName: TStringField
      FieldName = 'WorkName'
      Size = 300
    end
    object tbWorkWorkMesto: TStringField
      FieldName = 'WorkMesto'
      Size = 300
    end
  end
  object dsWork: TDataSource
    DataSet = tbWork
    Left = 524
    Top = 109
  end
end
