object fmChSS_Opeka: TfmChSS_Opeka
  Left = 601
  Top = 249
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1089#1090#1085#1086#1075#1086' '#1057#1086#1074#1077#1090#1072
  ClientHeight = 160
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  DesignSize = (
    446
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 19
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
    Left = 16
    Top = 50
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
  object lbDetail: TLabel
    Left = 16
    Top = 82
    Width = 91
    Height = 16
    Caption = #1052#1077#1089#1090#1085#1099#1081' '#1057#1086#1074#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 2
    Top = 112
    Width = 442
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object btOk: TBitBtn
    Left = 238
    Top = 125
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
    Left = 345
    Top = 125
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
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
  object edRn: TDBLookupComboboxEh
    Left = 140
    Top = 47
    Width = 287
    Height = 24
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'KOD'
    ListField = 'NAME'
    ListSource = dsRn
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnChange = edRnChange
  end
  object edSS: TDBLookupComboboxEh
    Left = 140
    Top = 79
    Width = 287
    Height = 24
    DropDownBox.Rows = 20
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsSS
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object cbObl: TComboBox
    Left = 140
    Top = 15
    Width = 287
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 4
    ParentFont = False
    TabOrder = 4
    Text = #1052#1080#1085#1089#1082#1072#1103
    OnChange = cbOblChange
    Items.Strings = (
      #1041#1088#1077#1089#1090#1089#1082#1072#1103
      #1042#1080#1090#1077#1073#1089#1082#1072#1103
      #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
      #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
      #1052#1080#1085#1089#1082#1072#1103
      #1052#1086#1075#1080#1083#1105#1074#1089#1082#1072#1103)
  end
  object queryRn: TAdsQuery
    DatabaseName = 'dmBase.AdsSharedConnection'
    SQL.Strings = (
      'SELECT *  FROM '#1057#1087#1088#1057#1054#1040#1058#1054
      '  WHERE Substring(kod,1,1)=:PAR_OBL and'
      
        '               Substring(kod,2,1)='#39'2'#39' --or Substring(kod,2,1)='#39'4' +
        #39')'
      
        '              and Substring(kod,5,6)='#39'000000'#39' and  Substring(kod' +
        ',3,2)<>'#39'00'#39
      'ORDER BY kod')
    AdsConnection = dmBase.AdsSharedConnection
    Left = 80
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PAR_OBL'
        ParamType = ptUnknown
      end>
  end
  object querySS: TAdsQuery
    DatabaseName = 'dmBase.AdsSharedConnection'
    SQL.Strings = (
      'SELECT *  FROM '#1057#1087#1088#1057#1054#1040#1058#1054' s '
      '  WHERE Substring(kod,1,4)=:PAR_RN and'
      '   ( (Substring(kod,5,1)='#39'8'#39'  or Substring(kod,5,1)='#39'7'#39') and'
      
        '      Substring(kod,6,2)<>'#39'00'#39' and Substring(kod,8,3)='#39'000'#39' and ' +
        'Substring(kod,2,1)<>'#39'4'#39' )'
      'ORDER BY kod')
    AdsConnection = dmBase.AdsSharedConnection
    Left = 136
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PAR_RN'
        ParamType = ptUnknown
      end>
  end
  object dsRn: TDataSource
    DataSet = queryRn
    Left = 304
    Top = 48
  end
  object dsSS: TDataSource
    DataSet = querySS
    Left = 304
    Top = 80
  end
end
