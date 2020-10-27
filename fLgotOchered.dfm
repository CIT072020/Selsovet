inherited fmLgotOchered: TfmLgotOchered
  Left = 384
  Top = 192
  ActiveControl = edDecDateReal
  Caption = #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
  ClientHeight = 490
  ClientWidth = 758
  OldCreateOrder = True
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 446
    Width = 758
    TabOrder = 1
    Visible = False
    inherited btOk: TBitBtn
      Left = 532
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 642
      Top = 10
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 758
    Height = 103
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 13
      Width = 73
      Height = 13
      Caption = #1058#1080#1087' '#1086#1095#1077#1088#1077#1076#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label82: TLabel
      Left = 12
      Top = 46
      Width = 95
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNomer: TLabel
      Left = 571
      Top = 13
      Width = 90
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1086#1095#1077#1088#1077#1076#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 78
      Width = 102
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDecDateReal: TDBDateTimeEditEh
      Left = 126
      Top = 39
      Width = 126
      Height = 26
      HelpContext = 888
      DataField = 'DEC_DATE_REAL'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
    object edDecTime: TDBDateTimeEditEh
      Left = 276
      Top = 39
      Width = 151
      Height = 26
      DataField = 'DEC_TIME'
      DataSource = dsDokument
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      EditFormat = #1074#1088#1077#1084#1103': HH  '#1095#1072#1089'.  NN '#1084#1080#1085'.'
    end
    object edTypeOchered: TDBComboBoxEh
      Left = 126
      Top = 7
      Width = 264
      Height = 26
      DataField = 'OCHERED_ID'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = edTypeOcheredChange
    end
    object edNomer: TDBNumberEditEh
      Left = 674
      Top = 9
      Width = 77
      Height = 21
      DataField = 'NOMER_OCH'
      DataSource = dsDokument
      DecimalPlaces = 0
      EditButtons = <
        item
          Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1085#1086#1084#1077#1088
          Style = ebsPlusEh
          OnClick = edNomerEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object cbSimple: TDBCheckBoxEh
      Left = 402
      Top = 10
      Width = 145
      Height = 17
      Caption = #1074#1085#1077#1086#1095#1077#1088#1077#1076#1085#1086#1077
      DataField = 'VNEOCH'
      DataSource = dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edDecDate: TDBDateTimeEditEh
      Left = 126
      Top = 71
      Width = 126
      Height = 26
      HelpContext = 888
      DataField = 'DEC_DATE'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
  end
  object pc: TPageControl
    Left = 0
    Top = 129
    Width = 712
    Height = 317
    ActivePage = tsResh
    Align = alClient
    TabOrder = 2
    OnChange = pcChange
    object tsResh: TTabSheet
      Caption = #1056#1077#1096#1077#1085#1080#1103
      ImageIndex = 2
      object GridResh: TDBGridEh
        Left = 0
        Top = 0
        Width = 704
        Height = 289
        Align = alClient
        DataSource = dsOcheredResh
        DrawMemoText = True
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
        FooterFont.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        RowHeight = 85
        RowSizingAllowed = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        UseMultiTitle = True
        OnDblClick = GridReshDblClick
        OnGetCellParams = GridReshGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TIP'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'NOMER'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'DATER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'OSNOV_TEXT'
            Footers = <>
            Title.Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 390
            OnGetCellParams = GridReshColumns3GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'ADDINFO'
            Footers = <>
            Title.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
            Width = 213
          end
          item
            EditButtons = <>
            FieldName = 'TEXT'
            Footers = <>
            Title.Caption = #1058#1077#1082#1089#1090' '#1088#1077#1096#1077#1085#1080#1103
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
            Width = 218
          end
          item
            EditButtons = <>
            FieldName = 'OTKAZ'
            Footers = <>
            Title.Caption = #1054#1090#1082#1072'- '#1079#1072#1085#1086
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'OCHERED_ID'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'AUTO_ID'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ID_INTERNAL'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
            Width = 35
          end>
      end
    end
    object tsDok: TTabSheet
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      DesignSize = (
        704
        289)
      object edDoks: TDBEditEh
        Left = 0
        Top = 1
        Width = 701
        Height = 286
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DataField = 'OCHERED_DOK'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        WantReturns = True
        WordWrap = True
      end
    end
    object tsPrim: TTabSheet
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ImageIndex = 1
      DesignSize = (
        704
        289)
      object edPrim: TDBEditEh
        Left = 0
        Top = 1
        Width = 703
        Height = 286
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DataField = 'OCHERED_PRIM'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        WantReturns = True
        WordWrap = True
      end
    end
  end
  object Panel3: TPanel
    Left = 712
    Top = 129
    Width = 46
    Height = 317
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object btAddMen: TBitBtn
      Left = 9
      Top = 22
      Width = 28
      Height = 28
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btAddMenClick
    end
    object btEdit: TBitBtn
      Left = 8
      Top = 56
      Width = 28
      Height = 28
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = btEditClick
    end
    object btDelMen: TBitBtn
      Left = 8
      Top = 89
      Width = 28
      Height = 28
      Hint = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = btDelMenClick
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 758
    Height = 26
    AllowDrag = False
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar'
      CloseButton = False
      DragHandleStyle = dhDouble
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      Options = [tboSameWidth, tboShowHint]
      ParentFont = False
      ProcessShortCuts = True
      Resizable = False
      ShrinkMode = tbsmWrap
      Stretch = True
      TabOrder = 0
      object TBItemSave: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 36
        ShortCut = 113
        OnClick = TBItemSaveClick
      end
      object TBItemCancel: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        Hint = #1054#1090#1082#1072#1079
        ImageIndex = 37
        ShortCut = 16499
        OnClick = TBItemCancelClick
      end
      object TBItemText: TTBItem
        Caption = #1058#1077#1082#1089#1090
        DisplayMode = nbdmImageAndText
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1088#1077#1096#1077#1085#1080#1103
        ImageIndex = 4
        ShortCut = 115
        Visible = False
      end
      object TBItemVipis: TTBItem
        Caption = #1042#1099#1087#1080#1089#1082#1072
        DisplayMode = nbdmImageAndText
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074#1099#1087#1080#1089#1082#1091' '#1080#1079' '#1088#1077#1096#1077#1085#1080#1103
        ImageIndex = 95
        ShortCut = 116
        Visible = False
      end
      object TBItemArxiv: TTBItem
        AutoCheck = True
        Caption = #1040#1088#1093#1080#1074#1085#1086#1077
        DisplayMode = nbdmImageAndText
        Hint = #1040#1088#1093#1080#1074#1085#1086#1077' '#1088#1077#1096#1077#1085#1080#1077' '#1073#1077#1079' '#1076#1072#1090#1099
        ImageIndex = 0
        Visible = False
      end
      object TBItemLast: TTBItem
        Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077
        DisplayMode = nbdmImageAndText
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1088#1077#1096#1077#1085#1080#1077' '#1087#1086' '#1086#1073#1097#1077#1081' '#1086#1095#1077#1088#1077#1076#1080
        ImageIndex = 17
        Visible = False
      end
    end
  end
  object dsDokument: TDataSource
    DataSet = dmMen.tbOcheredLgot
    OnDataChange = dsDokumentDataChange
    Left = 512
    Top = 48
  end
  object dsOcheredResh: TDataSource
    DataSet = dmMen.tbOcheredResh
    OnDataChange = dsOcheredReshDataChange
    Left = 212
    Top = 213
  end
end
