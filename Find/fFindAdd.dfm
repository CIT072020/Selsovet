object fmAddFnd: TfmAddFnd
  Left = 450
  Top = 54
  ActiveControl = cbOper
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
  ClientHeight = 506
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000007777000000000004444700000000000CCC47000000000
    00CCC4700000000777CCC4777770004444CCC444447000CCCCCCCCCCC47000CC
    CCCCCCCCC47000CCCCCCCCCCC400000000CCC4700000000000CCC47000000000
    00CCC4700000000000CCC400000000000000000000000000000000000000FFFF
    0000FE1F0000FC1F0000FC1F0000FC1F0000E0010000C0010000C0010000C001
    0000C0030000FC1F0000FC1F0000FC1F0000FC3F0000FFFF0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    492
    506)
  PixelsPerInch = 96
  TextHeight = 13
  object laOper: TLabel
    Left = 32
    Top = 164
    Width = 108
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1087#1077#1088#1072#1094#1080#1102':'
  end
  object laFirst: TLabel
    Left = 16
    Top = 164
    Width = 10
    Height = 13
    Caption = '1.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvOper: TBevel
    Left = 9
    Top = 194
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object laSecond: TLabel
    Left = 16
    Top = 207
    Width = 10
    Height = 13
    Caption = '2.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laValue: TLabel
    Left = 32
    Top = 207
    Width = 99
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
  end
  object bvValue: TBevel
    Left = 9
    Top = 393
    Width = 473
    Height = 9
    Anchors = [akLeft, akBottom]
    Shape = bsTopLine
  end
  object laThird: TLabel
    Left = 19
    Top = 406
    Width = 10
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '3.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laAndOr: TLabel
    Left = 39
    Top = 406
    Width = 225
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1090#1086' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1095#1077#1088#1077#1079
  end
  object bvPlace: TBevel
    Left = 9
    Top = 429
    Width = 473
    Height = 9
    Anchors = [akLeft, akBottom]
    Shape = bsTopLine
  end
  object laForth: TLabel
    Left = 19
    Top = 441
    Width = 10
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '4.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laAddPlace: TLabel
    Left = 39
    Top = 441
    Width = 130
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '
  end
  object laDatePart: TLabel
    Left = 32
    Top = 117
    Width = 105
    Height = 13
    Caption = #1059#1090#1086#1095#1085#1080#1090#1077' '#1074#1080#1076' '#1076#1072#1090#1099':'
  end
  object bvDatePart: TBevel
    Left = 9
    Top = 147
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object laZero: TLabel
    Left = 16
    Top = 117
    Width = 10
    Height = 13
    Caption = '1.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laAge1: TLabel
    Left = 320
    Top = 102
    Width = 121
    Height = 13
    Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1083#1085#1099#1093' '#1083#1077#1090
  end
  object laAge2: TLabel
    Left = 320
    Top = 126
    Width = 40
    Height = 13
    Caption = #1085#1072' '#1076#1072#1090#1091
  end
  object chbSpr: TCheckListBox
    Left = 19
    Top = 286
    Width = 462
    Height = 63
    OnClickCheck = chbSprClickCheck
    ItemHeight = 13
    TabOrder = 9
    OnDblClick = chbSprDblClick
  end
  object btOk: TButton
    Left = 320
    Top = 475
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 25
  end
  object btCancel: TButton
    Left = 408
    Top = 475
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 26
  end
  object cbOper: TComboBox
    Left = 156
    Top = 161
    Width = 199
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbOperChange
  end
  object gbText: TGroupBox
    Left = 5
    Top = 9
    Width = 482
    Height = 93
    Caption = ' '#1044#1086#1073#1072#1074#1083#1103#1077#1084#1086#1077' '#1091#1089#1083#1086#1074#1080#1077': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object reText: TRichEdit
      Left = 9
      Top = 18
      Width = 463
      Height = 66
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object edString: TEdit
    Left = 19
    Top = 230
    Width = 462
    Height = 21
    TabOrder = 3
    OnChange = edStringChange
  end
  object chbIgnoreCase: TCheckBox
    Left = 20
    Top = 262
    Width = 165
    Height = 17
    Caption = #1080#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1073#1091#1082#1074
    TabOrder = 18
    OnClick = chbIgnoreCaseClick
  end
  object cbBoolean: TComboBox
    Left = 188
    Top = 260
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = cbBooleanChange
    OnKeyDown = cbKeyDown
  end
  object edNumber: TDBNumberEditEh
    Left = 32
    Top = 324
    Width = 105
    Height = 21
    EditButtons = <>
    TabOrder = 5
    Visible = True
    OnChange = edNumberChange
  end
  object edDate: TDBDateTimeEditEh
    Left = 376
    Top = 260
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 7
    Visible = True
    OnChange = edDateChange
  end
  object rbAnd: TRadioButton
    Left = 280
    Top = 405
    Width = 34
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1048
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    TabStop = True
  end
  object rbOr: TRadioButton
    Left = 318
    Top = 405
    Width = 50
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1048#1051#1048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
  end
  object btFind: TButton
    Left = 9
    Top = 475
    Width = 75
    Height = 23
    Hint = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1089#1087#1080#1089#1082#1091' '#1091#1089#1083#1086#1074#1080#1081
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1081#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = btFindClick
  end
  object chbParam: TCheckBox
    Left = 20
    Top = 372
    Width = 237
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1079#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1086' '#1074#1088#1077#1084#1103' '#1087#1086#1080#1089#1082#1072
    TabOrder = 19
    OnClick = chbParamClick
  end
  object cbCombo: TComboBox
    Left = 32
    Top = 300
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    OnChange = cbComboChange
    OnKeyDown = cbKeyDown
  end
  object edSpr: TDBEditEh
    Left = 19
    Top = 284
    Width = 105
    Height = 21
    EditButtons = <
      item
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Visible = True
    OnChange = edSprChange
    OnDblClick = edSprDblClick
  end
  object stSpr: TStaticText
    Left = 128
    Top = 299
    Width = 347
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbCombo: TDBLookupComboboxEh
    Left = 224
    Top = 316
    Width = 121
    Height = 21
    DropDownBox.ListSource = dsoCombo
    DropDownBox.Rows = 10
    EditButtons = <>
    ListSource = dsoCombo
    TabOrder = 10
    Visible = True
    OnChange = dbComboChange
  end
  object edDate2: TDBDateTimeEditEh
    Left = 384
    Top = 268
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 8
    Visible = True
    OnChange = edDateChange
  end
  object cbPlace: TComboBox
    Left = 184
    Top = 438
    Width = 178
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 23
  end
  object edNumber2: TDBNumberEditEh
    Left = 40
    Top = 332
    Width = 105
    Height = 21
    EditButtons = <>
    TabOrder = 6
    Visible = True
    OnChange = edNumberChange
  end
  object edSpr2: TDBEditEh
    Left = 27
    Top = 292
    Width = 105
    Height = 21
    EditButtons = <
      item
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Style = ebsEllipsisEh
        OnClick = edSpr2EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 13
    Visible = True
    OnDblClick = edSpr2DblClick
    OnKeyDown = edSpr2KeyDown
  end
  object chbNeedValue: TCheckBox
    Left = 272
    Top = 372
    Width = 214
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1084#1086#1078#1085#1086' '#1086#1089#1090#1072#1074#1083#1103#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1091#1089#1090#1099#1084
    TabOrder = 20
  end
  object cbDatePart: TComboBox
    Left = 156
    Top = 114
    Width = 159
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbDatePartChange
  end
  object cbMonth: TComboBox
    Left = 196
    Top = 268
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 27
    OnChange = cbMonthChange
    OnKeyDown = cbKeyDown
  end
  object cbMonth2: TComboBox
    Left = 204
    Top = 276
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 28
    OnChange = cbMonthChange
    OnKeyDown = cbKeyDown
  end
  object edAgeDate: TDBDateTimeEditEh
    Left = 363
    Top = 114
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 17
    Visible = True
    OnChange = edDateChange
  end
  object edAgeNumber: TDBNumberEditEh
    Left = 381
    Top = 129
    Width = 40
    Height = 21
    EditButtons = <>
    TabOrder = 15
    Visible = True
    OnChange = edNumberChange
  end
  object edAgeNumber2: TDBNumberEditEh
    Left = 389
    Top = 134
    Width = 40
    Height = 21
    EditButtons = <>
    TabOrder = 16
    Visible = True
    OnChange = edNumberChange
  end
  object dsoCombo: TDataSource
    Left = 408
    Top = 316
  end
end
