object fmGrpAdd: TfmGrpAdd
  Left = 262
  Top = 143
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1072#1092#1091
  ClientHeight = 360
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    492
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object laOper: TLabel
    Left = 32
    Top = 100
    Width = 106
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1087#1077#1088#1072#1094#1080#1102':'
  end
  object laFirst: TLabel
    Left = 16
    Top = 100
    Width = 12
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
    Top = 130
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object laSecond: TLabel
    Left = 16
    Top = 143
    Width = 12
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
    Top = 143
    Width = 98
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
  end
  object laField: TLabel
    Left = 16
    Top = 10
    Width = 51
    Height = 13
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090':'
  end
  object laCaption: TLabel
    Left = 80
    Top = 10
    Width = 54
    Height = 13
    Caption = 'laCaption'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvField: TBevel
    Left = 9
    Top = 33
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object laDatePart: TLabel
    Left = 32
    Top = 51
    Width = 99
    Height = 13
    Caption = #1059#1090#1086#1095#1085#1080#1090#1077' '#1074#1080#1076' '#1076#1072#1090#1099':'
  end
  object bvDatePart: TBevel
    Left = 9
    Top = 82
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object laZero: TLabel
    Left = 16
    Top = 51
    Width = 12
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
    Top = 36
    Width = 118
    Height = 13
    Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1083#1085#1099#1093' '#1083#1077#1090
  end
  object laAge2: TLabel
    Left = 320
    Top = 60
    Width = 37
    Height = 13
    Caption = #1085#1072' '#1076#1072#1090#1091
  end
  object btOk: TButton
    Left = 320
    Top = 331
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 22
  end
  object btCancel: TButton
    Left = 408
    Top = 331
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 23
  end
  object chbSpr: TCheckListBox
    Left = 19
    Top = 222
    Width = 462
    Height = 63
    OnClickCheck = chbSprClickCheck
    ItemHeight = 13
    TabOrder = 4
    OnDblClick = chbSprDblClick
  end
  object cbOper: TComboBox
    Left = 154
    Top = 97
    Width = 199
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbOperChange
  end
  object edString: TEdit
    Left = 19
    Top = 166
    Width = 462
    Height = 21
    TabOrder = 2
    OnChange = edStringChange
  end
  object chbIgnoreCase: TCheckBox
    Left = 20
    Top = 198
    Width = 165
    Height = 17
    Caption = #1080#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1073#1091#1082#1074
    TabOrder = 3
    OnClick = chbIgnoreCaseClick
  end
  object cbBoolean: TComboBox
    Left = 188
    Top = 196
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = cbBooleanChange
    OnKeyDown = cbKeyDown
  end
  object edNumber: TDBNumberEditEh
    Left = 32
    Top = 260
    Width = 105
    Height = 21
    EditButtons = <>
    TabOrder = 6
    Visible = True
    OnChange = edNumberChange
  end
  object edDate: TDBDateTimeEditEh
    Left = 376
    Top = 196
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 8
    Visible = True
    OnChange = edDateChange
  end
  object chbParam: TCheckBox
    Left = 20
    Top = 306
    Width = 237
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1079#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1086' '#1074#1088#1077#1084#1103' '#1087#1086#1080#1089#1082#1072
    TabOrder = 21
    Visible = False
    OnClick = chbParamClick
  end
  object cbCombo: TComboBox
    Left = 32
    Top = 236
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnChange = cbComboChange
    OnKeyDown = cbKeyDown
  end
  object edSpr: TDBEditEh
    Left = 19
    Top = 220
    Width = 105
    Height = 21
    EditButtons = <
      item
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Style = ebsEllipsisEh
        OnClick = edSprEditButtons0Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Visible = True
    OnChange = edSprChange
    OnDblClick = edSprDblClick
  end
  object stSpr: TStaticText
    Left = 128
    Top = 235
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
    Top = 252
    Width = 121
    Height = 21
    DropDownBox.ListSource = dsoCombo
    DropDownBox.Rows = 10
    EditButtons = <>
    ListSource = dsoCombo
    TabOrder = 15
    Visible = True
    OnChange = dbComboChange
  end
  object edDate2: TDBDateTimeEditEh
    Left = 384
    Top = 204
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 18
    Visible = True
    OnChange = edDateChange
  end
  object edNumber2: TDBNumberEditEh
    Left = 40
    Top = 268
    Width = 105
    Height = 21
    EditButtons = <>
    TabOrder = 7
    Visible = True
    OnChange = edNumberChange
  end
  object edSpr2: TDBEditEh
    Left = 27
    Top = 228
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
    TabOrder = 19
    Visible = True
    OnDblClick = edSpr2DblClick
    OnKeyDown = edSpr2KeyDown
  end
  object chbNeedValue: TCheckBox
    Left = 272
    Top = 306
    Width = 214
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1084#1086#1078#1085#1086' '#1086#1089#1090#1072#1074#1083#1103#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1091#1089#1090#1099#1084
    TabOrder = 20
    Visible = False
  end
  object cbMonth: TComboBox
    Left = 196
    Top = 204
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
    OnChange = cbMonthChange
    OnKeyDown = cbKeyDown
  end
  object cbMonth2: TComboBox
    Left = 204
    Top = 212
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 17
    OnChange = cbMonthChange
    OnKeyDown = cbKeyDown
  end
  object cbDatePart: TComboBox
    Left = 156
    Top = 48
    Width = 159
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbDatePartChange
  end
  object edAgeDate: TDBDateTimeEditEh
    Left = 363
    Top = 48
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 11
    Visible = True
    OnChange = edDateChange
  end
  object edAgeNumber: TDBNumberEditEh
    Left = 381
    Top = 63
    Width = 40
    Height = 21
    EditButtons = <>
    TabOrder = 9
    Visible = True
    OnChange = edNumberChange
  end
  object edAgeNumber2: TDBNumberEditEh
    Left = 389
    Top = 68
    Width = 40
    Height = 21
    EditButtons = <>
    TabOrder = 10
    Visible = True
    OnChange = edNumberChange
  end
  object dsoCombo: TDataSource
    Left = 408
    Top = 252
  end
end
