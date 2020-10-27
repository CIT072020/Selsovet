object fmEdIn: TfmEdIn
  Left = 417
  Top = 130
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086'-'#1082#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1074#1093#1086#1076#1103#1097#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 706
  ClientWidth = 976
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvTop: TBevel
    Left = 8
    Top = 24
    Width = 959
    Height = 7
    Shape = bsTopLine
  end
  object laFolderId: TLabel
    Left = 10
    Top = 652
    Width = 31
    Height = 13
    Caption = #1055#1072#1087#1082#1072
  end
  object laGroupId: TLabel
    Left = 295
    Top = 652
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object laRegDate: TLabel
    Left = 10
    Top = 39
    Width = 94
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
  end
  object laRegInd: TLabel
    Left = 233
    Top = 39
    Width = 91
    Height = 13
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1080#1085#1076#1077#1082#1089
  end
  object laRegNum: TLabel
    Left = 521
    Top = 39
    Width = 32
    Height = 13
    Caption = #8470' '#1087'/'#1087
  end
  object laDelivKind: TLabel
    Left = 642
    Top = 39
    Width = 87
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1076#1086#1089#1090#1072#1074#1082#1080
  end
  object laSignOrg: TLabel
    Left = 10
    Top = 67
    Width = 79
    Height = 13
    Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090
  end
  object laSignName: TLabel
    Left = 642
    Top = 67
    Width = 49
    Height = 13
    Caption = #1055#1086#1076#1087#1080#1089#1072#1083
  end
  object laDocDate: TLabel
    Left = 10
    Top = 94
    Width = 84
    Height = 13
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laDocInd: TLabel
    Left = 244
    Top = 94
    Width = 95
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laReqDate: TLabel
    Left = 234
    Top = 121
    Width = 12
    Height = 13
    Caption = #1086#1090
  end
  object laReqInd: TLabel
    Left = 10
    Top = 114
    Width = 87
    Height = 26
    AutoSize = False
    Caption = #1054#1090#1074#1077#1090' '#1085#1072' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#8470
    WordWrap = True
  end
  object laDocKind: TLabel
    Left = 10
    Top = 148
    Width = 77
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object laNumList: TLabel
    Left = 446
    Top = 148
    Width = 36
    Height = 13
    Caption = #1051#1080#1089#1090#1086#1074
  end
  object laNumApp: TLabel
    Left = 570
    Top = 148
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1081
  end
  object laContent: TLabel
    Left = 10
    Top = 169
    Width = 62
    Height = 26
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
    WordWrap = True
  end
  object laAdrNote: TLabel
    Left = 672
    Top = 175
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object laAdrPhone: TLabel
    Left = 672
    Top = 203
    Width = 44
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object laSubjId: TLabel
    Left = 10
    Top = 231
    Width = 48
    Height = 13
    Caption = #1058#1077#1084#1072#1090#1080#1082#1072
  end
  object laReqText: TLabel
    Left = 672
    Top = 231
    Width = 82
    Height = 13
    Caption = #1050#1086#1084#1091' '#1072#1076#1088#1077#1089#1086#1074#1072#1085
  end
  object laResText: TLabel
    Left = 10
    Top = 260
    Width = 56
    Height = 26
    Caption = #1058#1077#1082#1089#1090' '#1088#1077#1079#1086#1083#1102#1094#1080#1080
    WordWrap = True
  end
  object laResMan: TLabel
    Left = 672
    Top = 265
    Width = 90
    Height = 13
    Caption = #1040#1074#1090#1086#1088' '#1088#1077#1079#1086#1083#1102#1094#1080#1080
  end
  object laResDate: TLabel
    Left = 672
    Top = 293
    Width = 85
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1077#1079#1086#1083#1102#1094#1080#1080
  end
  object laExecMan: TLabel
    Left = 10
    Top = 335
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object laExecTerm: TLabel
    Left = 437
    Top = 335
    Width = 87
    Height = 13
    Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laExecFact: TLabel
    Left = 672
    Top = 335
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laAnsText: TLabel
    Left = 10
    Top = 391
    Width = 94
    Height = 45
    AutoSize = False
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072' ('#1088#1077#1096#1077#1085#1080#1103')'
    WordWrap = True
  end
  object laAnsInd: TLabel
    Left = 672
    Top = 428
    Width = 76
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1086#1090#1074#1077#1090#1072
  end
  object laAnsDate: TLabel
    Left = 672
    Top = 402
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
  end
  object laReqCheck: TLabel
    Left = 10
    Top = 464
    Width = 49
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100
  end
  object laCheckOut: TLabel
    Left = 192
    Top = 464
    Width = 84
    Height = 13
    Caption = #1057#1085#1103#1090' '#1089' '#1082#1086#1085#1090#1088#1086#1083#1103
  end
  object laCheckDate: TLabel
    Left = 355
    Top = 464
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103
  end
  object laCheckMan: TLabel
    Left = 672
    Top = 448
    Width = 92
    Height = 26
    AutoSize = False
    Caption = #1055#1088#1080#1085#1103#1083' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1089#1085#1103#1090#1080#1080
    WordWrap = True
  end
  object laInFile: TLabel
    Left = 10
    Top = 491
    Width = 34
    Height = 13
    Caption = #1042' '#1076#1077#1083#1086
  end
  object laFileId: TLabel
    Left = 147
    Top = 491
    Width = 65
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1076#1077#1083#1072
  end
  object laDocFile: TLabel
    Left = 10
    Top = 518
    Width = 84
    Height = 26
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
    WordWrap = True
  end
  object imSMDO: TImage
    Left = 944
    Top = 36
    Width = 17
    Height = 17
    Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085' '#1085#1072' '#1087#1086#1095#1090#1077' '#1057#1052#1044#1054
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
  object Bevel1: TBevel
    Left = 8
    Top = 323
    Width = 959
    Height = 7
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 8
    Top = 253
    Width = 959
    Height = 6
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 8
    Top = 385
    Width = 959
    Height = 7
    Shape = bsTopLine
  end
  object laDeloDate: TLabel
    Left = 672
    Top = 491
    Width = 89
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1083#1077#1085#1080#1103
  end
  object Label1: TLabel
    Left = 10
    Top = 682
    Width = 48
    Height = 13
    Caption = #1057#1086#1089#1090#1072#1074#1080#1083
  end
  object tbaDocFile: TToolBar
    Left = 940
    Top = 516
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
    TabOrder = 38
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
    Left = 115
    Top = 515
    Width = 814
    Height = 117
    BevelOuter = bvLowered
    TabOrder = 37
    object DOC_FILE: TDBGridEh
      Left = 1
      Top = 1
      Width = 217
      Height = 115
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
      Left = 563
      Top = 1
      Width = 250
      Height = 115
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
    Width = 976
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
    object btSMDO: TToolButton
      Left = 23
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' ('#1087#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100') '#1074#1093#1086#1076#1103#1097#1077#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1087#1086#1095#1090#1099' '#1057#1052#1044#1054
      Caption = 'btSMDO'
      ImageIndex = 18
      OnClick = btSMDOClick
    end
    object ToolButton1: TToolButton
      Left = 46
      Top = 0
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      DropdownMenu = pmRun
      ImageIndex = 23
      Visible = False
    end
    object btShablon: TToolButton
      Left = 69
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072' (F10)'
      Caption = 'btShablon'
      Enabled = False
      ImageIndex = 19
      OnClick = btShablonClick
    end
    object tbSep2: TToolButton
      Left = 92
      Top = 0
      Width = 8
      Caption = 'tbSep2'
      Enabled = False
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbOk: TToolButton
      Left = 100
      Top = 0
      Action = acOk
    end
    object tbSep1: TToolButton
      Left = 123
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      Enabled = False
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 131
      Top = 0
      Action = acCancel
    end
  end
  object dcFolderId: TDBComboBoxEh
    Left = 115
    Top = 648
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
    TabOrder = 39
    Visible = True
  end
  object dlGroupId: TDBLookupComboboxEh
    Left = 333
    Top = 640
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
    TabOrder = 41
    Visible = False
  end
  object deRegDate: TDBDateTimeEditEh
    Left = 115
    Top = 33
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
    Left = 337
    Top = 33
    Width = 163
    Height = 24
    DataField = 'REG_IND'
    EditButtons = <
      item
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' (Ctrl+))'
        ShortCut = 0
        Style = ebsPlusEh
        Visible = False
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
    Top = 33
    Width = 55
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
    Left = 742
    Top = 33
    Width = 193
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
    Top = 61
    Width = 460
    Height = 24
    DataField = 'LOOKUP_SIGN_ORG'
    EditButtons = <
      item
        Style = ebsEllipsisEh
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
        Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
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
    Left = 742
    Top = 61
    Width = 193
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
  object deDocDate: TDBDateTimeEditEh
    Left = 115
    Top = 88
    Width = 100
    Height = 24
    DataField = 'DOC_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 7
    Visible = True
  end
  object deDocInd: TDBEditEh
    Left = 354
    Top = 88
    Width = 127
    Height = 24
    DataField = 'DOC_IND'
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
  object deReqDate: TDBDateTimeEditEh
    Left = 265
    Top = 115
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
    TabOrder = 10
    Visible = True
  end
  object deReqInd: TDBEditEh
    Left = 115
    Top = 115
    Width = 100
    Height = 24
    DataField = 'REQ_IND'
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
  object dcDocKind: TDBComboBoxEh
    Left = 115
    Top = 142
    Width = 302
    Height = 24
    DataField = 'DOC_KIND'
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
  object deNumList: TDBEditEh
    Left = 493
    Top = 142
    Width = 55
    Height = 24
    DataField = 'NUM_LIST'
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
  object deNumApp: TDBEditEh
    Left = 643
    Top = 142
    Width = 43
    Height = 24
    DataField = 'NUM_APP'
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
  object deContent: TDBEditEh
    Left = 115
    Top = 169
    Width = 539
    Height = 52
    AutoSize = False
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
    WantReturns = True
    WordWrap = True
  end
  object deAdrNote: TDBEditEh
    Left = 772
    Top = 169
    Width = 193
    Height = 24
    DataField = 'ADR_NOTE'
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
  object deAdrPhone: TDBEditEh
    Left = 772
    Top = 197
    Width = 193
    Height = 24
    DataField = 'ADR_PHONE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    Visible = True
  end
  object dlSubjId: TDBLookupComboboxEh
    Left = 115
    Top = 225
    Width = 460
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
  object deResText: TDBEditEh
    Left = 115
    Top = 259
    Width = 539
    Height = 60
    AutoSize = False
    DataField = 'RES_TEXT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    Visible = True
    WordWrap = True
  end
  object dcResMan: TDBComboBoxEh
    Left = 772
    Top = 259
    Width = 193
    Height = 24
    DataField = 'RES_MAN'
    DropDownBox.Width = 220
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
    TabOrder = 25
    Visible = True
  end
  object deResDate: TDBDateTimeEditEh
    Left = 772
    Top = 287
    Width = 100
    Height = 24
    DataField = 'RES_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 26
    Visible = True
  end
  object dcExecMan: TDBComboBoxEh
    Left = 115
    Top = 329
    Width = 246
    Height = 24
    DataField = 'EXEC_MAN'
    EditButtons = <
      item
        Hint = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
        Style = ebsEllipsisEh
        OnClick = dcExecManEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    Visible = True
  end
  object deExecTerm: TDBDateTimeEditEh
    Left = 544
    Top = 329
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
    TabOrder = 18
    Visible = True
  end
  object deExecFact: TDBDateTimeEditEh
    Left = 772
    Top = 329
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
    TabOrder = 27
    Visible = True
  end
  object deAnsText: TDBEditEh
    Left = 115
    Top = 391
    Width = 539
    Height = 61
    AutoSize = False
    DataField = 'ANS_TEXT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object deAnsInd: TDBEditEh
    Left = 772
    Top = 422
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
    TabOrder = 29
    Visible = True
  end
  object deAnsDate: TDBDateTimeEditEh
    Left = 772
    Top = 396
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
    TabOrder = 28
    Visible = True
  end
  object dcReqCheck: TDBComboBoxEh
    Left = 115
    Top = 458
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
    TabOrder = 30
    Visible = True
  end
  object chbCheckOut: TDBCheckBoxEh
    Left = 294
    Top = 462
    Width = 18
    Height = 17
    DataField = 'CHECK_OUT'
    TabOrder = 31
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbCheckOutClick
  end
  object deCheckDate: TDBDateTimeEditEh
    Left = 435
    Top = 458
    Width = 100
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
    TabOrder = 32
    Visible = True
  end
  object deCheckMan: TDBComboBoxEh
    Left = 772
    Top = 449
    Width = 193
    Height = 24
    DataField = 'CHECK_MAN'
    DropDownBox.Width = 220
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
    TabOrder = 33
    Visible = True
  end
  object chbInFile: TDBCheckBoxEh
    Left = 115
    Top = 489
    Width = 18
    Height = 17
    DataField = 'IN_FILE'
    TabOrder = 34
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbInFileClick
  end
  object dlFileId: TDBLookupComboboxEh
    Left = 227
    Top = 485
    Width = 427
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
    TabOrder = 35
    Visible = True
  end
  object deReqText: TDBEditEh
    Left = 772
    Top = 225
    Width = 193
    Height = 24
    DataField = 'REQ_TEXT'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    Visible = True
  end
  object dcGroupId: TDBComboBoxEh
    Left = 349
    Top = 648
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
    TabOrder = 40
    Visible = True
  end
  object dePostID: TDBNumberEditEh
    Left = 752
    Top = 88
    Width = 121
    Height = 24
    DataField = 'POST_ID'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 42
    Visible = False
  end
  object deExecMens: TDBEditEh
    Left = 115
    Top = 357
    Width = 854
    Height = 24
    Color = clInfoBk
    DataField = 'IDEN_TEXT'
    EditButtons = <
      item
        Hint = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1077#1081
        Style = ebsEllipsisEh
        OnClick = deExecMensEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 19
    Visible = True
  end
  object deExecMensID: TDBEditEh
    Left = 840
    Top = 651
    Width = 106
    Height = 24
    DataField = 'IDEN_DATE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    Visible = False
  end
  object deDeloDate: TDBDateTimeEditEh
    Left = 772
    Top = 485
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
    Top = 676
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
    TabOrder = 43
    Visible = True
  end
  object alEditRec: TActionList
    Images = dmDocImg.imEditRec
    Left = 341
    Top = 501
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
  end
  object odFile: TOpenDialog
    Left = 386
    Top = 502
  end
  object imDocFile: TImageList
    Height = 32
    Width = 32
    Left = 431
    Top = 504
  end
  object pmWord: TPopupMenu
    Left = 477
    Top = 509
  end
  object pmRun: TPopupMenu
    Left = 40
    Top = 296
    object StrCalcIndex: TMenuItem
      Caption = #1060#1086#1088#1084#1091#1083#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1074#1093#1086#1076#1103#1097#1077#1075#1086' '#1080#1085#1076#1077#1082#1089#1072
    end
  end
end
