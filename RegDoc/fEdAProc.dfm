object fmEdAProc: TfmEdAProc
  Left = 463
  Top = 191
  BorderStyle = bsDialog
  Caption = 
    #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086'-'#1082#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1092#1086#1088#1084#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1081' '#1079#1072#1080#1085#1090#1077#1088#1077#1089 +
    #1086#1074#1072#1085#1085#1099#1093' '#1083#1080#1094
  ClientHeight = 674
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvTop: TBevel
    Left = 4
    Top = 24
    Width = 882
    Height = 7
    Shape = bsTopLine
  end
  object laDocFile: TLabel
    Left = 10
    Top = 536
    Width = 84
    Height = 26
    Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
    WordWrap = True
  end
  object laFolderId: TLabel
    Left = 10
    Top = 618
    Width = 31
    Height = 13
    Caption = #1055#1072#1087#1082#1072
  end
  object laGroupId: TLabel
    Left = 305
    Top = 618
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object laReqCheck: TLabel
    Left = 10
    Top = 484
    Width = 49
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100
  end
  object laCheckOut: TLabel
    Left = 195
    Top = 484
    Width = 84
    Height = 13
    Caption = #1057#1085#1103#1090' '#1089' '#1082#1086#1085#1090#1088#1086#1083#1103
  end
  object laCheckDate: TLabel
    Left = 335
    Top = 484
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103
  end
  object laCheckMan: TLabel
    Left = 553
    Top = 473
    Width = 92
    Height = 26
    AutoSize = False
    Caption = #1055#1088#1080#1085#1103#1083' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1089#1085#1103#1090#1080#1080
    WordWrap = True
  end
  object laInFile: TLabel
    Left = 10
    Top = 511
    Width = 34
    Height = 13
    Caption = #1042' '#1076#1077#1083#1086
  end
  object laFileId: TLabel
    Left = 157
    Top = 511
    Width = 65
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1076#1077#1083#1072
  end
  object laRegNum: TLabel
    Left = 10
    Top = 38
    Width = 32
    Height = 13
    Caption = #8470' '#1087'/'#1087
  end
  object laRegInd: TLabel
    Left = 183
    Top = 38
    Width = 37
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089
  end
  object laRegDate: TLabel
    Left = 393
    Top = 38
    Width = 122
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
  end
  object laAppForm: TLabel
    Left = 638
    Top = 38
    Width = 72
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1087#1086#1076#1072#1095#1080
  end
  object laSignKind: TLabel
    Left = 10
    Top = 65
    Width = 75
    Height = 13
    Caption = #1042#1080#1076' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
  end
  object laSignName: TLabel
    Left = 344
    Top = 65
    Width = 54
    Height = 13
    Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
  end
  object laAdrText: TLabel
    Left = 10
    Top = 90
    Width = 87
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
  end
  object laAdrPhone: TLabel
    Left = 601
    Top = 90
    Width = 110
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
  end
  object laAppKind: TLabel
    Left = 10
    Top = 173
    Width = 79
    Height = 13
    Caption = #1042#1080#1076' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
  end
  object laNumList: TLabel
    Left = 306
    Top = 173
    Width = 36
    Height = 13
    Caption = #1051#1080#1089#1090#1086#1074
  end
  object laNumApp: TLabel
    Left = 427
    Top = 173
    Width = 62
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1086#1074
  end
  object laIsRepeat: TLabel
    Left = 571
    Top = 173
    Width = 49
    Height = 13
    Caption = #1055#1086#1074#1090#1086#1088#1085#1086
  end
  object laExecMan: TLabel
    Left = 10
    Top = 226
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object laExecTerm: TLabel
    Left = 513
    Top = 226
    Width = 87
    Height = 13
    Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object laExecOrg: TLabel
    Left = 10
    Top = 370
    Width = 97
    Height = 26
    AutoSize = False
    Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1086' '#1074
    WordWrap = True
  end
  object laExecDate: TLabel
    Left = 641
    Top = 377
    Width = 95
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
  end
  object laAnsKind: TLabel
    Left = 10
    Top = 403
    Width = 66
    Height = 13
    Caption = #1042#1080#1076' '#1088#1077#1096#1077#1085#1080#1103
  end
  object laAnsInd: TLabel
    Left = 641
    Top = 403
    Width = 78
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
  end
  object laAnsDate: TLabel
    Left = 272
    Top = 403
    Width = 129
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1086#1075#1086' '#1088#1077#1096#1077#1085#1080#1103
  end
  object laAnsText: TLabel
    Left = 10
    Top = 430
    Width = 44
    Height = 13
    Caption = #1056#1077#1096#1077#1085#1080#1077
  end
  object laDelivKind: TLabel
    Left = 10
    Top = 457
    Width = 68
    Height = 13
    Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
  end
  object laResDate: TLabel
    Left = 272
    Top = 457
    Width = 160
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1087#1086#1083#1091#1095#1077#1085#1080#1103')'
  end
  object laDocWork: TLabel
    Left = 10
    Top = 248
    Width = 70
    Height = 26
    Caption = #1061#1086#1076' '#1088#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1103
    WordWrap = True
  end
  object laSignCount: TLabel
    Left = 409
    Top = 65
    Width = 29
    Height = 13
    Caption = '+%d'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laProcCount: TLabel
    Left = 93
    Top = 200
    Width = 29
    Height = 13
    Caption = '+%d'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object laAdmProc: TLabel
    Left = 10
    Top = 200
    Width = 56
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
  end
  object laProvDoc: TLabel
    Left = 7
    Top = 116
    Width = 153
    Height = 40
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090', '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1081' '#1083#1080#1095#1085#1086#1089#1090#1100' ('#1077#1089#1083#1080' '#1090#1088#1077#1073#1091#1077#1090#1089#1103')'
    WordWrap = True
  end
  object laProvSer: TLabel
    Left = 440
    Top = 117
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object laProvNum: TLabel
    Left = 570
    Top = 117
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object laProvDate: TLabel
    Left = 753
    Top = 117
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object laPersonId: TLabel
    Left = 606
    Top = 144
    Width = 141
    Height = 13
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Bevel1: TBevel
    Left = 159
    Top = 111
    Width = 3
    Height = 50
  end
  object laProvOrg: TLabel
    Left = 166
    Top = 144
    Width = 31
    Height = 13
    Caption = #1054#1088#1075#1072#1085
  end
  object laDeloDate: TLabel
    Left = 559
    Top = 512
    Width = 89
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1083#1077#1085#1080#1103
  end
  object Label1: TLabel
    Left = 10
    Top = 649
    Width = 48
    Height = 13
    Caption = #1057#1086#1089#1090#1072#1074#1080#1083
  end
  object sbFileID: TSpeedButton
    Left = 508
    Top = 507
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
    Left = 483
    Top = 507
    Width = 23
    Height = 22
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '
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
  object tbaEditRec: TToolBar
    Left = 0
    Top = 0
    Width = 891
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
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btShablon: TToolButton
      Left = 31
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072' (F10)'
      Caption = 'btShablon'
      Enabled = False
      ImageIndex = 19
      OnClick = btShablonClick
    end
    object btChoiceMen: TToolButton
      Left = 54
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
      Caption = 'btChoiceMen'
      DropdownMenu = pmChoiceMen
      ImageIndex = 13
    end
    object tbOk: TToolButton
      Left = 77
      Top = 0
      Action = acOk
    end
    object tbSep1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'tbSep1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 108
      Top = 0
      Action = acCancel
    end
  end
  object dcFolderId: TDBComboBoxEh
    Left = 125
    Top = 614
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
    TabOrder = 42
    Visible = True
  end
  object dlGroupId: TDBLookupComboboxEh
    Left = 410
    Top = 624
    Width = 424
    Height = 21
    DataField = 'LOOKUP_GROUP_ID'
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    TabOrder = 44
    Visible = False
  end
  object paDocFile: TPanel
    Left = 125
    Top = 536
    Width = 700
    Height = 69
    BevelOuter = bvLowered
    TabOrder = 41
    object DOC_FILE: TDBGridEh
      Left = 1
      Top = 1
      Width = 217
      Height = 67
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
      Left = 452
      Top = 1
      Width = 247
      Height = 67
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
  object tbaDocFile: TToolBar
    Left = 835
    Top = 536
    Width = 46
    Height = 66
    Align = alNone
    AutoSize = True
    Caption = 'tbaFile'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 40
    object tbFileAdd: TToolButton
      Left = 0
      Top = 0
      Action = acFileAdd
    end
    object tbFileDelete: TToolButton
      Left = 23
      Top = 0
      Action = acFileDelete
      Wrap = True
    end
    object tbFileEdit: TToolButton
      Left = 0
      Top = 22
      Action = acFileEdit
    end
    object tbFileView: TToolButton
      Left = 23
      Top = 22
      Action = acFileView
      Wrap = True
    end
    object tbFileViewList: TToolButton
      Left = 0
      Top = 44
      Action = acFileViewList
    end
  end
  object dcReqCheck: TDBComboBoxEh
    Left = 125
    Top = 478
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
    TabOrder = 33
    Visible = True
  end
  object chbCheckOut: TDBCheckBoxEh
    Left = 297
    Top = 482
    Width = 18
    Height = 17
    DataField = 'CHECK_OUT'
    TabOrder = 34
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbCheckOutClick
  end
  object deCheckDate: TDBDateTimeEditEh
    Left = 442
    Top = 478
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
    TabOrder = 35
    Visible = True
  end
  object deCheckMan: TDBComboBoxEh
    Left = 651
    Top = 478
    Width = 185
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
    TabOrder = 36
    Visible = True
  end
  object chbInFile: TDBCheckBoxEh
    Left = 125
    Top = 509
    Width = 18
    Height = 17
    DataField = 'IN_FILE'
    TabOrder = 37
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbInFileClick
  end
  object dlFileId: TDBLookupComboboxEh
    Left = 805
    Top = 505
    Width = 75
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
    TabOrder = 38
    Visible = False
  end
  object deRegNum: TDBNumberEditEh
    Left = 125
    Top = 34
    Width = 41
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
  object deRegInd: TDBEditEh
    Left = 231
    Top = 34
    Width = 145
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
  object deRegDate: TDBDateTimeEditEh
    Left = 529
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
    TabOrder = 3
    Visible = True
  end
  object dcAppForm: TDBComboBoxEh
    Left = 732
    Top = 34
    Width = 152
    Height = 24
    DataField = 'APP_FORM'
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
  object dcSignKind: TDBComboBoxEh
    Left = 125
    Top = 59
    Width = 182
    Height = 24
    DataField = 'SIGN_KIND'
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
  object deSignName: TDBEditEh
    Left = 442
    Top = 59
    Width = 442
    Height = 24
    DataField = 'SIGN_NAME'
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = deSignNameEditClick
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
        OnClick = deSignNameClearClick
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
  object deAdrText: TDBEditEh
    Left = 125
    Top = 84
    Width = 440
    Height = 24
    DataField = 'ADR_TEXT'
    EditButtons = <
      item
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1080#1079' '#1073#1072#1079#1099' '#1072#1076#1088#1077#1089#1086#1074'...'
        Style = ebsEllipsisEh
        OnClick = deAdrTextEditClick
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
        OnClick = deAdrTextClearClick
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object deAdrPhone: TDBEditEh
    Left = 731
    Top = 84
    Width = 153
    Height = 24
    DataField = 'ADR_PHONE'
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
  object dcAppKind: TDBComboBoxEh
    Left = 125
    Top = 167
    Width = 151
    Height = 24
    DataField = 'APP_KIND'
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
  object deNumList: TDBEditEh
    Left = 357
    Top = 167
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
    TabOrder = 16
    Visible = True
  end
  object deNumApp: TDBEditEh
    Left = 505
    Top = 167
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
    TabOrder = 17
    Visible = True
  end
  object chbIsRepeat: TDBCheckBoxEh
    Left = 634
    Top = 171
    Width = 18
    Height = 17
    DataField = 'IS_REPEAT'
    TabOrder = 18
    TabStop = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chbIsRepeatClick
  end
  object deRepeatText: TDBEditEh
    Left = 658
    Top = 167
    Width = 226
    Height = 24
    DataField = 'REPEAT_TEXT'
    EditButtons = <
      item
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          04000000000060000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFF00FFFFF0000FFFFF00FFFFF
          0000FFFFF00FFFFF0000FF00000000FF0000FF00000000FF0000FFFFF00FFFFF
          0000FFFFF00FFFFF0000FFFFF00FFFFF0000FFFFFFFFFFFF0000}
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100'...'
        Style = ebsGlyphEh
        OnClick = deRepeatAddClick
      end
      item
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100'...'
        Style = ebsEllipsisEh
        OnClick = deRepeatEditClick
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    Visible = True
  end
  object dcExecMan: TDBComboBoxEh
    Left = 125
    Top = 220
    Width = 354
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
    TabOrder = 21
    Visible = True
  end
  object deExecTerm: TDBDateTimeEditEh
    Left = 615
    Top = 220
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
    TabOrder = 22
    Visible = True
  end
  object dlExecOrg: TDBLookupComboboxEh
    Left = 125
    Top = 371
    Width = 436
    Height = 24
    DataField = 'LOOKUP_EXEC_ORG'
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
    TabOrder = 25
    Visible = True
  end
  object deExecDate: TDBDateTimeEditEh
    Left = 745
    Top = 371
    Width = 90
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
    TabOrder = 26
    Visible = True
  end
  object dcAnsKind: TDBComboBoxEh
    Left = 125
    Top = 397
    Width = 134
    Height = 24
    DataField = 'ANS_KIND'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    Visible = True
  end
  object deAnsInd: TDBEditEh
    Left = 745
    Top = 397
    Width = 90
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
    Left = 442
    Top = 397
    Width = 90
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
  object deAnsText: TDBEditEh
    Left = 125
    Top = 424
    Width = 710
    Height = 24
    DataField = 'ANS_TEXT'
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
  object dcDelivKind: TDBComboBoxEh
    Left = 125
    Top = 451
    Width = 134
    Height = 24
    DataField = 'DELIV_KIND'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 31
    Visible = True
  end
  object deResDate: TDBDateTimeEditEh
    Left = 442
    Top = 451
    Width = 90
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
    TabOrder = 32
    Visible = True
  end
  object DOC_WORK: TDBGridEh
    Left = 125
    Top = 248
    Width = 724
    Height = 114
    AllowedOperations = [alopUpdateEh]
    DrawMemoText = True
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 23
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object tbaDocWork: TToolBar
    Left = 859
    Top = 247
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
    TabOrder = 24
    object tbWorkAdd: TToolButton
      Left = 0
      Top = 0
      Action = acWorkAdd
      Wrap = True
    end
    object tbWorkDel: TToolButton
      Left = 0
      Top = 22
      Action = acWorkDel
      Wrap = True
    end
    object tbWorkEdit: TToolButton
      Left = 0
      Top = 44
      Action = acWorkEdit
      Wrap = True
    end
    object tbWorkDown: TToolButton
      Left = 0
      Top = 66
      Action = acWorkDown
      Wrap = True
    end
    object tbWorkUp: TToolButton
      Left = 0
      Top = 88
      Action = acWorkUp
    end
  end
  object dcAdmProc: TDBComboBoxEh
    Left = 125
    Top = 194
    Width = 758
    Height = 24
    DataField = 'ADM_PROC'
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
    TabOrder = 20
    Visible = True
  end
  object dcGroupId: TDBComboBoxEh
    Left = 361
    Top = 614
    Width = 464
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
    TabOrder = 43
    Visible = True
  end
  object deProvOrg: TDBEditEh
    Left = 209
    Top = 138
    Width = 376
    Height = 24
    DataField = 'PROV_ORG'
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
  object dcProvType: TDBComboBoxEh
    Left = 166
    Top = 111
    Width = 257
    Height = 24
    DataField = 'PROV_TYPE'
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
  object deProvSer: TDBEditEh
    Left = 483
    Top = 111
    Width = 64
    Height = 24
    DataField = 'PROV_SER'
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
  object deProvNum: TDBEditEh
    Left = 616
    Top = 111
    Width = 110
    Height = 24
    DataField = 'PROV_NUM'
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
  object deProvDate: TDBDateTimeEditEh
    Left = 794
    Top = 111
    Width = 90
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
    TabOrder = 12
    Visible = True
  end
  object dePersonId: TDBEditEh
    Left = 757
    Top = 138
    Width = 127
    Height = 24
    DataField = 'PERSON_ID'
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
  object deDeloDate: TDBDateTimeEditEh
    Left = 669
    Top = 506
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
    TabOrder = 39
    Visible = True
  end
  object dcCreateMan: TDBComboBoxEh
    Left = 125
    Top = 643
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
    TabOrder = 45
    Visible = True
  end
  object pnFileID: TPanel
    Left = 247
    Top = 506
    Width = 235
    Height = 24
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 46
    object lbFileID: TvchDBText
      Left = 0
      Top = 0
      Width = 231
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
      OnGetText = lbFileIDGetText
    end
  end
  object alEditRec: TActionList
    Images = dmDocImg.imEditRec
    Left = 391
    Top = 411
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
    object acWorkAdd: TAction
      Category = 'DocWork'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 6
      OnExecute = acWorkAddExecute
    end
    object acWorkDel: TAction
      Category = 'DocWork'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 7
      OnExecute = acWorkDelExecute
    end
    object acWorkEdit: TAction
      Category = 'DocWork'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 12
      OnExecute = acWorkEditExecute
    end
    object acWorkUp: TAction
      Category = 'DocWork'
      Caption = #1042#1074#1077#1088#1093
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074#1074#1077#1088#1093
      ImageIndex = 8
      OnExecute = acWorkUpExecute
    end
    object acWorkDown: TAction
      Category = 'DocWork'
      Caption = #1042#1085#1080#1079
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074#1085#1080#1079
      ImageIndex = 9
      OnExecute = acWorkDownExecute
    end
  end
  object odFile: TOpenDialog
    Left = 420
    Top = 420
  end
  object imDocFile: TImageList
    Height = 32
    Width = 32
    Left = 553
    Top = 430
  end
  object pmWord: TPopupMenu
    Left = 605
    Top = 427
  end
  object pmChoiceMen: TPopupMenu
    Left = 80
    Top = 32
    object miZSmert: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1080#1090#1077#1083#1103' '#1080#1079' '#1079'/'#1072' '#1086' '#1089#1084#1077#1088#1090#1080
      OnClick = miZSmertClick
    end
    object miZRogd: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1103#1074#1080#1090#1077#1083#1103' '#1080#1079' '#1079'/'#1072' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
      OnClick = miZRogdClick
    end
  end
end
