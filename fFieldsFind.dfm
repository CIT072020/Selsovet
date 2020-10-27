object fmFieldsFind: TfmFieldsFind
  Left = 200
  Top = 146
  Width = 544
  Height = 375
  Caption = 'Описание полей для поиска'
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
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 536
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = fmMain.ImageList
      Stretch = True
      TabOrder = 0
      object TBItemSave: TTBItem
        Caption = 'Сохранить'
        DisplayMode = nbdmImageAndText
        Hint = 'Сохранить '
        ImageIndex = 36
        OnClick = TBItemSaveClick
      end
    end
  end
  object pc: TPageControl
    Left = 0
    Top = 26
    Width = 536
    Height = 322
    ActivePage = tsFields
    Align = alClient
    TabOrder = 1
    object tsFields: TTabSheet
      Caption = 'Поля'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 50
          Height = 13
          Caption = 'Описание'
        end
        object edBase: TDBComboBoxEh
          Left = 70
          Top = 8
          Width = 177
          Height = 21
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnChange = edBaseChange
        end
      end
      object GridFields: TSasaDBGrid
        Left = 0
        Top = 41
        Width = 528
        Height = 253
        Align = alClient
        Ctl3D = True
        DataSource = dsFields
        DrawMemoText = True
        EditActions = [geaCopyEh, geaSelectAllEh]
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TypeObj'
            Footers = <>
            Title.Caption = 'Тип объекта'
          end
          item
            EditButtons = <>
            FieldName = 'Nomer'
            Footers = <>
            Title.Caption = 'Номер для порядка'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'NomerOwner'
            Footers = <>
            Title.Caption = 'Номер для владельца'
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'Owner'
            Footers = <>
            Title.Caption = 'Кто владелец'
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'Group'
            Footers = <>
            Title.Caption = 'Группа'
          end
          item
            EditButtons = <>
            FieldName = 'Name'
            Footers = <>
            Title.Caption = 'Имя поля'
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'Caption'
            Footers = <>
            Title.Caption = 'Подпись'
            Width = 195
          end
          item
            EditButtons = <>
            FieldName = 'Alias'
            Footers = <>
            Title.Caption = 'Алиас'
            Width = 23
          end
          item
            EditButtons = <>
            FieldName = 'Kind'
            Footers = <>
            Title.Caption = 'Тип'
          end
          item
            EditButtons = <>
            FieldName = 'IsSpr'
            Footers = <>
            Title.Caption = 'Вкл. спр.'
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'SprName'
            Footers = <>
            Title.Caption = 'Имя спр-ка'
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'SprEditKind'
            Footers = <>
            Title.Caption = 'Тип спр-ка'
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'Visible'
            Footers = <>
            Title.Caption = 'Видим.'
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'CaseSensitive'
            Footers = <>
            Title.Caption = 'Чувст. к рег-ру'
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'IsUpper'
            Footers = <>
            Title.Caption = 'В верх. рег.'
          end
          item
            EditButtons = <>
            FieldName = 'Order'
            Footers = <>
            Title.Caption = 'Номер'
          end
          item
            EditButtons = <>
            FieldName = 'DefaultOp'
            Footers = <>
            Title.Caption = 'Оп. по умолч.'
          end
          item
            EditButtons = <>
            FieldName = 'RelName'
            Footers = <>
          end>
      end
    end
    object tsRel: TTabSheet
      Caption = 'Отношения'
      ImageIndex = 1
      object SasaDBGrid2: TSasaDBGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 294
        Align = alClient
        Ctl3D = True
        DataSource = dsRel
        DrawMemoText = True
        EditActions = [geaCopyEh, geaSelectAllEh]
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        ParentCtl3D = False
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
      end
    end
  end
  object dsFields: TDataSource
    DataSet = fmMain.mtFieldsFind
    OnDataChange = dsFieldsDataChange
    Left = 24
    Top = 160
  end
  object dsRel: TDataSource
    Left = 28
    Top = 202
  end
end
