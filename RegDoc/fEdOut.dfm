object fmEdOut: TfmEdOut
  Left = 431
  Top = 207
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086'-'#1082#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 620
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvTop: TBevel
    Left = 3
    Top = 24
    Width = 878
    Height = 7
    Shape = bsTopLine
  end
  object laFolderId: TLabel
    Left = 10
    Top = 560
    Width = 31
    Height = 13
    Caption = #1055#1072#1087#1082#1072
  end
  object laGroupId: TLabel
    Left = 295
    Top = 560
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object laRegDate: TLabel
    Left = 10
    Top = 37
    Width = 93
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
  end
  object laRegInd: TLabel
    Left = 239
    Top = 37
    Width = 97
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1080#1085#1076#1077#1082#1089
  end
  object laRegNum: TLabel
    Left = 523
    Top = 37
    Width = 32
    Height = 13
    Caption = #8470' '#1087'/'#1087
  end
  object laDelivKind: TLabel
    Left = 636
    Top = 37
    Width = 87
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1086#1090#1087#1088#1072#1074#1082#1080
  end
  object laSignOrg: TLabel
    Left = 10
    Top = 64
    Width = 79
    Height = 13
    Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090
  end
  object laReqDate: TLabel
    Left = 276
    Top = 150
    Width = 12
    Height = 13
    Caption = #1086#1090
  end
  object laReqInd: TLabel
    Left = 10
    Top = 146
    Width = 87
    Height = 26
    AutoSize = False
    Caption = #1054#1090#1074#1077#1090' '#1085#1072' '#1074#1093#1086#1076#1103#1097#1080#1081' '#8470
    WordWrap = True
  end
  object laDocKind: TLabel
    Left = 10
    Top = 178
    Width = 77
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laNumList: TLabel
    Left = 418
    Top = 178
    Width = 36
    Height = 13
    Caption = #1051#1080#1089#1090#1086#1074
  end
  object laNumApp: TLabel
    Left = 534
    Top = 178
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1081
  end
  object laContent: TLabel
    Left = 10
    Top = 198
    Width = 62
    Height = 26
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
    WordWrap = True
  end
  object laResMan: TLabel
    Left = 594
    Top = 204
    Width = 49
    Height = 13
    Caption = #1055#1086#1076#1087#1080#1089#1072#1083
  end
  object laExecMan: TLabel
    Left = 594
    Top = 229
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object laSubjId: TLabel
    Left = 10
    Top = 254
    Width = 48
    Height = 13
    Caption = #1058#1077#1084#1072#1090#1080#1082#1072
  end
  object laExecTerm: TLabel
    Left = 238
    Top = 280
    Width = 87
    Height = 13
    Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laExecFact: TLabel
    Left = 474
    Top = 280
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laAnsText: TLabel
    Left = 10
    Top = 299
    Width = 94
    Height = 45
    AutoSize = False
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
    WordWrap = True
  end
  object laAnsInd: TLabel
    Left = 591
    Top = 331
    Width = 76
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1086#1090#1074#1077#1090#1072
  end
  object laAnsDate: TLabel
    Left = 591
    Top = 305
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
  end
  object laReqCheck: TLabel
    Left = 10
    Top = 359
    Width = 49
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100
  end
  object laCheckOut: TLabel
    Left = 192
    Top = 359
    Width = 84
    Height = 13
    Caption = #1057#1085#1103#1090' '#1089' '#1082#1086#1085#1090#1088#1086#1083#1103
  end
  object laCheckDate: TLabel
    Left = 327
    Top = 359
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103
  end
  object laCheckMan: TLabel
    Left = 591
    Top = 348
    Width = 92
    Height = 26
    AutoSize = False
    Caption = #1055#1088#1080#1085#1103#1083' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1089#1085#1103#1090#1080#1080
    WordWrap = True
  end
  object laInFile: TLabel
    Left = 10
    Top = 385
    Width = 34
    Height = 13
    Caption = #1042' '#1076#1077#1083#1086
  end
  object laFileId: TLabel
    Left = 139
    Top = 385
    Width = 65
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1076#1077#1083#1072
  end
  object laDocFile: TLabel
    Left = 10
    Top = 406
    Width = 84
    Height = 26
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
    WordWrap = True
  end
  object laExecDate: TLabel
    Left = 10
    Top = 280
    Width = 95
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
  end
  object laSignName: TLabel
    Left = 636
    Top = 64
    Width = 82
    Height = 13
    Caption = #1050#1086#1084#1091' '#1072#1076#1088#1077#1089#1086#1074#1072#1085
  end
  object imSMDO: TImage
    Left = 413
    Top = 148
    Width = 17
    Height = 17
    Hint = #1055#1086#1083#1091#1095#1077#1085' '#1087#1086' '#1087#1086#1095#1090#1077' '#1057#1052#1044#1054
    ParentShowHint = False
    Picture.Data = {
      055449636F6E0000010001001010000001001800680300001600000028000000
      1000000020000000010018000000000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000080808080808080
      8080000000000000000000000000000000000000000000000000000000000000
      0000008080800000000000000000008080808080808080800000000000000000
      00000000000000000000000000000000000000FFFFFF00FF00FFFFFF00FF00FF
      FFFF000000808080808080000000000000000000000000000000000000000000
      FFFFFF000000000000000000000000000000FFFFFF0000008080800000000000
      00000000000000000000808080FFFFFF00000000000000FF0000800000800000
      0000000000FFFFFF80808080808000000000000000000000000000000000FF00
      00000000FF0000800000FF0000800000800000000000FF000000008080800000
      00000000000000FFFFFF000000FFFFFF00000000FF0000FF0000FF0000FF0000
      8000000000FFFFFF000000808080000000000000000000FFFFFF00000000FF00
      000000FFFFFF00FF0000FF0000800000FF0000000000FF000000000000000000
      00000000000000FFFFFF808080FFFFFF000000000000FFFFFFFFFFFF00FF0000
      0000000000FFFFFF808080000000000000000000000000000000000000000000
      FFFFFF000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF000000000000FFFFFF00FF00FFFFFF00FF00FF
      FFFF000000000000000000000000000000000000000000000000000000FFFFFF
      0000008080800000000000000000008080800000000000000000000000000000
      00000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFF0000F83F0000E60F0000D8070000B0030000A003000040010000
      40010000000100000005000000050000A00B0000901B0000C8370000E0CF0000
      F83F0000}
    ShowHint = True
    Visible = False
  end
  object laDeloDate: TLabel
    Left = 460
    Top = 386
    Width = 89
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1083#1077#1085#1080#1103
  end
  object Label1: TLabel
    Left = 10
    Top = 591
    Width = 48
    Height = 13
    Caption = #1057#1086#1089#1090#1072#1074#1080#1083
  end
  object sbFileID: TSpeedButton
    Left = 406
    Top = 381
    Width = 23
    Height = 22
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1076#1077#1088#1077#1074#1072' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = sbFileIDClick
  end
  object sbFileID2: TSpeedButton
    Left = 380
    Top = 381
    Width = 23
    Height = 22
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00840000008400
      0000FFFFFF0000000000FFFFFF0084000000FFFFFF0000000000FF00FF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF008400
      0000FFFFFF0000000000FFFFFF0084000000FFFFFF0000000000FF00FF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00840000008400
      0000FFFFFF0000000000FFFFFF0084000000FFFFFF0000000000FF00FF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF008400
      0000FFFFFF0000000000FFFFFF0084000000FFFFFF0000000000FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = sbFileID2Click
  end
  object tbaDocFile: TToolBar
    Left = 871
    Top = 407
    Width = 23
    Height = 132
    Align = alNone
    AutoSize = True
    Caption = 'tbaFile'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
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
    object tbAddSignAll: TToolButton
      Left = 0
      Top = 88
      Action = acAddSign
      Wrap = True
    end
    object tbFileViewList: TToolButton
      Left = 0
      Top = 110
      Action = acFileViewList
      Visible = False
    end
  end
  object paDocFile: TPanel
    Left = 115
    Top = 406
    Width = 746
    Height = 132
    BevelOuter = bvLowered
    TabOrder = 28
    object DOC_FILE: TDBGridEh
      Left = 1
      Top = 1
      Width = 217
      Height = 130
      Align = alLeft
      AllowedOperations = [alopUpdateEh]
      BorderStyle = bsNone
      DrawMemoText = True
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
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object lvDocFile: TListView
      Left = 495
      Top = 1
      Width = 250
      Height = 130
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
  object tbaEditRec: TToolBar
    Left = 0
    Top = 0
    Width = 906
    Height = 22
    AutoSize = True
    Caption = 'tbaEditRec'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbWord: TToolButton
      Left = 0
      Top = 0
      Action = acWord
      DropdownMenu = pmWord
    end
    object tbSep2: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'tbSep2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbOk: TToolButton
      Left = 31
      Top = 0
      Action = acOk
    end
    object tbSep1: TToolButton
      Left = 54
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 62
      Top = 0
      Action = acCancel
    end
  end
  object dcFolderId: TDBComboBoxEh
    Left = 115
    Top = 556
    Width = 163
    Height = 24
    DataField = 'FOLDER_ID'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
    Visible = True
  end
  object dlGroupId: TDBLookupComboboxEh
    Left = 337
    Top = 548
    Width = 431
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
    TabOrder = 32
    Visible = False
  end
  object deRegDate: TDBDateTimeEditEh
    Left = 115
    Top = 31
    Width = 100
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
    TabOrder = 1
    Visible = True
  end
  object deRegInd: TDBEditEh
    Left = 347
    Top = 31
    Width = 146
    Height = 24
    DataField = 'REG_IND'
    EditButtons = <
      item
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' (Ctrl+))'
        Style = ebsPlusEh
        OnClick = deRegIndEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = True
    OnDblClick = deRegIndDblClick
  end
  object deRegNum: TDBNumberEditEh
    Left = 565
    Top = 31
    Width = 52
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
    TabOrder = 3
    Visible = True
  end
  object dcDelivKind: TDBComboBoxEh
    Left = 731
    Top = 31
    Width = 150
    Height = 24
    DataField = 'DELIV_KIND'
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
  object dlSignOrg: TDBLookupComboboxEh
    Left = 115
    Top = 58
    Width = 502
    Height = 24
    DataField = 'LOOKUP_SIGN_ORG'
    EditButtons = <
      item
        Style = ebsEllipsisEh
        Visible = False
      end
      item
        Glyph.Data = {
          46030000424D460300000000000036000000280000000E0000000E0000000100
          20000000000010030000000000000000000000000000000000007F7F7FFF824E
          0CFF744000FF6D3A00FF794C0FFF896029FF522D00FF644316FF6A491CFF7552
          26FF522A00FF774B10FF855311FF7F7F7FFF8C540DFF633904FFFFFFDDFFFFFF
          DBFFFFFED9FFFFFFDCFFFFFFDBFFFFFFDFFFFFF5D3FFFFFFF0FFFFFFF0FFFFFF
          E7FFFFFDCBFF844B00FF7C4100FF885F28FF62451EFFFFFFE1FF775E3CFFFFFF
          D1FF674210FFFFFFDCFF6A5333FFFBF3E2FF484033FFFFFFEDFF735123FF975C
          0DFF935300FF8D5916FF6D4209FFFFFFD8FF68430FFFFFFFD2FF794F14FFFFFF
          D1FF75582CFFFFFFE7FF564427FFFFFFE0FF724912FF8D5100FFA36108FF9359
          0DFF87540EFFFFFFCDFF885A1AFFFFFFCAFF895917FFFFFFC9FF7D5824FFFFFF
          DFFF6E5229FFFFFCCBFF8E6124FF955A0AFF9E5E09FF8F5404FF9B6316FFFFFF
          C4FF986418FFFFFCB1FF8B5710FFFFFFCDFF80581EFFFFFFCEFF866534FFFFFF
          D4FF8C6023FF88530AFFA3630EFFA26B20FF8D5C18FFFFFFC3FF946724FFFFFF
          C1FF996927FFFFFFD0FF7D5A28FFFFFFE0FF6C552FFFFFFFDDFF845F27FF9A66
          1FFFB4741FFF83571AFF816437FFFFFFDBFF725C38FFFFFFDCFF79582AFFFFFF
          DBFF736247FFFFFFF8FF4C4D44FFFFFFF0FF765D33FF97641BFFB87312FF9E6E
          2CFFFFFFDCFFFFFFE9FFFFFFEDFFFFFDE0FFFFFFEAFFFFFFF0FFF8F6EBFFF8FF
          FFFFFBFFFEFFFFF9E3FFFFFFD9FFAD711DFFD37F0FFF9F5C00FF996822FFFFFF
          DBFFFFFFE8FFFFFFF2FFF5F9F4FFF1F9F9FFF7FFFFFFFFFFFBFFFFFAE2FFFFFF
          D8FF935D10FFCC7F18FFD68006FFD68310FFC37B16FFB78134FFFFFFD6FFFFFF
          F1FFEDF3F2FFF4FFFFFFF5F9F4FFFFFFE7FFFFFFD1FFAA701EFFC97E17FFBA65
          00FFD9850EFFDC7900FFFB9810FFC67200FFAB701AFFFFFFD6FFFFFFF4FFFFFF
          F8FFFFFFEAFFFFFFC3FFC6821FFFE28910FFE28605FFEC951FFFBE7610FFF394
          0FFFE37B00FFE88701FFDC9125FFA47B3CFFFFFFDAFFFFFFE4FFFFFFD8FFB273
          17FFD7840BFFEF900BFFD17500FFC87D11FF7F7F7FFFD78D23FFE38B0FFFD87C
          00FFD07D09FFC78B32FFAA7C35FFFFFFC0FFB18032FFD38D28FFD88815FFD481
          0DFFCB8117FF7F7F7FFF}
        Style = ebsGlyphEh
        Width = 24
        OnClick = dlSignOrgEditButtons1Click
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
  object deSignName: TDBEditEh
    Left = 731
    Top = 58
    Width = 150
    Height = 24
    DataField = 'SIGN_NAME'
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
  object deReqDate: TDBDateTimeEditEh
    Left = 304
    Top = 144
    Width = 100
    Height = 24
    DataField = 'REQ_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 8
    Visible = True
  end
  object deReqInd: TDBEditEh
    Left = 115
    Top = 144
    Width = 141
    Height = 24
    DataField = 'REQ_IND'
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1074#1093#1086#1076#1103#1097#1077#1081' '#1056#1050#1050
        Style = ebsEllipsisEh
        OnClick = deReqIndEditButtons0Click
      end
      item
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
          0000008888880800000080088880080000008000880088000000880000088800
          0000888000888800000088000008880000008000880088000000800888800800
          00008088888888000000}
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
        Style = ebsGlyphEh
        OnClick = deReqIndEditButtons1Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = True
  end
  object dcDocKind: TDBComboBoxEh
    Left = 115
    Top = 172
    Width = 278
    Height = 24
    DataField = 'DOC_KIND'
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
  object deNumList: TDBEditEh
    Left = 467
    Top = 172
    Width = 48
    Height = 24
    DataField = 'NUM_LIST'
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
  object deNumApp: TDBEditEh
    Left = 612
    Top = 172
    Width = 55
    Height = 24
    DataField = 'NUM_APP'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Visible = True
  end
  object deContent: TDBEditEh
    Left = 115
    Top = 198
    Width = 462
    Height = 45
    AutoSize = False
    DataField = 'CONTENT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object dlSubjId: TDBLookupComboboxEh
    Left = 116
    Top = 248
    Width = 637
    Height = 24
    DataField = 'LOOKUP_SUBJ_ID'
    DropDownBox.Columns = <
      item
        FieldName = 'CODE'
        Width = 35
      end
      item
        FieldName = 'NAME'
        Width = 250
      end>
    DropDownBox.Width = 347
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
    TabOrder = 15
    Visible = True
  end
  object deExecTerm: TDBDateTimeEditEh
    Left = 336
    Top = 274
    Width = 100
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
    TabOrder = 17
    Visible = True
  end
  object deExecFact: TDBDateTimeEditEh
    Left = 575
    Top = 274
    Width = 100
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
    TabOrder = 18
    Visible = True
  end
  object deAnsText: TDBEditEh
    Left = 115
    Top = 302
    Width = 462
    Height = 45
    AutoSize = False
    DataField = 'ANS_TEXT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object deAnsInd: TDBEditEh
    Left = 684
    Top = 325
    Width = 100
    Height = 24
    DataField = 'ANS_IND'
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
  object deAnsDate: TDBDateTimeEditEh
    Left = 684
    Top = 299
    Width = 100
    Height = 24
    DataField = 'ANS_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 20
    Visible = True
  end
  object dcReqCheck: TDBComboBoxEh
    Left = 115
    Top = 353
    Width = 57
    Height = 24
    DataField = 'REQ_CHECK'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    Visible = True
  end
  object chbCheckOut: TDBCheckBoxEh
    Left = 294
    Top = 357
    Width = 18
    Height = 17
    DataField = 'CHECK_OUT'
    TabOrder = 23
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbCheckOutClick
  end
  object deCheckDate: TDBDateTimeEditEh
    Left = 406
    Top = 353
    Width = 90
    Height = 24
    DataField = 'CHECK_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 24
    Visible = True
  end
  object deCheckMan: TDBComboBoxEh
    Left = 684
    Top = 350
    Width = 214
    Height = 24
    DataField = 'CHECK_MAN'
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = deCheckManEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    Visible = True
  end
  object chbInFile: TDBCheckBoxEh
    Left = 115
    Top = 383
    Width = 18
    Height = 17
    DataField = 'IN_FILE'
    TabOrder = 26
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbInFileClick
  end
  object dlFileId: TDBLookupComboboxEh
    Left = 713
    Top = 379
    Width = 112
    Height = 24
    DataField = 'LOOKUP_FILE_ID'
    DropDownBox.Columns = <
      item
        FieldName = 'FILE_IND'
        Width = 40
      end
      item
        FieldName = 'NAME'
        Width = 250
      end>
    DropDownBox.Width = 347
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
    TabOrder = 27
    Visible = False
  end
  object dcResMan: TDBComboBoxEh
    Left = 684
    Top = 198
    Width = 214
    Height = 24
    DataField = 'RES_MAN'
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = dcResManEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Visible = True
  end
  object dcExecMan: TDBComboBoxEh
    Left = 684
    Top = 223
    Width = 214
    Height = 24
    DataField = 'EXEC_MAN'
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = dcExecManEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Visible = True
  end
  object deExecDate: TDBDateTimeEditEh
    Left = 115
    Top = 274
    Width = 100
    Height = 24
    DataField = 'EXEC_DATE'
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
  object dcGroupId: TDBComboBoxEh
    Left = 349
    Top = 556
    Width = 431
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
    TabOrder = 31
    Visible = True
  end
  object deSignOrgs: TDBEditEh
    Left = 115
    Top = 86
    Width = 734
    Height = 54
    Hint = #1057#1087#1080#1089#1086#1082' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1074
    AutoSize = False
    Color = clInfoBk
    DataField = 'IDEN_TEXT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 33
    Visible = True
    WordWrap = True
  end
  object DBEditEh1: TDBEditEh
    Left = 456
    Top = 143
    Width = 268
    Height = 24
    Color = clInfoBk
    DataField = 'IDEN_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 34
    Visible = False
  end
  object tbSignOrgs: TToolBar
    Left = 858
    Top = 89
    Width = 23
    Height = 44
    Align = alNone
    AutoSize = True
    Caption = 'tbaFile'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 35
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Action = acEditSignOrgs
      Wrap = True
    end
    object ToolButton2: TToolButton
      Left = 0
      Top = 22
      Action = acClearSignOrgs
      Wrap = True
    end
  end
  object deDeloDate: TDBDateTimeEditEh
    Left = 562
    Top = 380
    Width = 100
    Height = 24
    DataField = 'IN_DELO_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 36
    Visible = True
  end
  object dcCreateMan: TDBComboBoxEh
    Left = 115
    Top = 585
    Width = 246
    Height = 24
    DataField = 'VISIT_MAN'
    EditButtons = <
      item
        Hint = #1057#1086#1089#1090#1072#1074#1080#1083' '#1076#1086#1082#1091#1084#1077#1085#1090
        Style = ebsEllipsisEh
        OnClick = dcCreateManEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 37
    Visible = True
  end
  object pnFileID: TPanel
    Left = 225
    Top = 380
    Width = 151
    Height = 24
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 38
    object lbFileID: TvchDBText
      Left = 0
      Top = 0
      Width = 147
      Height = 20
      Align = alClient
      Color = clInfoBk
      DataField = 'FILE_ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnClick = lbFileIDClick
      OnDblClick = lbFileIDClick
      OnGetText = lbFileIDGetText
    end
  end
  object alEditRec: TActionList
    Images = dmDocImg.imEditRec
    Left = 341
    Top = 402
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
      OnExecute = acWordExecute
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
    object acEditSignOrgs: TAction
      Category = 'SignOrg'
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1074
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1074
      ImageIndex = 12
      OnExecute = acEditSignOrgsExecute
    end
    object acClearSignOrgs: TAction
      Category = 'SignOrg'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1074
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1074
      ImageIndex = 20
      OnExecute = acClearSignOrgsExecute
    end
    object acAddSign: TAction
      Category = 'DocFile'
      Caption = #1069#1062#1055
      Hint = #1044#1086#1073#1072#1074#1090#1100' '#1069#1062#1055' '#1082#1086' '#1074#1089#1077#1084' '#1092#1072#1081#1083#1072#1084
      ImageIndex = 22
      OnExecute = acAddSignExecute
    end
  end
  object odFile: TOpenDialog
    Left = 386
    Top = 403
  end
  object imDocFile: TImageList
    Height = 32
    Width = 32
    Left = 431
    Top = 405
  end
  object pmWord: TPopupMenu
    Left = 477
    Top = 402
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '4.03 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 800
    Top = 154
  end
end
