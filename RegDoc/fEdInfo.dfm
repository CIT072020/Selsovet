object fmEdInfo: TfmEdInfo
  Left = 471
  Top = 182
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1072' '#1091#1095#1077#1090#1072' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1089#1087#1088#1072#1074#1086#1082' ('#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074')'
  ClientHeight = 452
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object laRegNum: TLabel
    Left = 10
    Top = 40
    Width = 32
    Height = 13
    Caption = #8470' '#1087'/'#1087
  end
  object laSignName: TLabel
    Left = 10
    Top = 89
    Width = 35
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.'
  end
  object laAdrText: TLabel
    Left = 10
    Top = 116
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object laAdrPhone: TLabel
    Left = 426
    Top = 89
    Width = 110
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
  end
  object laRegDate: TLabel
    Left = 186
    Top = 40
    Width = 122
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
  end
  object laAppForm: TLabel
    Left = 439
    Top = 40
    Width = 100
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
  end
  object laExecTerm: TLabel
    Left = 10
    Top = 259
    Width = 87
    Height = 13
    Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laExecFact: TLabel
    Left = 232
    Top = 259
    Width = 126
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laPayment: TLabel
    Left = 499
    Top = 232
    Width = 70
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1087#1083#1072#1090#1099
  end
  object laAnsInd: TLabel
    Left = 499
    Top = 259
    Width = 95
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object bvBottom: TBevel
    Left = 8
    Top = 405
    Width = 678
    Height = 7
    Shape = bsTopLine
  end
  object laFolderId: TLabel
    Left = 10
    Top = 430
    Width = 31
    Height = 13
    Caption = #1055#1072#1087#1082#1072
  end
  object laGroupId: TLabel
    Left = 271
    Top = 430
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object laDocFile: TLabel
    Left = 10
    Top = 277
    Width = 136
    Height = 13
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvDocFile: TBevel
    Left = 158
    Top = 283
    Width = 551
    Height = 7
    Shape = bsTopLine
  end
  object bvTop: TBevel
    Left = 10
    Top = 24
    Width = 698
    Height = 7
    Shape = bsTopLine
  end
  object laProvDoc: TLabel
    Left = 10
    Top = 140
    Width = 331
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090', '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100' ('#1077#1089#1083#1080' '#1090#1088#1077#1073#1091#1077#1090#1089#1103')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvProvDoc: TBevel
    Left = 349
    Top = 146
    Width = 356
    Height = 7
    Shape = bsTopLine
  end
  object laProvType: TLabel
    Left = 10
    Top = 163
    Width = 76
    Height = 13
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laProvSer: TLabel
    Left = 341
    Top = 163
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object laProvNum: TLabel
    Left = 448
    Top = 163
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object laProvDate: TLabel
    Left = 570
    Top = 163
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object laProvOrg: TLabel
    Left = 10
    Top = 191
    Width = 73
    Height = 13
    Caption = #1054#1088#1075#1072#1085' '#1074#1099#1076#1072#1095#1080
  end
  object bvInfoDoc: TBevel
    Left = 299
    Top = 216
    Width = 409
    Height = 7
    Shape = bsTopLine
  end
  object laAdrIn: TLabel
    Left = 490
    Top = 116
    Width = 132
    Height = 13
    Caption = #1053#1072' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' '#1080#1089#1087#1086#1083#1082#1086#1084#1072
  end
  object laContent: TLabel
    Left = 10
    Top = 227
    Width = 87
    Height = 26
    AutoSize = False
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    WordWrap = True
  end
  object laPersonId: TLabel
    Left = 438
    Top = 191
    Width = 115
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080
  end
  object laSign: TLabel
    Left = 10
    Top = 67
    Width = 62
    Height = 13
    Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvSign: TBevel
    Left = 83
    Top = 73
    Width = 626
    Height = 7
    Shape = bsTopLine
  end
  object laInfoDoc: TLabel
    Left = 10
    Top = 210
    Width = 275
    Height = 13
    Caption = #1057#1087#1088#1072#1074#1082#1072' '#1080#1083#1080' '#1076#1088#1091#1075#1086#1081' '#1079#1072#1087#1088#1072#1096#1080#1074#1072#1077#1084#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tbaEditRec: TToolBar
    Left = 0
    Top = 0
    Width = 717
    Height = 22
    AutoSize = True
    Caption = 'tbaEditRec'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbOk: TToolButton
      Left = 0
      Top = 0
      Action = acOk
    end
    object tbSep1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 31
      Top = 0
      Action = acCancel
    end
  end
  object deRegNum: TDBNumberEditEh
    Left = 110
    Top = 34
    Width = 58
    Height = 24
    Alignment = taLeftJustify
    DataField = 'REG_NUM'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object deSignName: TDBEditEh
    Left = 110
    Top = 83
    Width = 281
    Height = 24
    DataField = 'SIGN_NAME'
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1080#1090#1077#1083#1103' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072#1089#1077#1083#1077#1085#1080#1103'...'
        Style = ebsEllipsisEh
        OnClick = deSignNameEditButtonClick
      end
      item
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          04000000000060000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          0000FFFFFFFFFFFF0000F00FFFFF00FF0000F000FFF000FF0000FF000F000FFF
          0000FFF00000FFFF0000FFFF000FFFFF0000FFF00000FFFF0000FF000F000FFF
          0000F000FFF000FF0000F00FFFFF00FF0000FFFFFFFFFFFF0000}
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
        Style = ebsGlyphEh
        OnClick = deSignNameClearButtonClick
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object deAdrText: TDBEditEh
    Left = 110
    Top = 110
    Width = 363
    Height = 24
    DataField = 'ADR_TEXT'
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1080#1079' '#1073#1072#1079#1099' '#1072#1076#1088#1077#1089#1086#1074'...'
        Style = ebsEllipsisEh
        OnClick = deAdrTextEditButtonClick
      end
      item
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          04000000000060000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          0000FFFFFFFFFFFF0000F00FFFFF00FF0000F000FFF000FF0000FF000F000FFF
          0000FFF00000FFFF0000FFFF000FFFFF0000FFF00000FFFF0000FF000F000FFF
          0000F000FFF000FF0000F00FFFFF00FF0000FFFFFFFFFFFF0000}
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
        Style = ebsGlyphEh
        OnClick = deAdrTextClearButtonClick
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object deAdrPhone: TDBEditEh
    Left = 557
    Top = 83
    Width = 146
    Height = 24
    DataField = 'ADR_PHONE'
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
  object deRegDate: TDBDateTimeEditEh
    Left = 320
    Top = 34
    Width = 90
    Height = 24
    DataField = 'REG_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object dcAppForm: TDBComboBoxEh
    Left = 557
    Top = 34
    Width = 145
    Height = 24
    DataField = 'APP_FORM'
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
  object deExecTerm: TDBDateTimeEditEh
    Left = 110
    Top = 253
    Width = 90
    Height = 24
    DataField = 'EXEC_TERM'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 16
    Visible = True
  end
  object deExecFact: TDBDateTimeEditEh
    Left = 374
    Top = 253
    Width = 90
    Height = 24
    DataField = 'EXEC_FACT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 17
    Visible = True
  end
  object dePayment: TDBNumberEditEh
    Left = 606
    Top = 226
    Width = 80
    Height = 24
    DataField = 'PAYMENT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    Visible = True
  end
  object deAnsInd: TDBEditEh
    Left = 606
    Top = 253
    Width = 80
    Height = 24
    DataField = 'ANS_IND'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    Visible = True
  end
  object dcFolderId: TDBComboBoxEh
    Left = 110
    Top = 424
    Width = 123
    Height = 24
    DataField = 'FOLDER_ID'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    Visible = True
  end
  object dlGroupId: TDBLookupComboboxEh
    Left = 317
    Top = 415
    Width = 354
    Height = 24
    DataField = 'LOOKUP_GROUP_ID'
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    Visible = False
  end
  object tbaDocFile: TToolBar
    Left = 684
    Top = 289
    Width = 23
    Height = 110
    Align = alNone
    AutoSize = True
    Caption = 'tbaFile'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    object tbFileAdd: TToolButton
      Left = 0
      Top = 0
      Action = acFileAdd
      Wrap = True
    end
    object tbFileDelete: TToolButton
      Left = 0
      Top = 22
      Action = acFileDelete
      Wrap = True
    end
    object tbFileEdit: TToolButton
      Left = 0
      Top = 44
      Action = acFileEdit
      Wrap = True
    end
    object tbFileView: TToolButton
      Left = 0
      Top = 66
      Action = acFileView
      Wrap = True
    end
    object tbFileViewList: TToolButton
      Left = 0
      Top = 88
      Action = acFileViewList
    end
  end
  object paDocFile: TPanel
    Left = 10
    Top = 293
    Width = 665
    Height = 104
    BevelOuter = bvLowered
    TabOrder = 19
    object DOC_FILE: TDBGridEh
      Left = 1
      Top = 1
      Width = 217
      Height = 102
      Align = alLeft
      AllowedOperations = [alopUpdateEh]
      BorderStyle = bsNone
      DrawMemoText = True
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object lvDocFile: TListView
      Left = 414
      Top = 1
      Width = 250
      Height = 102
      Align = alRight
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Columns = <>
      HideSelection = False
      LargeImages = imDocFile
      ReadOnly = True
      TabOrder = 1
      OnChange = lvDocFileChange
      OnDblClick = lvDocFileDblClick
    end
  end
  object dcProvType: TDBComboBoxEh
    Left = 110
    Top = 157
    Width = 219
    Height = 24
    DataField = 'PROV_TYPE'
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
  object deProvSer: TDBEditEh
    Left = 384
    Top = 157
    Width = 49
    Height = 24
    DataField = 'PROV_SER'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = True
  end
  object deProvNum: TDBEditEh
    Left = 496
    Top = 157
    Width = 63
    Height = 24
    DataField = 'PROV_NUM'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Visible = True
  end
  object deProvDate: TDBDateTimeEditEh
    Left = 606
    Top = 157
    Width = 96
    Height = 24
    DataField = 'PROV_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 11
    Visible = True
  end
  object deProvOrg: TDBEditEh
    Left = 110
    Top = 185
    Width = 309
    Height = 24
    DataField = 'PROV_ORG'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = True
  end
  object deContent: TDBEditEh
    Left = 110
    Top = 226
    Width = 369
    Height = 24
    DataField = 'CONTENT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Visible = True
  end
  object chbAdrIn: TDBCheckBoxEh
    Left = 635
    Top = 114
    Width = 18
    Height = 17
    DataField = 'ADR_IN'
    TabOrder = 7
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object dePersonId: TDBEditEh
    Left = 569
    Top = 185
    Width = 131
    Height = 24
    DataField = 'PERSON_ID'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Visible = True
  end
  object dcGroupId: TDBComboBoxEh
    Left = 333
    Top = 424
    Width = 354
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = dcGroupIdEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    Visible = True
  end
  object alEditRec: TActionList
    Images = dmDocImg.imEditRec
    Left = 64
    Top = 339
    object acOk: TAction
      Category = 'Main'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074' '#1073#1072#1079#1077
      ImageIndex = 1
      OnExecute = acOkExecute
    end
    object acFileAdd: TAction
      Category = 'DocFile'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 6
      OnExecute = acFileAddExecute
    end
    object acCancel: TAction
      Category = 'Main'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      ImageIndex = 0
      OnExecute = acCancelExecute
    end
    object acFileDelete: TAction
      Category = 'DocFile'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 7
      OnExecute = acFileDeleteExecute
    end
    object acFileEdit: TAction
      Category = 'DocFile'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 12
      OnExecute = acFileEditExecute
    end
    object acPreview: TAction
      Category = 'Main'
      Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088'...'
      ImageIndex = 2
      Visible = False
    end
    object acPrint: TAction
      Category = 'Main'
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 3
      Visible = False
    end
    object acWord: TAction
      Category = 'Main'
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' Word'
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090#1099' Word'
      ImageIndex = 4
    end
    object acFileView: TAction
      Category = 'DocFile'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1092#1072#1081#1083'...'
      ImageIndex = 2
      OnExecute = acFileViewExecute
    end
    object acFileViewList: TAction
      Category = 'DocFile'
      Caption = #1057#1087#1080#1089#1086#1082
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074' '#1074#1080#1076#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 16
      OnExecute = acFileViewListExecute
    end
  end
  object odFile: TOpenDialog
    Left = 109
    Top = 332
  end
  object imDocFile: TImageList
    Height = 32
    Width = 32
    Left = 162
    Top = 334
  end
end
