object fmEditRec: TfmEditRec
  Left = 457
  Top = 181
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086'-'#1082#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1075#1088#1072#1078#1076#1072#1085
  ClientHeight = 673
  ClientWidth = 855
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
  PixelsPerInch = 96
  TextHeight = 13
  object tbaEditRec: TToolBar
    Left = 0
    Top = 0
    Width = 855
    Height = 22
    AutoSize = True
    Caption = 'tbaEditRec'
    EdgeBorders = []
    Flat = True
    Images = dmDocImg.imEditRec
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbPreview: TToolButton
      Left = 0
      Top = 0
      Action = acPreview
    end
    object tbPrint: TToolButton
      Left = 23
      Top = 0
      Action = acPrint
    end
    object tbWord: TToolButton
      Left = 46
      Top = 0
      Action = acWord
      DropdownMenu = pmWord
    end
    object tbSep2: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'tbSep2'
      ImageIndex = 2
      Style = tbsSeparator
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
  object pcDoc: TPageControl
    Left = 0
    Top = 22
    Width = 855
    Height = 651
    ActivePage = tsPage1
    Align = alClient
    TabOrder = 1
    object tsPage1: TTabSheet
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
      object laRegDate: TLabel
        Left = 280
        Top = 26
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object bv01: TBevel
        Left = 184
        Top = 10
        Width = 653
        Height = 6
        Shape = bsTopLine
      end
      object laGroup01: TLabel
        Left = 10
        Top = 4
        Width = 155
        Height = 13
        Caption = '1. '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laRegNum: TLabel
        Left = 10
        Top = 26
        Width = 32
        Height = 13
        Caption = #8470' '#1087'/'#1087
      end
      object laRegInd: TLabel
        Left = 162
        Top = 26
        Width = 37
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089
      end
      object laAppForm: TLabel
        Left = 431
        Top = 16
        Width = 69
        Height = 26
        AutoSize = False
        Caption = #1060#1086#1088#1084#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        WordWrap = True
      end
      object bv02: TBevel
        Left = 176
        Top = 54
        Width = 659
        Height = 6
        Shape = bsTopLine
      end
      object laGroup02: TLabel
        Left = 10
        Top = 48
        Width = 150
        Height = 13
        Caption = '2. '#1047#1072#1103#1074#1080#1090#1077#1083#1100'/'#1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laSignType: TLabel
        Left = 10
        Top = 74
        Width = 64
        Height = 13
        Caption = #1042#1080#1076' '#1087#1086#1076#1087#1080#1089#1080
      end
      object laSignName: TLabel
        Left = 10
        Top = 100
        Width = 54
        Height = 13
        Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
      end
      object laAdrText: TLabel
        Left = 10
        Top = 127
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object laSignGroup: TLabel
        Left = 533
        Top = 93
        Width = 92
        Height = 26
        Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1072#1103' '#1075#1088#1091#1087#1087#1072'/'#1082#1072#1090#1077#1075#1086#1088#1080#1103
        WordWrap = True
      end
      object laAdrPhone: TLabel
        Left = 533
        Top = 154
        Width = 44
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object laAdrNote: TLabel
        Left = 10
        Top = 153
        Width = 88
        Height = 13
        Caption = #1044#1088#1091#1075#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        WordWrap = True
      end
      object bv03: TBevel
        Left = 104
        Top = 184
        Width = 733
        Height = 6
        Shape = bsTopLine
      end
      object laGroup03: TLabel
        Left = 10
        Top = 178
        Width = 79
        Height = 13
        Caption = '3. '#1054#1073#1088#1072#1097#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laAppKind: TLabel
        Left = 10
        Top = 197
        Width = 19
        Height = 13
        Caption = #1042#1080#1076
      end
      object laNumList: TLabel
        Left = 232
        Top = 197
        Width = 36
        Height = 13
        Caption = #1051#1080#1089#1090#1086#1074
      end
      object laContent: TLabel
        Left = 108
        Top = 326
        Width = 725
        Height = 13
        AutoSize = False
        Caption = 
          #1048#1076#1077#1085#1090#1080#1095#1085#1099#1077' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1080#1083#1080' '#1086#1073#1088#1072#1097#1077#1085#1080#1103', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077' '#1091#1090#1086#1095#1085#1103#1102#1097#1080#1077' ('#1076#1086#1087#1086#1083 +
          #1085#1103#1102#1097#1080#1077') '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object laNumApp: TLabel
        Left = 353
        Top = 197
        Width = 63
        Height = 13
        Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1081
      end
      object laSubjId: TLabel
        Left = 10
        Top = 225
        Width = 48
        Height = 13
        Caption = #1058#1077#1084#1072#1090#1080#1082#1072
      end
      object laIsRepeat: TLabel
        Left = 10
        Top = 306
        Width = 49
        Height = 13
        Caption = #1055#1086#1074#1090#1086#1088#1085#1086
      end
      object laRepeatText: TLabel
        Left = 141
        Top = 306
        Width = 198
        Height = 13
        Caption = #1044#1072#1090#1099', '#1080#1085#1076#1077#1082#1089#1099' '#1087#1086#1074#1090#1086#1088#1085#1099#1093' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
      end
      object bv04: TBevel
        Left = 265
        Top = 403
        Width = 572
        Height = 6
        Shape = bsTopLine
      end
      object laCoverCorr: TLabel
        Left = 10
        Top = 424
        Width = 79
        Height = 13
        Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090
      end
      object laCoverType: TLabel
        Left = 640
        Top = 449
        Width = 19
        Height = 13
        Caption = #1042#1080#1076
      end
      object laCoverText: TLabel
        Left = 10
        Top = 442
        Width = 85
        Height = 26
        AutoSize = False
        Caption = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072', '#1087#1086#1088#1091#1095#1077#1085#1080#1103
        WordWrap = True
      end
      object laCoverDate: TLabel
        Left = 550
        Top = 424
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object laCoverInd: TLabel
        Left = 705
        Top = 424
        Width = 37
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089
      end
      object laReqAns: TLabel
        Left = 10
        Top = 474
        Width = 86
        Height = 13
        Caption = #1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1086#1090#1074#1077#1090
      end
      object laReqTerm: TLabel
        Left = 144
        Top = 474
        Width = 64
        Height = 13
        Caption = #1057#1088#1086#1082' '#1086#1090#1074#1077#1090#1072
      end
      object laReqDate: TLabel
        Left = 10
        Top = 500
        Width = 65
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
      end
      object laReqInd: TLabel
        Left = 238
        Top = 500
        Width = 37
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089
      end
      object laReqText: TLabel
        Left = 352
        Top = 490
        Width = 76
        Height = 26
        AutoSize = False
        Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
        WordWrap = True
      end
      object laGroup04: TLabel
        Left = 10
        Top = 398
        Width = 239
        Height = 13
        Caption = '4. '#1057#1086#1087#1088#1086#1074#1086#1076#1080#1090#1077#1083#1100#1085#1086#1077' '#1087#1080#1089#1100#1084#1086'/'#1055#1086#1088#1091#1095#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bv04_1: TBevel
        Left = 192
        Top = 536
        Width = 642
        Height = 6
        Shape = bsTopLine
      end
      object laGroup04_1: TLabel
        Left = 10
        Top = 530
        Width = 164
        Height = 13
        Caption = '4. '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1083#1080#1095#1085#1086#1084' '#1087#1088#1080#1077#1084#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laVisitOut: TLabel
        Left = 756
        Top = 556
        Width = 50
        Height = 13
        Caption = #1042#1099#1077#1079#1076#1085#1086#1081
      end
      object laVisitChief: TLabel
        Left = 644
        Top = 556
        Width = 74
        Height = 13
        Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
      end
      object laVisit: TLabel
        Left = 387
        Top = 550
        Width = 70
        Height = 26
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1087#1088#1080#1077#1084#1072
        WordWrap = True
      end
      object laVisitMan: TLabel
        Left = 10
        Top = 556
        Width = 51
        Height = 13
        Caption = #1042#1077#1083' '#1087#1088#1080#1077#1084
      end
      object laSignPlace: TLabel
        Left = 533
        Top = 127
        Width = 95
        Height = 13
        Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      end
      object laSignCount: TLabel
        Left = 76
        Top = 100
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
      object laSubjCount: TLabel
        Left = 76
        Top = 225
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
      object laFromVisit: TLabel
        Left = 640
        Top = 19
        Width = 58
        Height = 26
        AutoSize = False
        Caption = #1057' '#1083#1080#1095#1085#1086#1075#1086' '#1087#1088#1080#1077#1084#1072
        WordWrap = True
      end
      object laSignNum: TLabel
        Left = 314
        Top = 62
        Width = 70
        Height = 26
        AutoSize = False
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1077#1083#1086#1074#1077#1082
        WordWrap = True
      end
      object laSignKind: TLabel
        Left = 533
        Top = 74
        Width = 75
        Height = 13
        Caption = #1042#1080#1076' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
      end
      object laRepeatCount: TLabel
        Left = 353
        Top = 306
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
      object laGroup04_2: TLabel
        Left = 10
        Top = 577
        Width = 119
        Height = 13
        Caption = '4. '#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1087#1088#1080#1077#1084#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bv04_2: TBevel
        Left = 191
        Top = 583
        Width = 641
        Height = 6
        Shape = bsTopLine
      end
      object laVisitManE: TLabel
        Left = 10
        Top = 603
        Width = 37
        Height = 13
        Caption = #1055#1088#1080#1085#1103#1083
      end
      object laVisitE: TLabel
        Left = 387
        Top = 601
        Width = 69
        Height = 16
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
        WordWrap = True
      end
      object Label3: TLabel
        Left = 10
        Top = 247
        Width = 62
        Height = 26
        Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
        WordWrap = True
      end
      object Label4: TLabel
        Left = 10
        Top = 348
        Width = 95
        Height = 13
        AutoSize = False
        Caption = #1044#1072#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 375
        Width = 95
        Height = 13
        AutoSize = False
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object laTelLine: TLabel
        Left = 734
        Top = 19
        Width = 66
        Height = 26
        AutoSize = False
        Caption = #1055#1088#1103#1084#1072#1103' '#1090#1077#1083'.'#13#10#1083#1080#1085#1080#1103
        WordWrap = True
      end
      object deRegDate: TDBDateTimeEditEh
        Left = 321
        Top = 20
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
      object deRegNum: TDBNumberEditEh
        Left = 106
        Top = 20
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
        TabOrder = 0
        Visible = True
      end
      object deRegInd: TDBEditEh
        Left = 211
        Top = 20
        Width = 55
        Height = 24
        DataField = 'REG_IND'
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
      object dcAppForm: TDBComboBoxEh
        Left = 512
        Top = 20
        Width = 113
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
      object dcSignType: TDBComboBoxEh
        Left = 106
        Top = 68
        Width = 191
        Height = 24
        DataField = 'SIGN_TYPE'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = True
        OnUpdateData = dcSignTypeUpdateData
      end
      object deSignName: TDBEditEh
        Left = 106
        Top = 94
        Width = 400
        Height = 24
        DataField = 'SIGN_NAME'
        EditButtons = <
          item
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
        TabOrder = 8
        Visible = True
      end
      object dcSignGroup: TDBComboBoxEh
        Left = 652
        Top = 94
        Width = 179
        Height = 24
        DataField = 'SIGN_GROUP'
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
      object deAdrText: TDBEditEh
        Left = 106
        Top = 121
        Width = 400
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
        TabOrder = 10
        Visible = True
      end
      object deAdrPhone: TDBEditEh
        Left = 652
        Top = 148
        Width = 179
        Height = 24
        DataField = 'ADR_PHONE'
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
      object deAdrNote: TDBEditEh
        Left = 106
        Top = 148
        Width = 400
        Height = 24
        DataField = 'ADR_NOTE'
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
      object dcAppKind: TDBComboBoxEh
        Left = 106
        Top = 191
        Width = 115
        Height = 24
        DataField = 'APP_KIND'
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
      object deContent: TDBEditEh
        Left = 106
        Top = 247
        Width = 735
        Height = 50
        AutoSize = False
        DataField = 'CONTENT'
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
      object chbIsRepeat: TDBCheckBoxEh
        Left = 106
        Top = 304
        Width = 18
        Height = 17
        DataField = 'IS_REPEAT'
        TabOrder = 22
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = chbIsRepeatClick
      end
      object deRepeatText: TDBEditEh
        Left = 388
        Top = 300
        Width = 453
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
        TabOrder = 23
        Visible = True
      end
      object dcCoverType: TDBComboBoxEh
        Left = 679
        Top = 443
        Width = 146
        Height = 24
        DataField = 'COVER_TYPE'
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
      object deCoverText: TDBEditEh
        Left = 106
        Top = 443
        Width = 517
        Height = 24
        DataField = 'COVER_TEXT'
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
      object deCoverInd: TDBEditEh
        Left = 754
        Top = 418
        Width = 71
        Height = 24
        DataField = 'COVER_IND'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 28
        Visible = True
      end
      object deCoverDate: TDBDateTimeEditEh
        Left = 589
        Top = 418
        Width = 90
        Height = 24
        DataField = 'COVER_DATE'
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
      object chbReqAns: TDBCheckBoxEh
        Left = 106
        Top = 472
        Width = 18
        Height = 17
        DataField = 'REQ_ANS'
        TabOrder = 31
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = chbReqAnsClick
      end
      object deReqTerm: TDBDateTimeEditEh
        Left = 218
        Top = 468
        Width = 90
        Height = 24
        DataField = 'REQ_TERM'
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
      object deReqDate: TDBDateTimeEditEh
        Left = 106
        Top = 494
        Width = 90
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
        TabOrder = 33
        Visible = True
      end
      object deReqInd: TDBEditEh
        Left = 286
        Top = 494
        Width = 55
        Height = 24
        DataField = 'REQ_IND'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 34
        Visible = True
      end
      object deReqText: TDBEditEh
        Left = 431
        Top = 494
        Width = 410
        Height = 24
        DataField = 'REQ_TEXT'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 35
        Visible = True
      end
      object dcVisitMan: TDBComboBoxEh
        Left = 106
        Top = 550
        Width = 263
        Height = 24
        DataField = 'VISIT_MAN'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 36
        Visible = True
      end
      object deRegDate2: TDBDateTimeEditEh
        Left = 464
        Top = 550
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
        TabOrder = 37
        Visible = True
      end
      object chbVisitChief: TDBCheckBoxEh
        Left = 730
        Top = 554
        Width = 18
        Height = 17
        DataField = 'VISIT_CHIEF'
        TabOrder = 39
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object chbVisitOut: TDBCheckBoxEh
        Left = 818
        Top = 554
        Width = 18
        Height = 17
        DataField = 'VISIT_OUT'
        TabOrder = 40
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dlCoverCorr: TDBLookupComboboxEh
        Left = 106
        Top = 418
        Width = 423
        Height = 24
        DataField = 'LOOKUP_COVER_CORR'
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
        TabOrder = 26
        Visible = True
      end
      object dlSignPlace: TDBLookupComboboxEh
        Left = 652
        Top = 121
        Width = 179
        Height = 24
        DataField = 'LOOKUP_SIGN_PLACE'
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
      object dlSubjId: TDBLookupComboboxEh
        Left = 505
        Top = 190
        Width = 330
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
        TabOrder = 19
        Visible = False
        OnUpdateData = dlSubjIdUpdateData
      end
      object deNumApp: TDBEditEh
        Left = 431
        Top = 191
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
        TabOrder = 18
        Visible = True
      end
      object deNumList: TDBEditEh
        Left = 283
        Top = 191
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
        TabOrder = 17
        Visible = True
      end
      object deVisitTime: TDBDateTimeEditEh
        Left = 579
        Top = 550
        Width = 45
        Height = 24
        DataField = 'VISIT_TIME'
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 38
        Visible = True
        EditFormat = 'HH:NN'
      end
      object chbFromVisit: TDBCheckBoxEh
        Left = 698
        Top = 24
        Width = 18
        Height = 17
        DataField = 'FROM_VISIT'
        TabOrder = 4
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object deSignNum: TDBNumberEditEh
        Left = 390
        Top = 68
        Width = 45
        Height = 24
        DataField = 'SIGN_NUM'
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
      object dcSignKind: TDBComboBoxEh
        Left = 652
        Top = 68
        Width = 179
        Height = 24
        DataField = 'SIGN_KIND'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = True
        OnUpdateData = dcSignTypeUpdateData
      end
      object chbAdrIn: TDBCheckBoxEh
        Left = 633
        Top = 125
        Width = 15
        Height = 17
        DataField = 'ADR_IN'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = chbAdrInClick
      end
      object deAdrPlace: TDBEditEh
        Left = 728
        Top = 121
        Width = 94
        Height = 24
        DataField = 'ADR_PLACE'
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
      object dcVisitManE: TDBComboBoxEh
        Left = 106
        Top = 597
        Width = 262
        Height = 24
        DataField = 'VISIT_MAN'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 41
        Visible = True
      end
      object deRegDate2E: TDBDateTimeEditEh
        Left = 464
        Top = 597
        Width = 89
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
        TabOrder = 42
        Visible = True
      end
      object deVisitTimeE: TDBDateTimeEditEh
        Left = 579
        Top = 597
        Width = 45
        Height = 24
        DataField = 'VISIT_TIME'
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 43
        Visible = True
        EditFormat = 'HH:NN'
      end
      object edIdenDate: TDBEditEh
        Left = 106
        Top = 342
        Width = 735
        Height = 24
        DataField = 'IDEN_DATE'
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
      object edIdenText: TDBEditEh
        Left = 106
        Top = 369
        Width = 735
        Height = 24
        DataField = 'Iden_Text'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        Visible = True
      end
      object chbTelLine: TDBCheckBoxEh
        Left = 804
        Top = 24
        Width = 18
        Height = 17
        DataField = 'TEL_LINE'
        TabOrder = 44
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dlSubjIdG: TDBLookupComboboxEh
        Left = 106
        Top = 219
        Width = 735
        Height = 24
        DataField = 'SUBJ_ID'
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
        TabOrder = 20
        Visible = True
        OnUpdateData = dlSubjIdUpdateData
      end
    end
    object tsPage2: TTabSheet
      Caption = #1056#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1077
      ImageIndex = 1
      object bv05: TBevel
        Left = 176
        Top = 10
        Width = 660
        Height = 6
        Shape = bsTopLine
      end
      object laGroup05: TLabel
        Left = 10
        Top = 4
        Width = 154
        Height = 13
        Caption = '5. '#1056#1077#1079#1086#1083#1102#1094#1080#1103'/'#1048#1089#1087#1086#1083#1085#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laResText: TLabel
        Left = 10
        Top = 24
        Width = 56
        Height = 26
        Caption = #1058#1077#1082#1089#1090' '#1088#1077#1079#1086#1083#1102#1094#1080#1080
        WordWrap = True
      end
      object laResMan: TLabel
        Left = 630
        Top = 30
        Width = 31
        Height = 13
        Caption = #1040#1074#1090#1086#1088
      end
      object laResDate: TLabel
        Left = 628
        Top = 55
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object laExecMan: TLabel
        Left = 10
        Top = 81
        Width = 66
        Height = 13
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      end
      object laExecOrg: TLabel
        Left = 11
        Top = 107
        Width = 132
        Height = 13
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085' '#1085#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1077
      end
      object laExecDate: TLabel
        Left = 10
        Top = 133
        Width = 95
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object laExecTerm: TLabel
        Left = 328
        Top = 133
        Width = 87
        Height = 13
        Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      end
      object laExecFact: TLabel
        Left = 567
        Top = 133
        Width = 88
        Height = 13
        Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      end
      object bv07: TBevel
        Left = 256
        Top = 330
        Width = 580
        Height = 6
        Shape = bsTopLine
      end
      object laGroup07: TLabel
        Left = 10
        Top = 324
        Width = 228
        Height = 13
        Caption = '7. '#1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1103' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laAnsKind: TLabel
        Left = 10
        Top = 350
        Width = 53
        Height = 13
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      end
      object laAnsDate: TLabel
        Left = 561
        Top = 350
        Width = 65
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
      end
      object laAnsText: TLabel
        Left = 10
        Top = 374
        Width = 62
        Height = 26
        Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
        WordWrap = True
      end
      object laAnsInd: TLabel
        Left = 436
        Top = 350
        Width = 37
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089
      end
      object bv06: TBevel
        Left = 144
        Top = 162
        Width = 692
        Height = 6
        Shape = bsTopLine
      end
      object laGroup06: TLabel
        Left = 10
        Top = 156
        Width = 121
        Height = 13
        Caption = '6. '#1061#1086#1076' '#1088#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laGroup08: TLabel
        Left = 10
        Top = 442
        Width = 246
        Height = 13
        Caption = '8. '#1050#1086#1085#1090#1088#1086#1083#1100'/'#1054#1090#1084#1077#1090#1082#1072' '#1086' '#1089#1085#1103#1090#1080#1080' '#1089' '#1082#1086#1085#1090#1088#1086#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laCheckOut: TLabel
        Left = 175
        Top = 458
        Width = 48
        Height = 26
        Caption = #1057#1085#1103#1090' '#1089' '#1082#1086#1085#1090#1088#1086#1083#1103
        WordWrap = True
      end
      object laCheckDate: TLabel
        Left = 269
        Top = 468
        Width = 64
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103
      end
      object laCheckMan: TLabel
        Left = 451
        Top = 468
        Width = 131
        Height = 13
        Caption = #1055#1088#1080#1085#1103#1083' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1089#1085#1103#1090#1080#1080
      end
      object bv09: TBevel
        Left = 64
        Top = 493
        Width = 772
        Height = 6
        Shape = bsTopLine
      end
      object laGroup09: TLabel
        Left = 10
        Top = 487
        Width = 44
        Height = 13
        Caption = '9. '#1044#1077#1083#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object laInFile: TLabel
        Left = 10
        Top = 508
        Width = 34
        Height = 13
        Caption = #1042' '#1076#1077#1083#1086
      end
      object laFileId: TLabel
        Left = 136
        Top = 508
        Width = 65
        Height = 13
        Caption = #1048#1085#1076#1077#1082#1089' '#1076#1077#1083#1072
      end
      object laFileVol: TLabel
        Left = 656
        Top = 508
        Width = 18
        Height = 13
        Caption = #1058#1086#1084
      end
      object laFileList: TLabel
        Left = 741
        Top = 508
        Width = 24
        Height = 13
        Caption = #1051#1080#1089#1090
      end
      object bv08: TBevel
        Left = 274
        Top = 448
        Width = 562
        Height = 6
        Shape = bsTopLine
      end
      object laOrderText: TLabel
        Left = 10
        Top = 304
        Width = 67
        Height = 13
        Caption = #1055#1088#1077#1076#1087#1080#1089#1072#1085#1080#1077
      end
      object laOrderOrg: TLabel
        Left = 232
        Top = 304
        Width = 25
        Height = 13
        Caption = #1050#1086#1084#1091
      end
      object laOrderDate: TLabel
        Left = 415
        Top = 304
        Width = 39
        Height = 13
        Caption = #1042#1099#1076#1072#1085#1086
      end
      object laOrderTerm: TLabel
        Left = 569
        Top = 304
        Width = 25
        Height = 13
        Caption = #1057#1088#1086#1082
      end
      object laOrderFact: TLabel
        Left = 711
        Top = 304
        Width = 32
        Height = 13
        Caption = #1054#1090#1074#1077#1090
      end
      object laReqCheck: TLabel
        Left = 10
        Top = 468
        Width = 49
        Height = 13
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
      end
      object Label1: TLabel
        Left = 422
        Top = 81
        Width = 87
        Height = 13
        Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      end
      object Label2: TLabel
        Left = 10
        Top = 421
        Width = 72
        Height = 13
        Caption = #1051#1080#1095#1085#1099#1081' '#1087#1088#1080#1077#1084
      end
      object Label6: TLabel
        Left = 9
        Top = 529
        Width = 159
        Height = 13
        Caption = '10. '#1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 181
        Top = 535
        Width = 652
        Height = 6
        Shape = bsTopLine
      end
      object laDeloDate: TLabel
        Left = 424
        Top = 508
        Width = 89
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1083#1077#1085#1080#1103
      end
      object deResText: TDBEditEh
        Left = 106
        Top = 24
        Width = 507
        Height = 47
        AutoSize = False
        DataField = 'RES_TEXT'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = True
        WordWrap = True
      end
      object deResDate: TDBDateTimeEditEh
        Left = 668
        Top = 49
        Width = 110
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
        TabOrder = 2
        Visible = True
      end
      object dcResMan: TDBComboBoxEh
        Left = 668
        Top = 24
        Width = 170
        Height = 24
        DataField = 'RES_MAN'
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
      object dcExecMan: TDBComboBoxEh
        Left = 106
        Top = 75
        Width = 295
        Height = 24
        DataField = 'EXEC_MAN'
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
      object deExecDate: TDBDateTimeEditEh
        Left = 158
        Top = 127
        Width = 80
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
        TabOrder = 6
        Visible = True
      end
      object deExecTerm: TDBDateTimeEditEh
        Left = 429
        Top = 127
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
        TabOrder = 7
        Visible = True
      end
      object deExecFact: TDBDateTimeEditEh
        Left = 673
        Top = 127
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
        TabOrder = 8
        Visible = True
      end
      object dcAnsKind: TDBComboBoxEh
        Left = 106
        Top = 344
        Width = 304
        Height = 24
        DataField = 'ANS_KIND'
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
      object deAnsText: TDBEditEh
        Left = 106
        Top = 370
        Width = 735
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
        Left = 486
        Top = 344
        Width = 55
        Height = 24
        DataField = 'ANS_IND'
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
      object deAnsDate: TDBDateTimeEditEh
        Left = 641
        Top = 344
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
        TabOrder = 18
        Visible = True
      end
      object DOC_WORK: TDBGridEh
        Left = 10
        Top = 174
        Width = 764
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
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object chbCheckOut: TDBCheckBoxEh
        Left = 239
        Top = 466
        Width = 18
        Height = 17
        DataField = 'CHECK_OUT'
        TabOrder = 22
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = chbCheckOutClick
      end
      object deCheckDate: TDBDateTimeEditEh
        Left = 352
        Top = 462
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
        TabOrder = 23
        Visible = True
      end
      object deCheckMan: TDBComboBoxEh
        Left = 606
        Top = 462
        Width = 170
        Height = 24
        DataField = 'CHECK_MAN'
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
      object chbInFile: TDBCheckBoxEh
        Left = 106
        Top = 506
        Width = 18
        Height = 17
        DataField = 'IN_FILE'
        TabOrder = 25
        TabStop = False
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = chbInFileClick
      end
      object deFileList: TDBNumberEditEh
        Left = 777
        Top = 502
        Width = 41
        Height = 24
        Alignment = taLeftJustify
        DataField = 'FILE_LIST'
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
      object deFileVol: TDBNumberEditEh
        Left = 689
        Top = 502
        Width = 41
        Height = 24
        Alignment = taLeftJustify
        DataField = 'FILE_VOL'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 28
        Visible = True
      end
      object dlFileId: TDBLookupComboboxEh
        Left = 219
        Top = 502
        Width = 182
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
        TabOrder = 26
        Visible = True
      end
      object dlExecOrg: TDBLookupComboboxEh
        Left = 158
        Top = 101
        Width = 491
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
        TabOrder = 5
        Visible = True
      end
      object tbaDocWork: TToolBar
        Left = 784
        Top = 174
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
        TabOrder = 10
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
        object tbWorkUp: TToolButton
          Left = 0
          Top = 66
          Action = acWorkUp
          Wrap = True
        end
        object tbWorkDown: TToolButton
          Left = 0
          Top = 88
          Action = acWorkDown
        end
      end
      object deOrderText: TDBEditEh
        Left = 106
        Top = 298
        Width = 118
        Height = 24
        DataField = 'ORDER_TEXT'
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
      object dlOrderOrg: TDBLookupComboboxEh
        Left = 267
        Top = 298
        Width = 129
        Height = 24
        DataField = 'LOOKUP_ORDER_ORG'
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
        TabOrder = 12
        Visible = True
      end
      object deOrderDate: TDBDateTimeEditEh
        Left = 463
        Top = 298
        Width = 90
        Height = 24
        DataField = 'ORDER_DATE'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 13
        Visible = True
      end
      object deOrderTerm: TDBDateTimeEditEh
        Left = 603
        Top = 298
        Width = 90
        Height = 24
        DataField = 'ORDER_TERM'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 14
        Visible = True
      end
      object deOrderFact: TDBDateTimeEditEh
        Left = 750
        Top = 298
        Width = 90
        Height = 24
        DataField = 'ORDER_FACT'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 15
        Visible = True
      end
      object dcReqCheck: TDBComboBoxEh
        Left = 106
        Top = 462
        Width = 50
        Height = 24
        DataField = 'REQ_CHECK'
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
      object deExecTerm2: TDBDateTimeEditEh
        Left = 523
        Top = 75
        Width = 90
        Height = 24
        DataField = 'EXEC_TERM2'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object deAnsVisit: TDBEditEh
        Left = 106
        Top = 417
        Width = 735
        Height = 24
        DataField = 'ANS_VISIT'
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        Visible = True
      end
      object paDocFile: TPanel
        Left = 10
        Top = 545
        Width = 764
        Height = 69
        BevelOuter = bvLowered
        TabOrder = 30
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
          Left = 516
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
        Left = 784
        Top = 545
        Width = 46
        Height = 66
        Align = alNone
        Caption = 'tbaFile'
        EdgeBorders = []
        Flat = True
        Images = dmDocImg.imEditRec
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
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
      object deDeloDate: TDBDateTimeEditEh
        Left = 532
        Top = 502
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
        TabOrder = 27
        Visible = True
      end
    end
    object tsWork: TTabSheet
      Caption = 'tsWork'
      ImageIndex = 2
      object laFolderId: TLabel
        Left = 10
        Top = 563
        Width = 31
        Height = 13
        Caption = #1055#1072#1087#1082#1072
      end
      object bvBottom: TBevel
        Left = 8
        Top = 545
        Width = 826
        Height = 6
        Shape = bsTopLine
      end
      object laGroupId: TLabel
        Left = 309
        Top = 563
        Width = 36
        Height = 13
        Caption = #1043#1088#1091#1087#1087#1072
      end
      object dcFolderId: TDBComboBoxEh
        Left = 106
        Top = 559
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
        TabOrder = 0
        Visible = True
      end
      object dlGroupId: TDBLookupComboboxEh
        Left = 384
        Top = 511
        Width = 392
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
        TabOrder = 2
        Visible = True
      end
      object tbaSignType: TToolBar
        Left = 16
        Top = 11
        Width = 23
        Height = 22
        Align = alNone
        AutoSize = True
        Caption = 'tbaSignType'
        EdgeBorders = []
        Flat = True
        Images = dmDocImg.imEditRec
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = False
        object tbSignType: TToolButton
          Left = 0
          Top = 0
          ImageIndex = 14
        end
      end
      object dcGroupId: TDBComboBoxEh
        Left = 384
        Top = 559
        Width = 392
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
        TabOrder = 1
        Visible = True
      end
    end
  end
  object alEditRec: TActionList
    Images = dmDocImg.imEditRec
    Left = 472
    Top = 8
    object acWorkEdit: TAction
      Category = 'DocWork'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 12
      OnExecute = acWorkEditExecute
    end
    object acOk: TAction
      Category = 'Main'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074' '#1073#1072#1079#1077
      ImageIndex = 1
      OnExecute = acOkExecute
    end
    object acWorkAdd: TAction
      Category = 'DocWork'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 6
      OnExecute = acWorkAddExecute
    end
    object acCancel: TAction
      Category = 'Main'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      ImageIndex = 0
      OnExecute = acCancelExecute
    end
    object acWorkDel: TAction
      Category = 'DocWork'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 7
      OnExecute = acWorkDelExecute
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
    object acFileAdd: TAction
      Category = 'DocFile'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 6
      OnExecute = acFileAddExecute
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
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100'...'
      ImageIndex = 12
      OnExecute = acFileEditExecute
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
  object pmWord: TPopupMenu
    Left = 416
    Top = 8
  end
  object odFile: TOpenDialog
    Left = 500
    Top = 500
  end
  object imDocFile: TImageList
    Height = 32
    Width = 32
    Left = 553
    Top = 502
  end
end
