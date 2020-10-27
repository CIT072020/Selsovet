object fmPredZapis_Perenos: TfmPredZapis_Perenos
  Left = 308
  Top = 166
  ActiveControl = DBGridEh1
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074#1088#1077#1084#1103' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
  ClientHeight = 486
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbNew: TLabel
    Left = 12
    Top = 425
    Width = 51
    Height = 19
    Caption = 'lbNew'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 7
    Top = 142
    Width = 537
    Height = 278
    Ctl3D = False
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
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        Alignment = taCenter
        DisplayFormat = 'HH:NN'
        EditButtons = <>
        EditMask = 'HH:NN'
        FieldName = 'BEGINR'
        Footers = <>
        Title.Caption = #1042#1088#1077#1084#1103
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'ON_FIO'
        Footers = <>
        Title.Caption = #1046#1077#1085#1080#1093
        Width = 211
      end
      item
        EditButtons = <>
        FieldName = 'ONA_FIO'
        Footers = <>
        Title.Caption = #1053#1077#1074#1077#1089#1090#1072
        Width = 213
      end>
  end
  object btOk: TBitBtn
    Left = 318
    Top = 450
    Width = 100
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
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
  object btCancel: TBitBtn
    Left = 435
    Top = 450
    Width = 100
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 553
    Height = 137
    Caption = ' '#1057#1090#1072#1088#1086#1077' '#1084#1077#1089#1090#1086' '#1080' '#1076#1072#1090#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label11: TLabel
      Left = 14
      Top = 82
      Width = 37
      Height = 16
      Caption = #1052#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 14
      Top = 53
      Width = 21
      Height = 16
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 14
      Top = 24
      Width = 113
      Height = 16
      Caption = #1052#1077#1089#1090#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 14
      Top = 112
      Width = 30
      Height = 16
      Caption = #1044#1077#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbMonth: TComboBox
      Left = 138
      Top = 79
      Width = 145
      Height = 24
      Style = csDropDownList
      DropDownCount = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = cbMestoChange
    end
    object cbMesto: TComboBox
      Left = 138
      Top = 23
      Width = 303
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnChange = cbMestoChange
    end
    object cbDay: TComboBox
      Left = 138
      Top = 108
      Width = 80
      Height = 24
      Style = csDropDownList
      DropDownCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = cbMestoChange
    end
    object cbGod: TComboBox
      Left = 138
      Top = 51
      Width = 80
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      OnChange = cbMestoChange
    end
  end
  object DataSource1: TDataSource
    DataSet = fmPredZapis.tbPredZapis
    Left = 432
    Top = 88
  end
end
