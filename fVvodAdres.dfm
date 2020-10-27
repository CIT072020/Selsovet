object fmVvodAdres: TfmVvodAdres
  Left = 519
  Top = 220
  BorderStyle = bsDialog
  Caption = #1040#1076#1088#1077#1089
  ClientHeight = 250
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 28
    Width = 49
    Height = 16
    Caption = #1054#1073#1083#1072#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 59
    Width = 35
    Height = 16
    Caption = #1056#1072#1081#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 155
    Width = 22
    Height = 16
    Caption = #1076#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 114
    Top = 155
    Width = 31
    Height = 16
    Caption = #1082#1086#1088#1087'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 221
    Top = 155
    Width = 17
    Height = 16
    Caption = #1082#1074'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 12
    Top = 91
    Width = 61
    Height = 16
    Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 12
    Top = 123
    Width = 35
    Height = 16
    Caption = #1059#1083#1080#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 319
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 9
    object btOk: TBitBtn
      Left = 122
      Top = 6
      Width = 83
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
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
      Left = 221
      Top = 6
      Width = 83
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edObl: TDBEditEh
    Left = 93
    Top = 24
    Width = 181
    Height = 24
    HelpContext = 888
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MRUList.AutoAdd = False
    MRUList.Active = True
    MRUList.Items.Strings = (
      #1041#1088#1077#1089#1090#1089#1082#1072#1103
      #1042#1080#1090#1077#1073#1089#1082#1072#1103
      #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
      #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
      #1052#1080#1085#1089#1082#1072#1103
      #1052#1086#1075#1080#1083#1077#1074#1089#1082#1072#1103)
    MRUList.Limit = 6
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object edRaion: TDBEditEh
    Left = 93
    Top = 55
    Width = 181
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MRUList.AutoAdd = False
    MRUList.Active = True
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object edTypePunkt: TDBLookupComboboxEh
    Left = 275
    Top = 20
    Width = 38
    Height = 24
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
    TabOrder = 2
    Visible = False
  end
  object edTypeUL: TDBLookupComboboxEh
    Left = 275
    Top = 112
    Width = 38
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsTypeUL
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object edPunkt: TDBEditEh
    Left = 93
    Top = 87
    Width = 181
    Height = 24
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
  object edUL: TDBEditEh
    Left = 93
    Top = 119
    Width = 181
    Height = 24
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
  object edDom: TDBEditEh
    Left = 53
    Top = 151
    Width = 45
    Height = 24
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
  object edKorp: TDBEditEh
    Left = 158
    Top = 151
    Width = 45
    Height = 24
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = True
  end
  object edKv: TDBEditEh
    Left = 249
    Top = 151
    Width = 46
    Height = 24
    HelpContext = 999
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = True
  end
  object cbNoneAdres: TDBCheckBoxEh
    Left = 8
    Top = 186
    Width = 137
    Height = 17
    Caption = #1040#1076#1088#1077#1089' '#1085#1077#1080#1079#1074#1077#1089#1090#1077#1085
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object edTelefon: TLabeledEdit
    Left = 175
    Top = 181
    Width = 121
    Height = 24
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = #1058#1077#1083#1077#1092#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    TabOrder = 11
    Visible = False
  end
  object dsTypeGorod: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 280
    Top = 50
  end
  object dsTypeUL: TDataSource
    DataSet = dmBase.SprTypeUl
    Left = 288
    Top = 82
  end
end
