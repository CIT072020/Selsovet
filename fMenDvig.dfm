object fmMenDvig: TfmMenDvig
  Left = 657
  Top = 211
  Width = 526
  Height = 436
  ActiveControl = edDate
  Caption = #1052#1080#1075#1088#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 20
    Width = 29
    Height = 16
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 50
    Width = 22
    Height = 16
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 172
    Width = 116
    Height = 16
    Caption = #1054#1088#1075#1072#1085' '#1086#1092#1086#1088#1084#1080#1074#1096#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 80
    Width = 62
    Height = 16
    Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 110
    Width = 95
    Height = 16
    Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 9
    Top = 141
    Width = 50
    Height = 16
    Caption = #1055#1088#1080#1095#1080#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object gbOtkudaPrib: TGroupBox
    Left = 6
    Top = 198
    Width = 498
    Height = 137
    Caption = ' '#1054#1090#1082#1091#1076#1072' '#1087#1088#1080#1073#1099#1083' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label103: TLabel
      Left = 14
      Top = 21
      Width = 152
      Height = 16
      Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label104: TLabel
      Left = 72
      Top = 48
      Width = 88
      Height = 16
      Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label105: TLabel
      Left = 116
      Top = 75
      Width = 35
      Height = 16
      Caption = #1088#1072#1081#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label106: TLabel
      Left = 66
      Top = 103
      Width = 95
      Height = 16
      Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edOP_B_GOROD: TDBLookupComboboxEh
      Left = 234
      Top = 100
      Width = 57
      Height = 24
      Alignment = taRightJustify
      DataField = 'OP_B_GOROD'
      DataSource = dsMigr
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsTypeGorod
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
    object edOP_GOROD: TDBEditEh
      Left = 305
      Top = 100
      Width = 163
      Height = 24
      HelpContext = 999
      DataField = 'OP_GOROD'
      DataSource = dsMigr
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
    object edOP_RAION1: TDBLookupComboboxEh
      Left = 18
      Top = 80
      Width = 40
      Height = 24
      DataField = 'OP_RAION'
      DataSource = dsMigr
      DropDownBox.Rows = 15
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'R_NAME'
      ListField = 'R_NAME'
      ListSource = dsRN
      ParentFont = False
      Style = csDropDownEh
      TabOrder = 3
      Visible = False
    end
    object edOP_OBL1: TDBLookupComboboxEh
      Left = 18
      Top = 53
      Width = 40
      Height = 24
      DataField = 'OP_OBL'
      DataSource = dsMigr
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'R_NAME'
      ListField = 'R_NAME'
      ListSource = dsObl
      ParentFont = False
      Style = csDropDownEh
      TabOrder = 1
      Visible = False
    end
    object cbOP_B_OBL: TDBCheckBoxEh
      Left = 209
      Top = 46
      Width = 15
      Height = 17
      Hint = #1054#1073#1083#1072#1089#1090#1100
      AllowGrayed = True
      DataField = 'OP_B_OBL'
      DataSource = dsMigr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbOP_B_RESP: TDBCheckBoxEh
      Left = 210
      Top = 19
      Width = 15
      Height = 17
      Hint = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072
      DataField = 'OP_B_RESP'
      DataSource = dsMigr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edOP_GOSUD: TDBLookupComboboxEh
      Left = 234
      Top = 18
      Width = 234
      Height = 24
      DataField = 'OP_GOSUD'
      DataSource = dsMigr
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsStran
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object edOP_OBL: TDBEditEh
      Left = 234
      Top = 45
      Width = 234
      Height = 24
      DataField = 'OP_OBL'
      DataSource = dsMigr
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
    object edOP_RAION: TDBEditEh
      Left = 234
      Top = 72
      Width = 234
      Height = 24
      DataField = 'OP_RAION'
      DataSource = dsMigr
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
  object edDate: TDBDateTimeEditEh
    Left = 149
    Top = 16
    Width = 121
    Height = 24
    HelpContext = 888
    DataField = 'DATE'
    DataSource = dsMigr
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 0
    Visible = True
    OnUpdateData = edDateUpdateData
  end
  object edType: TDBComboBoxEh
    Left = 149
    Top = 46
    Width = 121
    Height = 24
    DataField = 'TIP'
    DataSource = dsMigr
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      #1087#1088#1080#1073#1099#1083
      #1091#1073#1099#1083)
    KeyItems.Strings = (
      '1'
      '0')
    ParentFont = False
    TabOrder = 1
    Visible = True
    OnChange = edTypeChange
  end
  object edContant: TDBComboBoxEh
    Left = 149
    Top = 76
    Width = 89
    Height = 24
    DataField = 'CONTANT'
    DataSource = dsMigr
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      #1076#1072
      #1085#1077#1090)
    KeyItems.Strings = (
      '1'
      '0')
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnChange = edContantChange
  end
  object edDateSrok: TDBDateTimeEditEh
    Left = 149
    Top = 106
    Width = 121
    Height = 24
    DataField = 'DATE_SROK'
    DataSource = dsMigr
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
    OnUpdateData = edDateSrokUpdateData
  end
  object edPrich: TDBLookupComboboxEh
    Left = 149
    Top = 137
    Width = 353
    Height = 24
    DataField = 'PRICH'
    DataSource = dsMigr
    DropDownBox.Rows = 15
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Style = ebsEllipsisEh
        OnClick = edPrichEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsTypeMigr
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object edOrgan: TDBEditEh
    Left = 149
    Top = 168
    Width = 353
    Height = 24
    DataField = 'ORGAN'
    DataSource = dsMigr
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
        Style = ebsEllipsisEh
        OnClick = edOrganEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 510
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object btOk: TBitBtn
      Left = 284
      Top = 8
      Width = 97
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = btOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 397
      Top = 8
      Width = 97
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object dsRN: TDataSource
    DataSet = dmBase.LookupRN
    Left = 344
    Top = 34
  end
  object dsObl: TDataSource
    DataSet = dmBase.LookupObl
    Left = 400
    Top = 34
  end
  object dsStran: TDataSource
    DataSet = dmBase.SprStran
    Left = 444
    Top = 33
  end
  object dsTypeGorod: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 288
    Top = 42
  end
  object dsMigr: TDataSource
    DataSet = dmMen.tbMigr
    Left = 428
    Top = 87
  end
  object dsTypeMigr: TDataSource
    DataSet = dmBase.SprTypeMigr
    Left = 344
    Top = 80
  end
end
