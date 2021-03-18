object fmChPunktATE: TfmChPunktATE
  Left = 492
  Top = 278
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 190
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  DesignSize = (
    314
    190)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 143
    Width = 313
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object btOk: TBitBtn
    Left = 101
    Top = 156
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
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
    Left = 208
    Top = 156
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    ModalResult = 2
    TabOrder = 6
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
  object edRn: TDBLookupComboboxEh
    Left = 15
    Top = 45
    Width = 284
    Height = 26
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'KOD'
    ListField = 'FULL_NAME'
    ListSource = dsRn
    ParentFont = False
    TabOrder = 1
    Visible = True
    OnChange = edRnChange
  end
  object edSS: TDBLookupComboboxEh
    Left = 15
    Top = 77
    Width = 284
    Height = 26
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'KOD'
    ListField = 'FULL_NAME'
    ListSource = dsSS
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnChange = edSSChange
  end
  object edNP: TDBLookupComboboxEh
    Left = 15
    Top = 109
    Width = 284
    Height = 26
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'KOD'
    ListField = 'FULL_NAME'
    ListSource = dsNP
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnChange = edNPChange
  end
  object cbObl: TComboBox
    Left = 15
    Top = 8
    Width = 284
    Height = 26
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 0
    OnChange = cbOblChange
    Items.Strings = (
      #1075#1086#1088#1086#1076' '#1052#1080#1085#1089#1082
      #1041#1088#1077#1089#1090#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
      #1042#1080#1090#1077#1073#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
      #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
      #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
      #1052#1086#1075#1080#1083#1105#1074#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
      #1052#1080#1085#1089#1082#1072#1103' '#1086#1073#1083#1072#1089#1090#1100)
  end
  object Edit1: TEdit
    Left = 12
    Top = 157
    Width = 76
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object queryRn: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 270
    Top = 47
    ParamData = <>
  end
  object querySS: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 264
    Top = 79
    ParamData = <>
  end
  object dsRn: TDataSource
    DataSet = queryRn
    Left = 160
    Top = 44
  end
  object dsSS: TDataSource
    DataSet = querySS
    Left = 160
    Top = 76
  end
  object queryNP: TAdsQuery
    DatabaseName = 'dmBase.AdsConnection'
    AdsConnection = dmBase.AdsConnection
    Left = 264
    Top = 119
    ParamData = <>
  end
  object dsNP: TDataSource
    DataSet = queryNP
    Left = 160
    Top = 116
  end
end
