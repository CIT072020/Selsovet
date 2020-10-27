object fmChGES: TfmChGES
  Left = 411
  Top = 289
  ActiveControl = edObl
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1046#1069#1057
  ClientHeight = 160
  ClientWidth = 401
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
    401
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 55
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
    Width = 90
    Height = 16
    Caption = #1056#1072#1081#1086#1085' ('#1075#1086#1088#1086#1076')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 82
    Width = 87
    Height = 16
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
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
    Width = 397
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object btOk: TBitBtn
    Left = 193
    Top = 125
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
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
    Left = 300
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
  object edObl: TDBLookupComboboxEh
    Left = 132
    Top = 16
    Width = 255
    Height = 21
    EditButtons = <>
    KeyField = 'KOD'
    ListField = 'NAME'
    ListSource = dsObl
    TabOrder = 2
    Visible = True
    OnChange = edOblChange
  end
  object edRn: TDBLookupComboboxEh
    Left = 132
    Top = 47
    Width = 255
    Height = 21
    DropDownBox.Rows = 20
    EditButtons = <>
    KeyField = 'KOD'
    ListField = 'NAME'
    ListSource = dsRn
    TabOrder = 3
    Visible = True
    OnChange = edRnChange
  end
  object edSS: TDBLookupComboboxEh
    Left = 132
    Top = 79
    Width = 255
    Height = 21
    DropDownBox.Rows = 20
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dsSS
    TabOrder = 4
    Visible = True
  end
  object queryObl: TAdsQuery
    DatabaseName = 'dmBase.AdsSharedConnection'
    StoreActive = True
    SQL.Strings = (
      'SELECT *  FROM '#1057#1087#1088#1057#1054#1040#1058#1054
      '  WHERE Substring(kod,2,9)='#39'000000000'#39' and'
      
        '               Substring(kod,1,1)<>'#39'0'#39' and Substring(kod,1,1)<>'#39 +
        '5'#39
      'ORDER BY kod')
    AdsConnection = dmBase.AdsSharedConnection
    Left = 24
    Top = 112
    ParamData = <>
  end
  object queryRn: TAdsQuery
    DatabaseName = 'dmBase.AdsSharedConnection'
    StoreActive = True
    SQL.Strings = (
      'SELECT *  FROM '#1057#1087#1088#1057#1054#1040#1058#1054
      '  WHERE Substring(kod,1,1)=:PAR_OBL and'
      
        '               (Substring(kod,2,1)='#39'2'#39' or Substring(kod,2,1)='#39'4'#39 +
        ')'
      
        '              and Substring(kod,5,6)='#39'000000'#39' and  Substring(kod' +
        ',3,2)<>'#39'00'#39
      'ORDER BY kod')
    AdsConnection = dmBase.AdsSharedConnection
    Left = 88
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
    StoreActive = True
    SQL.Strings = (
      'SELECT *  FROM sprGES s '
      '  WHERE Substring(soato,1,4)=:PAR_RN '
      'ORDER BY soato')
    AdsConnection = dmBase.AdsSharedConnection
    Left = 144
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PAR_RN'
        ParamType = ptUnknown
      end>
  end
  object dsObl: TDataSource
    DataSet = queryObl
    Left = 304
    Top = 16
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
