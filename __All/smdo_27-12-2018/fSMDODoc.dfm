inherited fmSMDODoc: TfmSMDODoc
  Left = 330
  Top = 84
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 690
  ClientWidth = 974
  Constraints.MinHeight = 700
  Constraints.MinWidth = 988
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000000000000000000000000000000000000000
    00120000002C212109722A2A0B872A2A0B872A2A0B872A2A0B872A2A0B872A2A
    0B872A2A0B872A2A0B872A2A0B872A2A0B87212109720000002C000000120000
    00090000001638381782FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFDFFFEFE
    FCFFFDFDFBFFFDFDFAFFFCFCF8FFFEFEF9FF3838178200000016000000090000
    000038381D004949267BFFFFFFFFFFFFFFFFFEFEFEFFFDFDFCFFFDFDFBFFFCFC
    F9FFFBFBF8FFFAFAF6FFF8F8F4FFFBFBF6FF4949267B38381D00000000003F3F
    240054542F0054542F77FFFFFFFFCCCCBBFFCBCBBAFFDCDCCBFFD2D2C1FFFBFB
    F8FFFAFAF6FFF8F8F4FFF7F7F2FFFBFBF5FF54542F7754542F003F3F24005858
    33005858330058583376FFFFFEFFEDEDDCFFEDEDDCFFECECDBFFEBEBDAFFFAFA
    F6FFF8F8F4FFF7F7F2FFF6F6F0FFFAFAF3FF5858337658583300585833005C5C
    37005C5C37005C5C3774FEFEFDFFCBCBBAFFDBDBCAFFC9C9B8FFC7C7B6FFD7D7
    C6FFD6D6C5FFCCCCBBFFD3D3C2FFFAFAF2FF5C5C37745C5C37005C5C37006161
    3A0061613A0061613A72FEFEFCFFECECDBFFEBEBDAFFE9E9D8FFE8E8D7FFE7E7
    D6FFE5E5D4FFE4E4D3FFE3E3D2FFF9F9EFFF61613A7261613A0061613A006565
    3E0065653E0065653E71FDFDFBFFC9C9B8FFC7C7B6FFC6C6B5FFD6D6C5FFC3C3
    B2FFD3D3C2FFD2D2C1FFC8C8B7FFF7F7EAFF65653E7165653E0065653E006969
    4200696942006969426FFDFDFAFFE9E9D8FFE8E8D7FFE7E7D6FFE5E5D4FFE4E4
    D3FFE3E3D2FFE2E2D1FFE0E0CFFFF4F4E5FF6969426F69694200696942006D6D
    45006D6D45006D6D456DFCFCF8FFC6C6B5FFD6D6C5FFC3C3B2FFC2C2B1FFC1C1
    B0FFC0C0AFFFCFCFBEFFC6C6B5FFF3F3E2FF6D6D456D6D6D45006D6D45007171
    4800717148007171486CFCFCF7FFE7E7D6FFE5E5D4FFE4E4D3FFE3E3D2FFF1F1
    E7FFECECDFFFE8E8D9FFE6E6D5FFF2F2E1FF7171486C71714800717148007474
    4C0074744C0074744C6BFBFBF6FFC3C3B2FFC2C2B1FFD2D2C1FFC8C8B7FFECEC
    DFFFE8E8D9FFE6E6D5FFE5E5D4FFF2F2E1FF74744C6B74744C0074744C007777
    4E0077774E0077774E69FAFAF4FFF5F5EEFFF4F4ECFFF1F1E7FFECECDFFFE8E8
    D9FFE6E6D5FFA4A493FFA4A493FFA4A493FF4949257C49492500494925007A7A
    51007A7A51007A7A5168FAFAF3FFF4F4ECFFF1F1E7FFECECDFFFE8E8D9FFE6E6
    D5FFE5E5D4FFB6B6A5FFFFFFFFFF7A7A51687A7A512579795000797950007D7D
    53007D7D53007D7D5367FCFCF5FFF9F9EFFFF6F6EAFFF4F4E5FFF3F3E2FFF2F2
    E1FFF2F2E1FFC2C2B1FF7D7D53677D7D53257A7A510079795000797950007E7E
    54007E7E54007F7F554D7F7F55667F7F55667F7F55667F7F55667F7F55667F7F
    55667F7F55667F7F55667F7F55247D7D53007A7A510079795000797950000000
    000000000000C0030000C0030000C0030000C0030000C0030000C0030000C003
    0000C0030000C0030000C0030000C0030000C0030000C0070000C00F0000}
  PixelsPerInch = 96
  TextHeight = 13
  inherited sp: TSplitter
    Top = 277
    Width = 974
  end
  inherited pnTable: TPanel
    Top = 280
    Width = 974
    Height = 388
    object pc: TPageControl
      Left = 0
      Top = 0
      Width = 974
      Height = 388
      ActivePage = tsDoc
      Align = alClient
      Constraints.MinHeight = 300
      TabOrder = 0
      OnChange = pcChange
      object tsDoc: TTabSheet
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        object gbFiles: TGroupBox
          Left = 0
          Top = 90
          Width = 966
          Height = 145
          Align = alClient
          Caption = ' '#1060#1072#1081#1083#1099' '
          Constraints.MinHeight = 125
          TabOrder = 0
          DesignSize = (
            966
            145)
          object GridFiles: TDBGridEh
            Left = 7
            Top = 15
            Width = 911
            Height = 125
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoFitColWidths = True
            DataSource = dsFiles
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
            HorzScrollBar.Visible = False
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            ParentFont = False
            PopupMenu = pmFiles
            ReadOnly = True
            RowHeight = 19
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            VertScrollBar.VisibleMode = sbAlwaysShowEh
            OnDblClick = GridFilesDblClick
            OnGetCellParams = GridFilesGetCellParams
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FILE_TYPE'
                Footers = <>
                ImageList = ImageList1
                Title.Caption = #1058#1080#1087
                Width = 29
                OnGetCellParams = GridFilesDocColumns0GetCellParams
              end
              item
                EditButtons = <>
                FieldName = 'STORE_KIND'
                Footers = <>
                Visible = False
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1048#1084#1103
                Title.ToolTips = True
                Width = 227
              end
              item
                EditButtons = <>
                FieldName = 'PATH'
                Footers = <>
                Visible = False
                Width = 297
              end
              item
                EditButtons = <>
                FieldName = 'DESC'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'SIGNATURE'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'SIGNINFO'
                Footers = <>
                Title.Caption = #1055#1086#1076#1087#1080#1089#1072#1074#1096#1080#1081
                Title.ToolTips = True
                ToolTips = True
                Width = 650
              end
              item
                EditButtons = <>
                FieldName = 'DATEC'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'DATEM'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
                Visible = False
              end>
          end
          object Panel2: TPanel
            Left = 917
            Top = 15
            Width = 47
            Height = 128
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btAddFile: TBitBtn
              Left = 9
              Top = 7
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = btAddFileClick
            end
            object btETSPFile: TBitBtn
              Left = 9
              Top = 74
              Width = 28
              Height = 28
              Hint = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086'-'#1094#1080#1092#1088#1086#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
              TabOrder = 1
              OnClick = btETSPFileClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000000000000000000000000000000000007F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F709BC12E73B42F73B33074B4719BC27F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F2F75B5
                4FC8FC4DC3F84DC4F83D92CC739CC17F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F4482BC3B92CE4DC1F64CBFF44DC3F83176B57F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                4986BD3E92CC53C6F853C5F83D92CC3377B5749EC27F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F4A86BE4294CD5ECCFC5CCBFA5E
                CDFD3D92CC357AB77F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F4A87BD4597CF67D2FC65CFFA67D2FC57B2E23578B4377AB63F81
                B883A7C57F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F4D88BF4999CF71
                D5FD60C6F844AEF44EB6F74FB8F941A9F03D8CCB4A87BB7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F3376B46DD1FE58BDF675D5FB79D8FC7AD9FC77D8
                FE5DC5FC3F8FCC85A8C57F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F3578B661
                CAFE80DCFE7EDBFD7FDCFF80DEFF81DFFF83E1FF5ABFF63C80B97F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F3679B66FD6FF7CDAFD7CDAFD70CAF14C97CB4C98
                CC73CEF471D9FF3C7EB87F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F377AB774
                DBFF77D8FC78DAFE4A96CB7F7F7F7F7F7F4D9ACE77E0FF3D7FBA7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F397BB86FD2F874D8FC75DAFD4A97CC7F7F7F7F7F
                7F4B95CA73D7FC3F82BB7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9BBEDB4F
                A0D371DBFE6FD8FC66C8F0448DC4468FC569CFF64F9ED19EC0DC7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F4F8BC14E9FD36AD4FB6DDAFF6EDDFF69D3
                F94E9ED1528FC27F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F9CBFDC3D7FB9478FC74791C73F81BA9EC0DD7F7F7F7F7F7F}
            end
            object btDelFile: TBitBtn
              Left = 9
              Top = 40
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 2
              OnClick = btDelFileClick
            end
          end
        end
        object gbMens: TGroupBox
          Left = 0
          Top = 235
          Width = 966
          Height = 125
          Align = alBottom
          Caption = ' '#1057#1087#1077#1094#1080#1072#1083#1080#1089#1090' '
          Constraints.MinHeight = 125
          TabOrder = 1
          DesignSize = (
            966
            125)
          object GridMens: TDBGridEh
            Left = 7
            Top = 15
            Width = 911
            Height = 103
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsMens
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
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            ParentFont = False
            PopupMenu = pmMens
            ReadOnly = True
            RowHeight = 19
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            VertScrollBar.VisibleMode = sbAlwaysShowEh
            Columns = <
              item
                Alignment = taLeftJustify
                EditButtons = <>
                FieldName = 'TIP'
                Footers = <>
                Title.Caption = #1058#1080#1087
                Width = 152
              end
              item
                EditButtons = <>
                FieldName = 'FIO'
                Footers = <>
                Title.Caption = #1060#1048#1054
                Width = 220
              end
              item
                EditButtons = <>
                FieldName = 'SIGNDATE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'OFFICIAL'
                Footers = <>
                Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
                Width = 187
              end
              item
                EditButtons = <>
                FieldName = 'ORG'
                Footers = <>
                Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
                Width = 288
              end
              item
                EditButtons = <>
                FieldName = 'RANK'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'ADRES'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'TEL_WORK'
                Footers = <>
                Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1088#1072#1073#1086#1095#1080#1081
                Width = 180
              end
              item
                EditButtons = <>
                FieldName = 'TEL_MOB'
                Footers = <>
                Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1084#1086#1073#1080#1083#1100#1085#1099#1081
                Width = 176
              end
              item
                EditButtons = <>
                FieldName = 'EMAIL'
                Footers = <>
                Visible = False
                Width = 173
              end
              item
                EditButtons = <>
                FieldName = 'SROK'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'ATTESTATION'
                Footers = <>
                Title.Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
                Visible = False
                Width = 178
              end>
          end
          object Panel3: TPanel
            Left = 917
            Top = 15
            Width = 47
            Height = 108
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btAddMen: TBitBtn
              Left = 9
              Top = 7
              Width = 28
              Height = 28
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 0
              OnClick = btAddMenClick
            end
            object btEditMen: TBitBtn
              Left = 9
              Top = 74
              Width = 28
              Height = 28
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 1
              OnClick = btEditMenClick
            end
            object btDelMen: TBitBtn
              Left = 9
              Top = 40
              Width = 28
              Height = 28
              Hint = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 2
              OnClick = btDelMenClick
            end
          end
        end
        object pnDoc: TPanel
          Left = 0
          Top = 0
          Width = 966
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          Constraints.MaxHeight = 125
          Constraints.MinHeight = 90
          TabOrder = 2
          object Label10: TLabel
            Left = 8
            Top = 70
            Width = 112
            Height = 13
            Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1076#1086#1089#1090#1091#1087#1072
          end
          object Label6: TLabel
            Left = 8
            Top = 41
            Width = 19
            Height = 13
            Caption = #1042#1080#1076
          end
          object Label11: TLabel
            Left = 411
            Top = 70
            Width = 83
            Height = 13
            Caption = #8470' '#1101#1082#1079'. '#1076#1083#1103' '#1044#1057#1055
          end
          object Label7: TLabel
            Left = 426
            Top = 41
            Width = 18
            Height = 13
            Caption = #1058#1080#1087
          end
          object Label8: TLabel
            Left = 708
            Top = 41
            Width = 36
            Height = 13
            Caption = #1051#1080#1089#1090#1086#1074
          end
          object Label13: TLabel
            Left = 8
            Top = 12
            Width = 55
            Height = 13
            Caption = #1040#1085#1085#1086#1090#1072#1094#1080#1103
          end
          object edFlag: TDBComboBoxEh
            Left = 135
            Top = 64
            Width = 234
            Height = 24
            DataField = 'FLAG'
            DataSource = dsDokument
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
          object edKind: TDBComboBoxEh
            Left = 42
            Top = 35
            Width = 327
            Height = 24
            DataField = 'KIND'
            DataSource = dsDokument
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
          object edNumCopy: TDBNumberEditEh
            Left = 507
            Top = 64
            Width = 56
            Height = 24
            DataField = 'NUMCOPY'
            DataSource = dsDokument
            DecimalPlaces = 0
            EditButton.Style = ebsUpDownEh
            EditButton.Visible = True
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 99.000000000000000000
            MinValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edCONFIDENT: TDBEditEh
            Left = 581
            Top = 64
            Width = 232
            Height = 24
            Hint = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
            HelpContext = 999
            DataField = 'CONFIDENT'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edDocType: TDBComboBoxEh
            Left = 459
            Top = 35
            Width = 204
            Height = 24
            DataField = 'DOC_TYPE'
            DataSource = dsDokument
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
          object edPages: TDBNumberEditEh
            Left = 760
            Top = 35
            Width = 54
            Height = 24
            DataField = 'PAGES'
            DataSource = dsDokument
            DecimalPlaces = 0
            EditButton.Style = ebsUpDownEh
            EditButton.Visible = True
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 9999.000000000000000000
            MinValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edKomm: TDBEditEh
            Left = 77
            Top = 6
            Width = 876
            Height = 24
            DataField = 'KOMM'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnDblClick = edKommDblClick
          end
          object edKindS: TDBEditEh
            Left = 296
            Top = 35
            Width = 89
            Height = 24
            DataField = 'KIND'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
      end
      object tsTask: TTabSheet
        Caption = #1047#1072#1076#1072#1085#1080#1103
        ImageIndex = 1
        object pnTask: TPanel
          Left = 0
          Top = 0
          Width = 966
          Height = 110
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            966
            110)
          object Label1: TLabel
            Left = 8
            Top = 68
            Width = 112
            Height = 13
            Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1076#1086#1089#1090#1091#1087#1072
          end
          object Label2: TLabel
            Left = 347
            Top = 68
            Width = 83
            Height = 13
            Caption = #8470' '#1101#1082#1079'. '#1076#1083#1103' '#1044#1057#1055
          end
          object vchDBText2: TvchDBText
            Left = 152
            Top = 9
            Width = 54
            Height = 18
            DataField = 'NOMER'
            DataSource = dsTask
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnGetText = vchDBText2GetText
          end
          object dbNavigator: TDBNavigator
            Left = 8
            Top = 4
            Width = 140
            Height = 25
            DataSource = dsTask
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
          object StaticText1: TStaticText
            Left = 210
            Top = 8
            Width = 17
            Height = 17
            Caption = #8470
            Color = clBtnFace
            ParentColor = False
            TabOrder = 1
          end
          object edTaskNumber: TDBEditEh
            Left = 233
            Top = 4
            Width = 111
            Height = 24
            HelpContext = 888
            DataField = 'TASKNUMBER'
            DataSource = dsTask
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
          object StaticText2: TStaticText
            Left = 355
            Top = 8
            Width = 16
            Height = 17
            Caption = #1086#1090
            Color = clBtnFace
            ParentColor = False
            TabOrder = 3
          end
          object edTaskDate: TDBDateTimeEditEh
            Left = 379
            Top = 4
            Width = 121
            Height = 24
            DataField = 'TASKDATE'
            DataSource = dsTask
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
          object N_F_DBCheckBoxEh1: TDBCheckBoxEh
            Left = 8
            Top = 89
            Width = 317
            Height = 17
            Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1086' '#1074' '#1087#1077#1088#1077#1076#1072#1102#1097#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
            DataField = 'TASK_REG'
            DataSource = dsTask
            TabOrder = 5
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object N_F_DBCheckBoxEh2: TDBCheckBoxEh
            Left = 331
            Top = 89
            Width = 356
            Height = 17
            Caption = #1050#1086#1087#1080#1103' '#1079#1072#1076#1072#1085#1080#1103', '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1086#1075#1086' '#1074' '#1087#1077#1088#1077#1076#1072#1102#1097#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
            DataField = 'TASK_COPY'
            DataSource = dsTask
            TabOrder = 6
            TabStop = False
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object StaticText11: TStaticText
            Left = 8
            Top = 38
            Width = 78
            Height = 17
            Caption = #1058#1077#1082#1089#1090' '#1079#1072#1076#1072#1085#1080#1103
            TabOrder = 7
          end
          object edTaskText: TDBEditEh
            Left = 99
            Top = 34
            Width = 578
            Height = 24
            DataField = 'TEXT'
            DataSource = dsTask
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Visible = True
            OnChange = edTaskTextChange
          end
          object StaticText12: TStaticText
            Left = 516
            Top = 8
            Width = 29
            Height = 17
            Hint = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
            Caption = #1057#1088#1086#1082
            Color = clBtnFace
            ParentColor = False
            TabOrder = 9
          end
          object edDeadLine: TDBDateTimeEditEh
            Left = 556
            Top = 4
            Width = 121
            Height = 24
            DataField = 'DEADLINE'
            DataSource = dsTask
            EditButton.Hint = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
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
          object edTaskFlag: TDBComboBoxEh
            Left = 135
            Top = 62
            Width = 192
            Height = 24
            DataField = 'FLAG'
            DataSource = dsTask
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
          object edTaskNUMCOPY: TDBNumberEditEh
            Left = 443
            Top = 62
            Width = 56
            Height = 24
            DataField = 'NUMCOPY'
            DataSource = dsTask
            DecimalPlaces = 0
            EditButton.Style = ebsUpDownEh
            EditButton.Visible = True
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 99.000000000000000000
            MinValue = 1.000000000000000000
            ParentFont = False
            TabOrder = 12
            Visible = True
          end
          object edTaskCONFIDENT: TDBEditEh
            Left = 521
            Top = 62
            Width = 157
            Height = 24
            Hint = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
            HelpContext = 999
            DataField = 'CONFIDENT'
            DataSource = dsTask
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
          object GroupBox3: TGroupBox
            Left = 693
            Top = 1
            Width = 271
            Height = 105
            Anchors = [akLeft, akTop, akRight]
            Caption = ' '#1057#1089#1099#1083#1082#1072' '#1085#1072' '#1076#1086#1082#1091#1084#1077#1085#1090' '
            TabOrder = 14
            object grReferredTask: TDBGridEh
              Left = 6
              Top = 16
              Width = 258
              Height = 82
              Hint = #1057#1089#1099#1083#1082#1080' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
              AutoFitColWidths = True
              DataSource = dsReferredTask
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
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              VertScrollBar.VisibleMode = sbNeverShowEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'REGNUMBER'
                  Footers = <>
                  OnGetCellParams = grReferredTaskColumns0GetCellParams
                end>
            end
          end
        end
      end
      object tsAddDoc: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
        ImageIndex = 2
        object pnFolder: TPanel
          Left = 0
          Top = 0
          Width = 966
          Height = 177
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            966
            177)
          object Label3: TLabel
            Left = 231
            Top = 12
            Width = 51
            Height = 13
            Caption = #1058#1080#1087' '#1087#1072#1087#1082#1080
          end
          object vchDBText1: TvchDBText
            Left = 152
            Top = 9
            Width = 66
            Height = 18
            DataField = 'IDNUMBER'
            DataSource = dsFolder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnGetText = vchDBText1GetText
          end
          object ImAddMat: TImage
            Left = 642
            Top = 10
            Width = 19
            Height = 19
            Hint = #1052#1072#1090#1077#1088#1080#1072#1083' '#1076#1086#1073#1072#1074#1083#1077#1085' '#1080#1079' '#1076#1088#1091#1075#1086#1075#1086' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
            Picture.Data = {
              055449636F6E0000010001001010000001002000680400001600000028000000
              1000000020000000010020000000000000040000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000AE9F90FF826A52FF
              6A4E33FF6A4E33FF826A52FFAE9F90FF00000000000000000000000000000000
              00000000000000000000000000000000C3B8ADFF6A4E33FFA38A72FFB89F87FF
              BCA38BFFBEA58DFFB99E83FFA4896DFF6A4E33FFC3B8ADFF0000000000000000
              000000000000000000000000C3B8ADFF785C40FFB6A08AFFB79E87FFB3987FFF
              B59B81FFB89D83FFBA9F85FFBCA187FFBBA084FF7D6044FFC3B8ADFF00000000
              0000000000000000000000006A4E33FFB39D87FFB8A18BFFAE947AFFB0967CFF
              B3987EFFB59A80FFB79C82FFBA9F84FFBCA186FFBA9F84FF6A4E33FF00000000
              0000000000000000AE9F90FFA8927EFFB39D88FFA98F76FFAC9178FFAE937AFF
              B0957CFFB2987EFFB59A80FFB79C82FFB99E84FFBCA186FFA4886DFFAE9F90FF
              00000000000000008C7560FFBDAC9CFFA48A72FFA78C74FFA98E76FFAB9178FF
              AD937AFFB0957CFFB2977EFFB49A80FFB79C82FFB99E84FFB79C82FF826A52FF
              0000000000000000765C42FFC2B1A3FFA28770FFA48A72FFA68C74FFA98E76FF
              AB9078FFAD9379FFAF957BFFB2977DFFB4997FFFB69C81FFB89D82FF6A4E33FF
              0000000000000000765C42FFC0B0A1FF9F856DFFA1876FFFA48971FFA68C73FF
              A88E75FFAB9077FFAD9279FFAF957BFFB1977DFFB4997FFFB59A80FF6A4E33FF
              0000000000000000826A52FFBDADA0FF9C826BFF9F856DFFA1876FFFA38971FF
              A68B73FFA88E75FFAA9077FFAC9279FFAF947BFFB1967DFFAF957BFF826A52FF
              0000000000000000AE9F90FFAF9D8DFFB4A191FF9C826BFF9E846DFFA1876FFF
              A38971FFA58B73FFA88D75FFAA8F77FFAC9279FFB49C85FF9B7F65FFAE9F90FF
              000000000000000000000000765C42FFC2B2A6FFA8927DFF9C826AFF9E846CFF
              A0866EFFA38870FFA58B72FFA78D74FFB09780FFAF957EFF6A4E33FF00000000
              000000000000000000000000C3B8ADFF877059FFC2B2A6FFAE9A87FFA28A75FF
              9E846CFFA0866EFFA28870FFB29B87FFB19B85FF775B40FFC3B8ADFF00000000
              00000000000000000000000000000000C3B8ADFF765C42FFA28D7AFFBDAC9FFF
              B9A899FFBBAA9AFFB7A492FFA08973FF6A4E33FFC3B8ADFF0000000000000000
              000000000000000000000000000000000000000000000000AE9F90FF826A52FF
              6A4E33FF6A4E33FF826A52FFAE9F90FF00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FFFF0000F81F0000E0070000C0030000C00300008001000080010000
              80010000800100008001000080010000C0030000C0030000E0070000F81F0000
              FFFF0000}
          end
          object StaticText13: TStaticText
            Left = 5
            Top = 38
            Width = 101
            Height = 17
            Caption = #1057#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1087#1072#1087#1082#1080
            TabOrder = 2
          end
          object edFolderContens: TDBEditEh
            Left = 118
            Top = 34
            Width = 838
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CONTENTS'
            DataSource = dsFolder
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = True
            OnDblClick = edFolderContensDblClick
          end
          object edAddType: TDBComboBoxEh
            Left = 295
            Top = 6
            Width = 338
            Height = 24
            HelpContext = 888
            DataField = 'ADD_TYPE'
            DataSource = dsFolder
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
          object DBNavigator1: TDBNavigator
            Left = 8
            Top = 4
            Width = 140
            Height = 25
            DataSource = dsFolder
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
          end
          object Panel4: TPanel
            Left = 0
            Top = 69
            Width = 966
            Height = 108
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel4'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 698
              Height = 108
              Align = alClient
              Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090' '
              TabOrder = 0
              DesignSize = (
                698
                108)
              object edNote: TDBMemo
                Left = 5
                Top = 14
                Width = 688
                Height = 89
                Hint = 
                  #1058#1077#1082#1089#1090', '#1103#1074#1083#1103#1102#1097#1080#1081#1089#1103' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1077#1084' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' ('#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1077#1084', '#1087#1086#1103#1089#1085#1077#1085 +
                  #1080#1077#1084', '#1089#1089#1099#1083#1082#1072#1084#1080' '#1080' '#1090'.'#1087'.)'
                HelpContext = 999
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'TEXT'
                DataSource = dsFolder
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnDblClick = edNoteDblClick
              end
            end
            object GroupBox2: TGroupBox
              Left = 698
              Top = 0
              Width = 268
              Height = 108
              Align = alRight
              Caption = ' '#1057#1089#1099#1083#1082#1072' '#1085#1072' '#1076#1086#1082#1091#1084#1077#1085#1090' '
              TabOrder = 1
              DesignSize = (
                268
                108)
              object grReferredAdd: TDBGridEh
                Left = 5
                Top = 16
                Width = 256
                Height = 85
                Hint = #1057#1089#1099#1083#1082#1080' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoFitColWidths = True
                DataSource = dsReferredAdd
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
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                VertScrollBar.VisibleMode = sbNeverShowEh
                OnDblClick = grReferredAddDblClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'REGNUMBER'
                    Footers = <>
                    OnGetCellParams = grReferredAddColumns0GetCellParams
                  end>
              end
            end
          end
        end
      end
      object tsPrim: TTabSheet
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ImageIndex = 3
        DesignSize = (
          966
          360)
        object edPrim: TDBMemo
          Left = 3
          Top = 4
          Width = 959
          Height = 352
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'ADD_TEXT'
          DataSource = dsDokument
          TabOrder = 0
          OnDblClick = edPrimDblClick
        end
      end
    end
  end
  inherited TBDock: TTBDock
    Width = 974
    inherited TBToolbar: TTBToolbar
      inherited TBItemPerekl: TTBItem [9]
        Visible = False
      end
      inherited TBItemAddHist: TTBSubmenuItem [10]
      end
      inherited TBItemAddHist1: TTBItem [11]
      end
      inherited TBItemHist: TTBItem [12]
      end
      inherited TBItemCreateHist: TTBItem [13]
      end
      inherited TBItemAddSvid: TTBItem [14]
      end
      inherited TBSubmenuRun: TTBSubmenuItem [15]
        inherited TBItemCkeckRegistr: TTBItem
          Visible = False
        end
      end
      object TBItemRegIsx: TTBItem [16]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        HelpContext = 1
        ImageIndex = 155
        OnClick = TBItemRegIsxClick
      end
      inherited TBItemSeekAkt: TTBItem [17]
      end
      inherited TBItemZAGS: TTBItem [18]
      end
      inherited TBItemAddList: TTBItem [19]
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1089#1099#1083#1082#1091' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        Visible = True
      end
      inherited TBItemDelList: TTBItem [20]
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1089#1099#1083#1082#1091' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        Visible = True
      end
      inherited TBItemShablon: TTBItem
        Visible = True
      end
      inherited TBItemEditMemo: TTBItem
        Visible = True
      end
      inherited TBItemAdresat: TTBItem
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089#1072#1090#1086#1074' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080
      end
      inherited TBToolbarOrgan: TTBToolbar
        Left = 391
        Top = 0
        Width = 142
        Height = 22
        AutoResize = False
        inherited lbOrgan: TLabel
          Anchors = [akTop]
          Visible = False
        end
        inherited edZAGS: TDBEditEh
          Width = 27
          Anchors = [akTop]
          Visible = False
        end
        inherited N_F_cbGorod: TDBCheckBoxEh
          Left = 142
          Top = 22
          Width = 77
          ParentCtl3D = False
          Visible = False
        end
      end
    end
  end
  inherited sb: TScrollBox
    Left = 1112
    Top = 64
    Width = 60
    Height = 80
    HorzScrollBar.Range = 809
    VertScrollBar.Range = 260
    VertScrollBar.Visible = False
    Align = alNone
    AutoScroll = False
    Constraints.MinHeight = 20
    Visible = False
    inherited pnPovtor: TPanel
      Left = 783
      Top = 256
      Width = 26
      Height = 41
    end
  end
  inherited StBar: TStatusBar
    Top = 668
    Width = 974
  end
  inherited pnAdd: TPanel
    Width = 974
  end
  object Panel1: TPanel [6]
    Left = 0
    Top = 50
    Width = 974
    Height = 227
    Align = alTop
    Constraints.MinHeight = 220
    TabOrder = 5
    object lbSMDOCode: TvchDBText
      Left = 768
      Top = 9
      Width = 97
      Height = 17
      DataField = 'SMDOCODE'
      DataSource = dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbSMDOCodeClick
      OnDblClick = lbSMDOCodeClick
    end
    object Label9: TLabel
      Left = 9
      Top = 66
      Width = 53
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    end
    object lbdOtvet_PARORG: TvchDBText
      Left = 678
      Top = 119
      Width = 123
      Height = 17
      DataField = 'PAR_PARORG'
      DataSource = dsDokument
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbSMDOCodeClick
      OnDblClick = lbSMDOCodeClick
    end
    object lbAdresat: TStaticText
      Left = 9
      Top = 11
      Width = 47
      Height = 17
      Caption = #1040#1076#1088#1077#1089#1072#1090
      TabOrder = 0
    end
    object edName: TDBEditEh
      Left = 82
      Top = 5
      Width = 679
      Height = 24
      Color = clInfoBk
      DataField = 'NAME'
      DataSource = dsDokument
      EditButtons = <
        item
          Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' '#1087#1086#1095#1090#1099' '#1057#1052#1044#1054
          Style = ebsEllipsisEh
          Width = 22
          OnClick = edNameEditButtons0Click
        end
        item
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00FF00FF008484
            8400848484008484840084848400848484008484840084848400848484008484
            84008484840084848400848484008484840000000000FF00FF00FF00FF008484
            8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600C6C6C6008484840000000000FF00FF00FF00FF008484
            840000848400C6C6C600C6C6C600C6C6C600008484000084840000848400C6C6
            C600C6C6C600C6C6C600008484008484840000000000FF00FF00FF00FF008484
            840000FFFF0000848400C6C6C600008484000000000000000000000000000084
            8400C6C6C60000848400C6C6C6008484840000000000FF00FF00FF00FF008484
            8400FFFFFF00FFFFFF000084840000000000FFFFFF00FFFFFF0000FFFF000000
            000000848400C6C6C600C6C6C6008484840000000000FF00FF00FF00FF008484
            840000FFFF00C6C6C60000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
            FF000000000000848400C6C6C6008484840000000000FF00FF00FF00FF008484
            8400C6C6C6000000000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
            FF00FFFFFF0000000000008484008484840000000000FF00FF00FF00FF008484
            840000000000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
            FF0000FFFF00FFFFFF00000000000084840000000000FF00FF00FF00FF008484
            8400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
            FF00FFFFFF00FFFFFF0000FFFF000000000000000000FF00FF00FF00FF008484
            8400848484008484840084848400848484008484840084848400848484008484
            84008484840084848400848484008484840000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1087#1077#1088#1077#1087#1080#1089#1082#1077
          Style = ebsGlyphEh
          Width = 22
          OnClick = edNameEditButtons1Click
        end
        item
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000000000000000000000000000000000007F7F7F824E0C
            7440006D3A00794C0F896029522D006443166A491C755226522A00774B108553
            117F7F7F00008C540D633904FFFFDDFFFFDBFFFED9FFFFDCFFFFDBFFFFDFFFF5
            D3FFFFF0FFFFF0FFFFE7FFFDCB844B0000007C4100885F2862451EFFFFE1775E
            3CFFFFD1674210FFFFDC6A5333FBF3E2484033FFFFED735123975C0D00009353
            008D59166D4209FFFFD868430FFFFFD2794F14FFFFD175582CFFFFE7564427FF
            FFE07249128D51000000A3610893590D87540EFFFFCD885A1AFFFFCA895917FF
            FFC97D5824FFFFDF6E5229FFFCCB8E6124955A0A00009E5E098F54049B6316FF
            FFC4986418FFFCB18B5710FFFFCD80581EFFFFCE866534FFFFD48C602388530A
            0000A3630EA26B208D5C18FFFFC3946724FFFFC1996927FFFFD07D5A28FFFFE0
            6C552FFFFFDD845F279A661F0000B4741F83571A816437FFFFDB725C38FFFFDC
            79582AFFFFDB736247FFFFF84C4D44FFFFF0765D3397641B0000B873129E6E2C
            FFFFDCFFFFE9FFFFEDFFFDE0FFFFEAFFFFF0F8F6EBF8FFFFFBFFFEFFF9E3FFFF
            D9AD711D0000D37F0F9F5C00996822FFFFDBFFFFE8FFFFF2F5F9F4F1F9F9F7FF
            FFFFFFFBFFFAE2FFFFD8935D10CC7F180000D68006D68310C37B16B78134FFFF
            D6FFFFF1EDF3F2F4FFFFF5F9F4FFFFE7FFFFD1AA701EC97E17BA65000000D985
            0EDC7900FB9810C67200AB701AFFFFD6FFFFF4FFFFF8FFFFEAFFFFC3C6821FE2
            8910E28605EC951F0000BE7610F3940FE37B00E88701DC9125A47B3CFFFFDAFF
            FFE4FFFFD8B27317D7840BEF900BD17500C87D1100007F7F7FD78D23E38B0FD8
            7C00D07D09C78B32AA7C35FFFFC0B18032D38D28D88815D4810DCB81177F7F7F
            0000}
          Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
          Style = ebsGlyphEh
          Width = 24
          OnClick = edNameEditButtons2Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
      OnClick = lbSMDOCodeClick
      OnDblClick = lbSMDOCodeClick
    end
    object lbKomu1: TStaticText
      Left = 9
      Top = 37
      Width = 29
      Height = 17
      Caption = #1050#1086#1084#1091
      TabOrder = 2
    end
    object lbKomu: TStaticText
      Left = 82
      Top = 33
      Width = 19
      Height = 20
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText3: TStaticText
      Left = 897
      Top = 13
      Width = 28
      Height = 17
      Caption = #1058#1077#1084#1072
      TabOrder = 4
      Visible = False
    end
    object edSUBJECT: TDBEditEh
      Left = 924
      Top = 10
      Width = 37
      Height = 24
      DataField = 'SUBJECT'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object edMsgType: TDBComboBoxEh
      Left = 82
      Top = 86
      Width = 233
      Height = 24
      DataField = 'MSG_TYPE'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = True
      OnChange = edMsgTypeChange
    end
    object StaticText4: TStaticText
      Left = 9
      Top = 92
      Width = 22
      Height = 17
      Caption = #1058#1080#1087
      TabOrder = 8
    end
    object StaticText5: TStaticText
      Left = 331
      Top = 90
      Width = 103
      Height = 17
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
      TabOrder = 9
    end
    object edMsgAcknow: TDBComboBoxEh
      Left = 447
      Top = 86
      Width = 263
      Height = 24
      DataField = 'MSG_ACKNOW'
      DataSource = dsDokument
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
    object gbAdrReg: TGroupBox
      Left = 9
      Top = 142
      Width = 472
      Height = 75
      Caption = ' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1086#1073#1086#1088#1086#1090#1077' '#1072#1076#1088#1077#1089#1072#1090#1072' '
      TabOrder = 20
      object Label4: TLabel
        Left = 32
        Top = 48
        Width = 3
        Height = 13
      end
      object StaticText6: TStaticText
        Left = 18
        Top = 21
        Width = 17
        Height = 17
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edAdrRegNumber: TDBEditEh
        Left = 44
        Top = 17
        Width = 240
        Height = 24
        Color = clInfoBk
        DataField = 'ADR_REGNUMBER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object StaticText8: TStaticText
        Left = 304
        Top = 21
        Width = 16
        Height = 17
        Caption = #1086#1090
        TabOrder = 2
      end
      object edAdrRegDate: TDBDateTimeEditEh
        Left = 335
        Top = 17
        Width = 121
        Height = 24
        Color = clInfoBk
        DataField = 'ADR_REGDATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
    end
    object gbMyReg: TGroupBox
      Left = 485
      Top = 142
      Width = 481
      Height = 75
      Caption = ' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103'  '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 21
      object Label5: TLabel
        Left = 16
        Top = 40
        Width = 3
        Height = 13
      end
      object StaticText7: TStaticText
        Left = 22
        Top = 22
        Width = 17
        Height = 17
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edMyRegNumber: TDBEditEh
        Left = 52
        Top = 18
        Width = 240
        Height = 24
        Color = clInfoBk
        DataField = 'MY_REGNUMBER'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object StaticText9: TStaticText
        Left = 308
        Top = 22
        Width = 16
        Height = 17
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edMyRegDate: TDBDateTimeEditEh
        Left = 337
        Top = 18
        Width = 121
        Height = 24
        Color = clInfoBk
        DataField = 'MY_REGDATE'
        DataSource = dsDokument
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
      object edAddAck: TDBEditEh
        Left = 52
        Top = 46
        Width = 405
        Height = 24
        Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1080#1083#1080' '#1086#1090#1082#1072#1079#1077
        DataField = 'ADD_ACK'
        DataSource = dsDokument
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
      object lbAddAck: TStaticText
        Left = 5
        Top = 43
        Width = 39
        Height = 27
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1087'.'#13#10#1090#1077#1082#1089#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object btTestAck: TButton
        Left = 460
        Top = 51
        Width = 15
        Height = 18
        Caption = '+'
        TabOrder = 6
        OnClick = btTestAckClick
      end
      object btAdsSys: TButton
        Left = 460
        Top = 18
        Width = 15
        Height = 25
        Caption = '!!!'
        TabOrder = 7
        OnClick = btAdsSysClick
      end
    end
    object btKomu: TButton
      Left = 733
      Top = 32
      Width = 20
      Height = 20
      Hint = #1050#1086#1084#1091
      Caption = '...'
      TabOrder = 11
      OnClick = btKomuClick
    end
    object edTitle: TDBEditEh
      Left = 82
      Top = 58
      Width = 625
      Height = 24
      HelpContext = 888
      DataField = 'TEXT'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = True
      OnDblClick = edTitleDblClick
    end
    object StaticText10: TStaticText
      Left = 724
      Top = 53
      Width = 219
      Height = 17
      BevelOuter = bvNone
      Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object grReferredR: TDBGridEh
      Left = 723
      Top = 69
      Width = 245
      Height = 39
      Hint = #1057#1089#1099#1083#1082#1080' '#1085#1072' '#1088#1072#1085#1077#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      AutoFitColWidths = True
      Color = clBtnFace
      Ctl3D = True
      DataSource = dsReferredR
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
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 22
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnDblClick = grReferredRDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'REGNUMBER'
          Footers = <>
          OnGetCellParams = grReferredRColumns0GetCellParams
        end>
    end
    object Button1: TButton
      Left = 768
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 13
      Visible = False
      OnClick = Button1Click
    end
    object lbOtvet1: TStaticText
      Left = 9
      Top = 121
      Width = 58
      Height = 17
      Caption = #1042' '#1086#1090#1074#1077#1090' '#1085#1072
      TabOrder = 14
    end
    object edOtvet_DeliveryType: TDBComboBoxEh
      Left = 82
      Top = 115
      Width = 185
      Height = 24
      DataField = 'PAR_DELIVERY_TYPE'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Visible = True
      OnChange = edOtvet_DeliveryTypeChange
    end
    object lbOtvet2: TStaticText
      Left = 282
      Top = 121
      Width = 41
      Height = 17
      Caption = #1080#1089#1093'. '#8470
      TabOrder = 16
    end
    object edOtvet_Regnumber: TDBEditEh
      Left = 333
      Top = 115
      Width = 154
      Height = 24
      Color = clInfoBk
      DataField = 'PAR_REGNUMBER'
      DataSource = dsDokument
      EditButtons = <
        item
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
          Style = ebsEllipsisEh
          Width = 20
          OnClick = edOtvet_RegnumberEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      Visible = True
    end
    object lbOtvet3: TStaticText
      Left = 506
      Top = 121
      Width = 16
      Height = 17
      Caption = #1086#1090
      TabOrder = 18
    end
    object edOtvet_Regdate: TDBDateTimeEditEh
      Left = 536
      Top = 115
      Width = 121
      Height = 24
      Color = clInfoBk
      DataField = 'PAR_REGDATE'
      DataSource = dsDokument
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
      Visible = True
    end
  end
  inherited dsDokument: TDataSource
    Left = 696
    Top = 18
  end
  inherited Dokument: TkbmMemTable
    Left = 640
    Top = 18
    object DokumentDOC_ID: TIntegerField [1]
      DefaultExpression = '0'
      FieldName = 'DOC_ID'
    end
    object DokumentDTSTAMP: TDateTimeField
      FieldName = 'DTSTAMP'
    end
    object DokumentDATEPOST: TDateTimeField
      FieldName = 'DATEPOST'
    end
    object DokumentSUBJ_TYPE: TSmallintField
      FieldName = 'SUBJ_TYPE'
    end
    object DokumentMSG_TYPE: TSmallintField
      FieldName = 'MSG_TYPE'
    end
    object DokumentDOC_TYPE: TSmallintField
      FieldName = 'DOC_TYPE'
    end
    object DokumentSENT: TSmallintField
      FieldName = 'SENT'
    end
    object DokumentSUBJ_FROM: TStringField
      FieldName = 'SUBJ_FROM'
      Size = 100
    end
    object DokumentSUBJECT: TStringField
      FieldName = 'SUBJECT'
      Size = 300
    end
    object DokumentMSG_ID: TStringField
      FieldName = 'MSG_ID'
      Size = 40
    end
    object DokumentNAME: TStringField
      DisplayWidth = 300
      FieldName = 'NAME'
      Size = 1000
    end
    object DokumentSMDOCODE: TStringField
      FieldName = 'SMDOCODE'
      OnChange = DokumentSMDOCODEChange
      Size = 8
    end
    object DokumentMSG_ACKNOW: TSmallintField
      FieldName = 'MSG_ACKNOW'
    end
    object DokumentACK_MSG_ID: TStringField
      FieldName = 'ACK_MSG_ID'
      Size = 40
    end
    object DokumentACK_TYPE: TSmallintField
      FieldName = 'ACK_TYPE'
    end
    object DokumentADR_REGNUMBER: TStringField
      FieldName = 'ADR_REGNUMBER'
      Size = 40
    end
    object DokumentADR_REGDATE: TDateField
      FieldName = 'ADR_REGDATE'
    end
    object DokumentMY_REGNUMBER: TStringField
      FieldName = 'MY_REGNUMBER'
      Size = 40
    end
    object DokumentMY_REGDATE: TDateField
      FieldName = 'MY_REGDATE'
    end
    object DokumentKOMM: TStringField
      FieldName = 'KOMM'
      Size = 200
    end
    object DokumentTEXT: TMemoField
      FieldName = 'TEXT'
      BlobType = ftMemo
    end
    object DokumentIDNUMBER: TStringField
      FieldName = 'IDNUMBER'
      Size = 40
    end
    object DokumentKIND: TStringField
      FieldName = 'KIND'
      Size = 50
    end
    object DokumentNUMCOPY: TSmallintField
      FieldName = 'NUMCOPY'
    end
    object DokumentPAGES: TSmallintField
      FieldName = 'PAGES'
    end
    object DokumentCONFIDENT: TStringField
      FieldName = 'CONFIDENT'
      Size = 100
    end
    object DokumentFLAG: TSmallintField
      FieldName = 'FLAG'
    end
    object DokumentPAR_IDNUMBER: TStringField
      FieldName = 'PAR_IDNUMBER'
      Size = 40
    end
    object DokumentPAR_PARMSG: TStringField
      FieldName = 'PAR_PARMSG'
      Size = 40
    end
    object DokumentPAR_LASTMSG: TStringField
      FieldName = 'PAR_LASTMSG'
      Size = 40
    end
    object DokumentPAR_REGNUMBER: TStringField
      FieldName = 'PAR_REGNUMBER'
      Size = 40
    end
    object DokumentPAR_REGDATE: TDateField
      FieldName = 'PAR_REGDATE'
    end
    object DokumentPAR_DELIVERY_TYPE: TSmallintField
      FieldName = 'PAR_DELIVERY_TYPE'
    end
    object DokumentPAR_PARORG: TStringField
      FieldName = 'PAR_PARORG'
      Size = 8
    end
    object DokumentSUBJ_ERROR: TBooleanField
      FieldName = 'SUBJ_ERROR'
    end
    object DokumentERROR_TEXT: TMemoField
      FieldName = 'ERROR_TEXT'
      BlobType = ftMemo
    end
    object DokumentSUBJ_SYSTEM: TSmallintField
      FieldName = 'SUBJ_SYSTEM'
    end
    object DokumentISWRITE_REF: TBooleanField
      FieldName = 'ISWRITE_REF'
    end
    object DokumentADD_ACK: TMemoField
      FieldName = 'ADD_ACK'
      BlobType = ftMemo
    end
    object DokumentADD_TEXT: TStringField
      FieldName = 'ADD_TEXT'
      Size = 300
    end
  end
  inherited frDBDokument: TfrDBDataSet
    Left = 800
    Top = 58
  end
  inherited HistZAGS: TkbmMemTable
    Left = 936
    Top = 26
  end
  inherited dsSeria: TDataSource
    Left = 752
    Top = 26
  end
  inherited dsObl: TDataSource
    Left = 400
    Top = 58
  end
  inherited SvidPovtor: TkbmMemTable
    Left = 904
    Top = 34
  end
  inherited dsPovtor: TDataSource
    Left = 312
    Top = 66
  end
  inherited dsRN: TDataSource
    Left = 832
    Top = 82
  end
  inherited dsGorod: TDataSource
    Left = 272
    Top = 74
  end
  inherited dsRnGor: TDataSource
    Left = 448
    Top = 58
  end
  inherited dsTypeGorod: TDataSource
    Left = 584
    Top = 58
  end
  inherited ImGISUN: TImageList
    Left = 836
    Top = 27
  end
  inherited dsVoenkom: TDataSource
    Left = 624
    Top = 58
  end
  inherited dsRovd: TDataSource
    Left = 664
    Top = 58
  end
  inherited frDBPovtSvid: TfrDBDataSet
    Left = 864
    Top = 74
  end
  inherited kbmCSVStreamFormat1: TkbmCSVStreamFormat
    Left = 872
    Top = 34
  end
  object tbTask: TkbmMemTable [24]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 2
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'TASK_ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftSmallint
      end
      item
        Name = 'ADD_TYPE'
        DataType = ftSmallint
      end
      item
        Name = 'IDNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'KIND'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEXT'
        DataType = ftMemo
      end
      item
        Name = 'TASKDATE'
        DataType = ftDate
      end
      item
        Name = 'TASKNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TASK_REG'
        DataType = ftSmallint
      end
      item
        Name = 'TASK_COPY'
        DataType = ftSmallint
      end
      item
        Name = 'CONFIDENT'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMCOPY'
        DataType = ftSmallint
      end
      item
        Name = 'FLAG'
        DataType = ftSmallint
      end
      item
        Name = 'DEADLINE'
        DataType = ftDate
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterScroll = tbTaskAfterScroll
    Left = 544
    Top = 18
    object tbTaskPOST_ID: TIntegerField
      FieldName = 'POST_ID'
    end
    object tbTaskTASK_ID: TIntegerField
      FieldName = 'TASK_ID'
    end
    object tbTaskTASK_ID_SOURCE: TIntegerField
      FieldName = 'TASK_ID_SOURCE'
    end
    object tbTaskNOMER: TSmallintField
      FieldName = 'NOMER'
    end
    object tbTaskADD_TYPE: TSmallintField
      FieldName = 'ADD_TYPE'
    end
    object tbTaskIDNUMBER: TStringField
      FieldName = 'IDNUMBER'
      Size = 40
    end
    object tbTaskKIND: TStringField
      FieldName = 'KIND'
      Size = 50
    end
    object tbTaskTEXT: TMemoField
      FieldName = 'TEXT'
      BlobType = ftMemo
    end
    object tbTaskTASKDATE: TDateField
      FieldName = 'TASKDATE'
    end
    object tbTaskTASKNUMBER: TStringField
      FieldName = 'TASKNUMBER'
      Size = 40
    end
    object tbTaskCONFIDENT: TStringField
      FieldName = 'CONFIDENT'
      Size = 100
    end
    object tbTaskNUMCOPY: TSmallintField
      FieldName = 'NUMCOPY'
    end
    object tbTaskFLAG: TSmallintField
      FieldName = 'FLAG'
    end
    object tbTaskDEADLINE: TDateField
      FieldName = 'DEADLINE'
    end
    object tbTaskTASK_REG: TBooleanField
      FieldName = 'TASK_REG'
    end
    object tbTaskTASK_COPY: TBooleanField
      FieldName = 'TASK_COPY'
    end
    object tbTaskCONTENTS: TMemoField
      FieldName = 'CONTENTS'
      BlobType = ftMemo
    end
    object tbTaskPAGES: TIntegerField
      FieldName = 'PAGES'
    end
  end
  object tbFiles: TkbmMemTable [25]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 496
    Top = 18
    object tbFilesPOST_ID: TIntegerField
      FieldName = 'POST_ID'
    end
    object tbFilesPARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
    end
    object tbFilesFILE_ID: TIntegerField
      FieldName = 'FILE_ID'
    end
    object tbFilesSTORE_KIND: TSmallintField
      FieldName = 'STORE_KIND'
    end
    object tbFilesNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object tbFilesPATH: TStringField
      FieldName = 'PATH'
      Size = 500
    end
    object tbFilesVALUE: TMemoField
      FieldName = 'VALUE'
      BlobType = ftMemo
    end
    object tbFilesKOMM: TStringField
      FieldName = 'KOMM'
      Size = 100
    end
    object tbFilesSIGNATURE: TMemoField
      FieldName = 'SIGNATURE'
      BlobType = ftMemo
    end
    object tbFilesSIGNINFO: TMemoField
      FieldName = 'SIGNINFO'
      BlobType = ftMemo
    end
    object tbFilesDATEC: TDateTimeField
      FieldName = 'DATEC'
    end
    object tbFilesDATEM: TDateTimeField
      FieldName = 'DATEM'
    end
    object tbFilesFILE_TYPE: TStringField
      FieldName = 'FILE_TYPE'
      Size = 10
    end
    object tbFilesMD5: TStringField
      FieldName = 'MD5'
      Size = 32
    end
  end
  object tbMens: TkbmMemTable [26]
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 3
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
      end
      item
        Name = 'ORG'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'OFFICIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RANK'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'TEL_WORK'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEL_MOB'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SIGNDATE'
        DataType = ftDate
      end
      item
        Name = 'SROK'
        DataType = ftDate
      end
      item
        Name = 'ATTESTATION'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 448
    Top = 18
    object tbMensPOST_ID: TIntegerField
      FieldName = 'POST_ID'
    end
    object tbMensPARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
    end
    object tbMensNOMER: TIntegerField
      FieldName = 'NOMER'
    end
    object tbMensTIP: TSmallintField
      FieldName = 'TIP'
    end
    object tbMensORG: TStringField
      FieldName = 'ORG'
      Size = 300
    end
    object tbMensFIO: TStringField
      FieldName = 'FIO'
      Size = 70
    end
    object tbMensOFFICIAL: TStringField
      FieldName = 'OFFICIAL'
      Size = 100
    end
    object tbMensRANK: TStringField
      FieldName = 'RANK'
      Size = 200
    end
    object tbMensADRES: TStringField
      FieldName = 'ADRES'
      Size = 150
    end
    object tbMensTEL_WORK: TStringField
      FieldName = 'TEL_WORK'
      Size = 50
    end
    object tbMensTEL_MOB: TStringField
      FieldName = 'TEL_MOB'
      Size = 50
    end
    object tbMensEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tbMensSIGNDATE: TDateField
      FieldName = 'SIGNDATE'
    end
    object tbMensSROK: TDateField
      FieldName = 'SROK'
    end
    object tbMensATTESTATION: TStringField
      FieldName = 'ATTESTATION'
      Size = 1
    end
  end
  object dsFiles: TDataSource [27]
    DataSet = tbFiles
    OnDataChange = dsFilesDataChange
    Left = 156
    Top = 431
  end
  object ImageList1: TImageList [28]
    Left = 244
    Top = 511
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFE3AF51FFE3AD
      5CFFDFAB62FFDCA764FFD79D59FFD3974CFFCF9046FFCB8A41FFC4833BFFC27A
      34FFBC722DFFB6661CFFBB7E4FFF000000FFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE6B357FFFAE8B3FFFDED
      C3FFFFFBEFFFFFFFFFFFFFF4DEFFF8E5ACFFF9E08DFFF9DB83FFF2CC69FFEBBC
      4EFFE4AB34FFE6A01CFFC57713FFB16B37FF2F76B6FF2E73B4FF2F73B3FF3073
      B4FF3077B6FFCCCCCCFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE7B45CFFF8E3ADFFF6DB
      A4FFF8E8CDFFFAEFE3FFF5DFBEFFEFD194FFEFCC79FFEEC772FFE7B95CFFE1AB
      46FFDB9D31FFDB931CFFC47813FFB47341FF2F75B5FF4FC8FCFF4DC3F8FF4DC4
      F8FF3887C5FF3378B6FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE6B65EFFFBE9BBFFF9E0
      ABFFFBEED9FFFCF5F0FFF8E5C8FFF2D69AFFF3D17FFFF1CC76FFEBBE5EFFE5AF
      45FFDC9E2FFFDE9519FFC57914FFB47341FF4382BCFF3B92CEFF4DC1F6FF4CBF
      F4FF4DC3F8FF3176B5FFCCCCCCFFCCCCCCFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE6B155FFF4DBA7FFF5DE
      B1FFF5E5C8FFF7E9D8FFF2DDBAFFEED29DFFEDCC8AFFECCA81FFE6BF71FFE3B6
      60FFDCAA4DFFDEA739FFBD731DFFB26C39FF000000FF4885BDFF3E92CCFF53C6
      F8FF53C5F8FF2F72B0FF3377B5FF357BB9FFCCCCCCFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFE5B557FFE6B9
      64FFE2B66BFFE0B776FFDAAA5DFFD69E4BFFD39844FFCE903FFFCA8738FFC37C
      32FFBD712BFFBA6E23FFB6774BFF000000FF000000FF000000FF4986BEFF4294
      CDFF5ECCFCFF5CCBFAFF5ECDFDFF3174B3FF357AB7FFCCCCCCFFCCCCCCFFCECE
      CEFFE5E5E5FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFECC77EFFFAE7B5FFF7E0
      ACFFFBEED9FFFDF6F1FFF8E4C7FFF1D69CFFF3D17FFFF1CD75FFEBBE5FFFE3AD
      46FFDD9D2EFFDC9417FFC87D12FFC08248FF000000FF000000FF000000FF4A87
      BDFF4597CFFF67D2FCFF65CFFAFF67D2FCFF57B2E2FF3578B4FF377AB6FF3D7E
      B7FF80A3C1FFD1D1D1FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFECC576FFF8E1A8FFF7DE
      AAFFF9EAD2FFFBF1E9FFF6E1C2FFEFD398FFF0CE7DFFEFCA76FFE8BB5FFFE2AF
      48FFDCA032FFD9921CFFC67A14FFBE7B3FFF000000FF000000FF000000FF0000
      00FF4C88BEFF4999CFFF72D5FDFF5FC6F8FF48B2F4FF4EB7F7FF4FB9F9FF44AB
      F0FF3D8CCBFF4886BAFFE5E5E5FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFECC577FFF8E2ABFFF7DD
      A2FFF9EAD0FFFBF1E7FFF6E1BFFFEFD293FFF0CC75FFEFC86FFFE8B958FFE0AA
      40FFDA9A2AFFD88E14FFC6770EFFBE7B3DFF000000FF000000FF000000FF0000
      00FF000000FF3376B4FF6DD1FEFF58BDF6FF75D5FBFF79D8FCFF7AD9FCFF77D8
      FEFF5DC5FCFF3F8FCCFF82A5C3FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFEDC97FFFFAEBCBFFF8E5
      BEFFFAEDDCFFFBF5EFFFF9E8CFFFF5DCACFFF3D799FFF2D58FFFECCA7CFFE8BE
      67FFE1B150FFE1AC3AFFCD8D26FFC2864BFF000000FF000000FF000000FF0000
      00FF000000FF3578B5FF62CAFEFF81DCFEFF7FDBFDFF80DCFFFF81DEFFFF82DF
      FFFF85E1FFFF5ABFF6FF3C80B9FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFE7BB65FFE9BF
      7AFFE6C285FFE4C28FFFDEB371FFD9A65BFFD69F54FFD29B4DFFCD9045FFC889
      3EFFC37D35FFC07D2DFFC08654FF000000FF000000FF000000FF000000FF0000
      00FF000000FF3B7FBAFF6FD5FFFF7CDAFDFF7CDAFDFF70CAF1FF4C97CBFF4C98
      CCFF73CEF4FF71D9FFFF3C7EB8FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFE9BE6BFFF7E1A4FFF7DE
      A4FFF8E9CFFFFAF1E7FFF6E1BDFFF1D393FFF1CE78FFF0C96FFFE9BA5AFFE3AB
      43FFDD9A2DFFDA9017FFC27311FFB77439FF000000FF000000FF000000FF0000
      00FF000000FF3A80BCFF74DBFFFF77D8FCFF78DAFEFF4A96CBFFE8F0F6FFE8F0
      F6FF4D99CEFF77E0FFFF3D7FBAFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFEDC879FFF8E3ADFFF7E0
      ACFFFBEBD5FFFCF3EBFFF9E3C5FFF0D59AFFF0D07FFFF0CB78FFEABD60FFE4AF
      49FFDEA033FFDB951CFFC87D14FFC07F40FF000000FF000000FF000000FF0000
      00FF000000FF387BB8FF6FD3F8FF73D9FCFF73DAFDFF4A97CCFFCCCCCCFFCCCC
      CCFF4D9BCFFF73D7FBFF3F82BBFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFECC677FFF8DFA6FFF7DC
      A1FFF8E7CCFFFAEFE2FFF7DFBCFFEFD18FFFEDCB74FFEDC66DFFE6B756FFE0A8
      3FFFDA9829FFD78C14FFC5760EFFBE7C3FFF000000FF000000FF000000FF0000
      00FF000000FF9BBDDBFF4B99CEFF71DBFFFF6FD8FDFF66C8F0FF4B99CDFF4D9A
      CFFF69CEF5FF4F9ED1FF9DC0DCFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFEBC474FFFCF1CFFFFCEB
      C6FFFFF8EEFFFFFFFFFFFEF1DFFFF7E5B7FFF7E09CFFF6DC94FFF1D07DFFEBC4
      64FFE6B34CFFE6AC34FFCF8B21FFBD7838FF000000FF000000FF000000FF0000
      00FF000000FF000000FF4F8BC0FF4A99CEFF67CEF6FF6EDBFFFF6FDDFFFF69D3
      F9FF4E9ED1FF518EC2FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFEAC275FFE9C5
      84FFE7C286FFE5C28AFFE2B87DFFDFB373FFDBAD6BFFD7A868FFD4A161FFD19B
      5BFFCC9451FFC89040FFC6915DFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF9CBFDCFF3E80BAFF3F80BAFF3F81BAFF3F82
      BBFF9DC0DDFF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFCFCFCFFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCFCFCFFF000000FF000000FF00000000AEFDFF00AEFDFF00AEFD
      FF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFD
      FF00AEFDFF00AEFDFF00FFFFFF00663333000000000000000000000000008959
      5800895958008959580089595800895958008959580089595800895958008959
      580089595800895958008959580000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007F7F007F0000007F0000007F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F000000000000FF3EA481FF34A17BFF34A0
      7BFF34A07BFF34A17BFF34A17BFF34A17BFF34A17BFF34A17BFF34A07BFF34A0
      7BFF34A17BFF3EA481FF000000FF000000FF6600000066000000660000006600
      0000660000006600000066000000660000006600000066000000660000006600
      000066000000AEFDFF00FFFFFF006633330000000000F8D1B600DCA98700DCA9
      8700F8D1B600D6BEA500DCA98700D6BEA500F8D1B600F8D1B600FFE5CC00F8D1
      B600FFE5CC00F8D1B6008959580000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF00007F0000BFBFBF005F9000005F9000005F9000005F9000005F9000005F90
      00005F9000005F9000005F9000007F000000000000FF32A07BFF59D1A2FF4DC1
      95FF4EC296FF4FC396FF4FC296FF4EC296FF4EC296FF4EC296FF4EC295FF4DC1
      95FF59D1A2FF32A07BFF000000FF000000FF66000000FFFFFF0066000000FFFF
      FF0066000000FFFFFF0066000000FFFFFF0066000000FFFFFF00FFFFFF00FFFF
      FF0066000000AEFDFF00FFFFFF0066333300F3CF7300DCA9870000000000BC96
      59009A601E009A601E00895958009A601E0089595800DCA98700F8D1B600FFE5
      CC00F8D1B600F8D1B6008959580000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF00007F000000FFFF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF00007F000000000000FF26A07BFF50D0A0FF34A7
      7EFF38AA81FF2C9376FF39AB82FF38AA81FF38A981FF38A981FF37A880FF34A7
      7EFF50D0A0FF26A07BFF000000FF000000FF66000000FFFFFF0066000000FFFF
      FF0066000000FFFFFF0066000000FFFFFF0066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF0066333300BC965900DCA98700D6BEA5009A60
      1E00F1B13F00DC933000F1B13F00F3CF7300F3CF730089595800DCA98700F8D1
      B600FFE5CC00F8D1B6008959580000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F000000007F7F007F0000007F0000007F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F000000000000FFD49358FFCAE6E2FF55A3
      88FF5EA88CFF3B7F75FF57A086FF5DA78CFF5DA68CFF5DA68CFF5CA68BFF55A2
      87FFCBE6E1FFD49358FF000000FF000000FF6600000066000000FFFFFF006600
      000066000000FFFFFF0066000000FFFFFF0066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF0066333300BC965900DC9330009C715600DC93
      3000DC9330009A601E00D6BEA500DC933000DC933000DC9330009C715600F8D1
      B600FFE5CC00F8D1B60089595800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFC89359FFC2E3E5FF4498
      90FF4F9F95FF31797CFF367F79FF4D9D95FF4F9D94FF519E94FF509D93FF4699
      8FFFBDE1E3FFC99358FF000000FF000000FF66000000FFFFFF0066000000FFFF
      FF0066000000FFFFFF00FFFFFF00FFFFFF0066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF0066333300D6BEA500F3CF7300F1B13F00DC93
      30009A601E00D6BEA500FFE5CC00FFE5CC00FFE5CC00FFE5CC00FFE5CC00D6BE
      A500FFE5CC00F8D1B6008959580000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007F7F007F0000007F0000007F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F000000000000FFC3935AFFEAE7C6FF3F90
      9CFF3A8F9DFF1E6E86FF87AB9FFF72A8A6FF3D8F9CFF44939DFF44939CFF388D
      9AFFC7E6EAFFC59358FF000000FF000000FF66000000FFFFFF0066000000FFFF
      FF0066000000FFFFFF0066000000FFFFFF0066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF0066333300FFFFFF00DCA98700F1B13F00DC93
      30009A601E009A601E009A601E009A601E009A601E009A601E0089595800F8D1
      B600FFE5CC00F8D1B6008959580000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF007F7F0000BFBFBF00B03F0000DF400000B03F0000DF400000B03F0000DF40
      0000B03F0000DF400000B03F00007F000000000000FFC09159FFFFF9D2FFE5D9
      B5FF7AA7AAFFF8E3B9FFFFEEBCFFFFF0BBFF83ABACFF3085A5FF3186A5FF5496
      A7FFFFF3CEFFC29259FF000000FF000000FF6600000066000000660000006600
      0000660000006600000066000000660000006600000066000000660000006600
      000066000000AEFDFF00FFFFFF0066333300BC965900FFFFFF00DCA98700F1B1
      3F00DC933000F1B13F00F1B13F00DC933000DC933000F1B13F009C715600F8D1
      B600FFE5CC00F8D1B6008959580000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF007F7F000000FFFF00DF8F0000DF8F0000DF8F0000DF8F0000DF8F0000DF8F
      0000DF8F0000DF8F0000DF8F00007F000000000000FFBE9159FFFFF6D4FFFFE4
      AFFFFFE5B0FFFFE4B0FFFFE3B0FFFFE4B0FFFFE9B0FF76A2AEFF4689ADFFFFE3
      AFFFFFF8D4FFBF9159FF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006633330000000000BC965900FFFFFF00DCA9
      87009A601E00D6BEA500FFFFFF00DC933000F1B13F00DC933000BC965900FFE5
      CC00FAF5EF00F8D1B600AA7D750000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F0000007F7F00007F0000007F0000007F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F000000000000FFBE9159FFFFF6D7FFFFDD
      A5FFFFDDA7FFFFDDA7FFFFDDA7FFFFDDA6FFFFDFA5FFFFE1A4FFFFE2A4FFFFDF
      A3FFFFF7D7FFBE9159FF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00FFFFFF00652E3200652E3200652E3200652E3200652E3200652E
      3200652E3200FFFFFF00FFFFFF006633330000000000D6BEA500BC965900FFE5
      CC00F1B13F00DC933000DC933000DC933000F1B13F009C715600FFFFFF00FAF5
      EF00FAF5EF00F8D1B600AA7D7500000000007F0000007F0000007F0000007F00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFBE9159FFFFF8DBFFFFD9
      9CFFFFDA9EFFFFDA9FFFFFDA9FFFFFD99DFFFFE3B1FFFFF5D6FFFFF6D6FFFFF5
      D6FFFFF8DAFFBE9159FF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AEFDFF00AEFDFF00AEFDFF00663333000000000000000000D6BEA500BC96
      5900FFE5CC00F3CF7300F1B13F00F1B13F00BC965900FFFFFF00F3CF7300FFE5
      CC00FAF5EF00F8D1B600AA7D750000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007F7F003F3F3F003F3F3F003F3F3F003F3F3F003F3F3F003F3F
      3F003F3F3F003F3F3F003F3F3F0000007F00000000FFBE9159FFFFF9DEFFFFD5
      93FFFFD696FFFFD697FFFFD696FFFFD593FFFFF6DAFFD5B282FFB9874BFFB786
      49FFFFFDDFFFBF925AFF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00652E3200652E3200652E3200652E3200652E3200652E3200FFFF
      FF0066333300663333006633330066333300000000000000000000000000DCA9
      8700BC965900BC965900BC965900BC965900BC965900FFFFFF00F1B13F009C71
      5600AA7D75009C715600AA7D750000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF007F007F00BFBFBF0090009000900090009000900090009000900090009000
      900090009000900090009000900000007F00000000FFBE9159FFFFFAE0FFFFD0
      8AFFFFD18EFFFFD18FFFFFD18EFFFFD08AFFFFF7DDFFB9874BFFE9F0FAFFFFFF
      FFFFEED4ACFFD5B691FF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0066333300FFFFFF006633330000000000000000000000000000000000DCA9
      8700FFFFFF00FFFFFF00FAF5EF00F8D1B600DCA98700DCA98700F8D1B600AA7D
      7500F8D1B600BC965900D6BEA50000000000BFBFBF00FFFFFF00FFFFFF00FFFF
      FF007F007F0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000007F00000000FFBE9159FFFFFCE3FFFFCB
      7DFFFFCB80FFFFCB81FFFFCB80FFFFCA7DFFFFF8DFFFB78548FFFFFFFFFFEDD3
      AAFFD5B691FF000000FF000000FF000000FF0000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0066333300663333000000000000000000000000000000000000000000DCA9
      8700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AA7D
      7500BC965900D6BEA5000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F007F007F7F7F006F006F006F006F006F006F006F006F006F006F006F00
      6F006F006F006F006F006F006F0000007F00000000FFBF935BFFFFFFE9FFFFFD
      E6FFFFFDE6FFFFFDE7FFFFFDE6FFFFFCE5FFFFFDE4FFFFFFE6FFEED5AFFFD5B7
      92FF000000FF000000FF000000FF000000FF0000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      330066333300000000000000000000000000000000000000000000000000DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700AA7D
      7500FFE5CC0000000000000000000000000000007F0000007F0000007F000000
      7F0000007F0000007F0000007F0000007F0000007F0000007F0000007F000000
      7F0000007F0000007F0000007F0000000000000000FFC59C69FFBF935BFFBE91
      59FFBE9058FFBE9058FFBE9058FFBE9058FFBE9058FFBF9159FFC69C69FF0000
      00FF000000FF000000FF000000FF000000FF000000FFC4B7A0FF705423FF745B
      2EFF735A2DFF72592DFF71582DFF70582DFF70582DFF71582DFF72592DFF735A
      2DFF745A2EFF705423FFC4B7A0FF000000FF0000000086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600868686008686860086868600000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333000000000000000000000000005959
      5900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFB4A382FFA69D8DFFC9C9
      C9FFCFCFCFFFD3D3D3FFD4D4D4FFD3D3D3FFD3D3D3FFD4D4D4FFD3D3D3FFCFCF
      CFFFC9C9C9FFA69D8DFFB4A382FF000000FF0000000091919100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800FBFBFB00919191000000000000000000AEFDFF00AEFDFF00AEFD
      FF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFDFF00AEFD
      FF00AEFDFF00AEFDFF00FFFFFF00663333000000000000000000000000005959
      5900C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7
      C700C7C7C700C7C7C700C7C7C70000000000000000FFB5A382FFABA393FFDADA
      DAFFE2E2E2FFE7E7E7FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE7E7E7FFE2E2
      E2FFDADADAFFAAA292FFB5A382FF000000FF0000000091919100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700F8F8F80091919100000000006600000066000000660000006600
      0000660000006600000066000000660000006600000066000000660000006600
      000066000000AEFDFF00FFFFFF00663333000000000000000000000000005959
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C7C7C70000000000000000FFB9A581FFAFA696FFDDD9
      D6FFB79A78FFBAA37AFFB9A37AFFBBA47BFFBDA67BFFE4E1DCFFEAEAEAFFE9E9
      E9FFE4E4E4FFADA495FFB9A581FF000000FF0000000091919100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00919191000000000066000000FFFFFF0066000000FFFF
      FF006600000066000000FFFFFF006600000066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF00663333000000000000000000000000005959
      5900FFFFFF00C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7C700C7C7
      C700C7C7C700FFFFFF00C7C7C70000000000000000FFBAA581FFB0A797FFE4E0
      DDFFBCA17BFFC2AB7DFFC1AA7DFFBFA97DFFC0A97DFFC2AA7DFFC3AC7DFFCAB5
      8BFFEBEBEBFFACA495FFBAA581FF000000FF00A0220000A0220000A0220000A0
      220000A0220000A0220000A0220000A0220000A0220000A0220000A0220000A0
      220000A0220000A0220000A022000000000066000000FFFFFF0066000000FFFF
      FF006600000066000000FFFFFF006600000066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF00663333000000000000000000000000005959
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C7C7C70000000000000000FFBDA781FFB3AA9AFFEAE6
      E2FFC5A77FFFCDB482FFCCB482FFCAB382FFCBB382FFCDB482FFCFB683FFD4BE
      91FFF1F1F1FFB0A899FFBDA781FF000000FF00A02200FFFFFF00FFFFFF00FFFF
      FF0000A02200FFFFFF00FFFFFF00FFFFFF0000A0220000A0220000A02200FFFF
      FF0000A0220000A0220000A022000000000066000000FFFFFF00FFFFFF006600
      00006600000066000000FFFFFF006600000066000000FFFFFF00FFFFFF006600
      000066000000AEFDFF00FFFFFF00663333004343430043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004343
      43004343430043434300C7C7C70000000000000000FFBEA881FFB5AC9CFFEBE6
      E2FFC7AB81FFD4BA85FFE1D4BAFFCFB98CFFC9B48CFFC8B38CFFCBB68CFFCEC2
      97FFF1F1F1FFB5AC9CFFBEA881FF000000FF00A02200FFFFFF0000A0220000A0
      220000A0220000A0220000A02200FFFFFF0000A0220000A02200FFFFFF0000A0
      2200FFFFFF0000A0220000A022000000000066000000FFFFFF0066000000FFFF
      FF006600000066000000FFFFFF006600000066000000FFFFFF00660000006600
      000066000000AEFDFF00FFFFFF00663333004343430043434300FFFFFF004343
      430043434300FFFFFF0043434300FFFFFF004343430043434300FFFFFF004343
      43004343430043434300C7C7C70000000000000000FFC1AA82FFB5AC9CFFECE7
      E3FFCDB083FFDAC188FFD4BF92FF696527FF66611EFF6C601FFF57612EFF7B8F
      48FFF1F1F1FFBBB19FFFC1AA82FF000000FF00A02200FFFFFF0000A0220000A0
      220000A02200FFFFFF00FFFFFF00FFFFFF0000A0220000A02200FFFFFF0000A0
      2200FFFFFF0000A0220000A022000000000066000000FFFFFF00FFFFFF00FFFF
      FF0066000000FFFFFF00FFFFFF00FFFFFF0066000000FFFFFF00FFFFFF00FFFF
      FF0066000000AEFDFF00FFFFFF00663333004343430043434300FFFFFF004343
      430043434300FFFFFF0043434300FFFFFF004343430043434300FFFFFF004343
      43004343430043434300C7C7C70000000000000000FFC1AA82FFB9B0A0FFF2ED
      E9FFD1B486FFDFC58BFFDAC698FFB7A480FF7B7466FFA18C65FFA4916DFFD2B8
      7AFFF8F8F8FFC3B7A4FFC1AA82FF000000FF00A02200FFFFFF0000A0220000A0
      220000A02200FFFFFF0000A0220000A0220000A02200FFFFFF0000A0220000A0
      220000A02200FFFFFF0000A02200000000006600000066000000660000006600
      0000660000006600000066000000660000006600000066000000660000006600
      000066000000AEFDFF00FFFFFF00663333004343430043434300FFFFFF004343
      43004343430043434300FFFFFF00434343004343430043434300FFFFFF004343
      43004343430043434300C7C7C70000000000000000FFC5AB82FFBEB4A3FFF2ED
      E9FFD1B486FFDFC58BFFE4CD9AFFE4B75BFFD4AA56FFE3B75FFFD9C27AFFB1BB
      7CFFF6F6F6FFC4B7A2FFC6AD84FF000000FF00A02200FFFFFF00FFFFFF00FFFF
      FF0000A02200FFFFFF00FFFFFF00FFFFFF0000A02200FFFFFF0000A0220000A0
      220000A02200FFFFFF0000A02200000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00663333004343430043434300FFFFFF004343
      430043434300FFFFFF0043434300FFFFFF004343430043434300FFFFFF004343
      43004343430043434300C7C7C70000000000000000FFC6AD82FFC2B7A5FFF8F8
      F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF6F6
      F6FFD7D4CEFFA37F41FF000000FF000000FF00A0220000A0220000A0220000A0
      220000A0220000A0220000A0220000A0220000A0220000A0220000A0220000A0
      220000A0220000A0220000A02200000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00652E3200652E3200652E3200652E3200652E3200652E
      3200652E3200FFFFFF00FFFFFF006633330043434300FFFFFF00FFFFFF00FFFF
      FF0043434300FFFFFF0043434300FFFFFF0043434300FFFFFF00FFFFFF00FFFF
      FF004343430043434300C7C7C70000000000000000FFC9AE82FFC7BCA8FFF8F8
      F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF6F6F6FFD9D5
      CFFFA68142FF000000FF000000FF000000FF0000000091919100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0091919100000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AEFDFF00AEFDFF00AEFDFF00663333004343430043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004343
      43004343430043434300C7C7C70000000000000000FFCAAF82FFCDC1ABFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFDCD8D3FFA782
      43FF000000FFB79559FFD1BB94FF000000FF000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000006633
      3300FFFFFF00652E3200652E3200652E3200652E3200652E3200652E3200FFFF
      FF00663333006633330066333300663333000000000000000000000000005959
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000FFCDB182FFD3C6B0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFE2DFD9FFAD8745FF0000
      00FFB79355FF9A6203FFCDB182FF000000FF00000000A6A6A600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6
      A600FFFFFF00B4B4B400E9E9E900000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00663333000000000066333300000000000000000000000000000000005959
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0059595900000000000000000000000000000000FFCEB282FFD6C8B0FFF8F8
      F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFE7E3DDFFB28B47FF000000FFB995
      56FF9C6403FF9C6403FFCEB282FF000000FF00000000A6A6A600F8F8F800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6
      A600B4B4B400E9E9E90000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00663333006633330000000000000000000000000000000000000000005959
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0059595900000000000000000000000000000000FFDAC39CFFAE7F2DFFB287
      3BFFB2873BFFB2873BFFB2873BFFB2873BFFB58A3FFF000000FFDBC5A0FFA067
      03FFA06703FFA06703FFD6BE94FF000000FF00000000D5D5D500A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600E9E9E9000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333000000000000000000000000000000000000000000000000005959
      5900595959005959590059595900595959005959590059595900595959005959
      5900595959000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333399007373
      EC006C6BAD006C6BAD006C6BAD006C6BAD006C6BAD006C6BAD006C6BAD006C6B
      AD006C6BAD003333990000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004F42
      2C0063503B005D432B006C4C3500724D330070472E007C5235006F482800744F
      2D007A5632005B3B17007E5F380061441D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333399009999
      CC007373EC00E7E6E000E7E6E000E7E6E000E7E6E000E7E6E000E7E6E000E7E6
      E000E7E6E0003333990000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000000000000000000000000000B8AF
      9B00F2E3D000DAC5AF00B99C8700E0BEA600DBB59D00CBA48800D2AC8E00D7B1
      9100C3A07F00DCB99700AD8D6A00745430000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333399009999
      CC002C2CE0007373EC00E7E6E000FFFFFF00E7E6E000DCDDDA00DCDDDA00E7E6
      E000DCDDDA003333990000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000000000000000000000000000A2A0
      8E00EBE3D200FFF2DF00F5E1CF00FBE3CD00FFEFDA00FFEAD300FFE0C800F6D3
      B900FFDEC200FFE3C700C9A488007A5638000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000DCDDDA002C2CE0007373EC00E7E6E000FFFFFF00FFFFFF00DCDDDA00DCDD
      DA00DCDDDA003333990000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000FFFFFF00C0C0C000000000000000000000000000000000009EA5
      9600ECEDDD00AFAD9B00BDB6A300BCB19D00A5948100FFEAD600C8AB9600D0AF
      9B00DAB59F00F8D2BA00CFA68F00764C35000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000E7E6E0009999CC002C2CE0007373EC007373EC007373EC007373EC007373
      EC009999CC0033339900000000000000000000000000FF00000000000000FF00
      000000000000FF00000000000000FF00000000000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000000000000000000000000000A4B5
      A700E2F1E300DBE6D600FDFFF400E6E8D500FFFDEB00FFFCEA00BDA99700FFE5
      D400C7A69300FFDFCD00C99B8A00724131000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000E7E6E000FFFFFF007373EC00DCDDDA007373EC002C2CE0009999CC009999
      CC00DCDDDA00333399000000000000000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0
      C000C0C0C000FFFFFF00C0C0C00000000000344E3E00425D4D0038534300506B
      5B0046624F002A443200364C3A003447340035402C0037382400F9EFDD00FFF5
      E500C8A79700FFE4D500FAC9BB00723E31000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000DCDDDA00FFFFFF009999CC002C2CE0009999CC00FFFFFF00E7E6E000E7E6
      E000DCDDDA0033339900000000000000000000000000FFFFFF0000000000FF00
      0000FFFFFF00FF00000000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000054756000E6FFF400E1FFF100DFFF
      F000CFF9E200E3FFF200E4FFF200EAFFF200F1FFF100303D2700E5E4D000FEF0
      DD00FFF8E700F3CABB00D9A89A00794437000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000DCDDDA00E7E6E0009999CC002C2CE000DCDDDA00E7E6E000DCDDDA00DCDD
      DA00DCDDDA00333399000000000000000000FF000000FFFFFF00FF0000000000
      0000C0C0C00000000000FF000000C0C0C000FFFFFF0000000000C0C0C000C0C0
      C000C0C0C000FFFFFF00C0C0C000000000004A735700DEFFED00DCFFED00DDFF
      F000DAFFF00074A88A002D5F41002C583B00517257003A503700AFB89E00ADA5
      8E00C1A99500FFEDDB00E8B7A700703C2C000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000033339900E7E6
      E000DCDDDA00E7E6E0009999CC007373EC00DCDDDA00DCDDDA00DCDDDA00DCDD
      DA00DCDDDA0033339900000000000000000000000000FFFFFF0000000000FF00
      000000000000FF00000000000000FF000000FFFFFF00FF000000C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000004F7D590099C9A5002E613C002B61
      3C0035704A0073AE88004B845E002C603B0098C29F0037543300DCEACE00FFFE
      E500C7B29C00F6D5C100F9CEBB006B3927000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000002C2CE0002C2CE0002C2CE0002C2C
      E0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2C
      E0002C2CE0002C2CE0002C2CE0002C2CE000FF000000FFFFFF00FF000000FFFF
      FF00FF00000000000000FFFFFF0000000000C0C0C00000000000C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000005D8F6500DBFFE30095CBA0005991
      66007FBC900058976B003D79500062976F00BAE6C1003B5B3800B5C5A600B1B3
      9600BFB09600FFFFEB00C7A08A00835843000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000002C2CE000FFFFFF002C2CE0002C2C
      E0002C2CE0002C2CE000FFFFFF00FFFFFF00E7E6E0002C2CE0002C2CE000E7E6
      E0002C2CE0002C2CE0002C2CE0002C2CE00000000000FF00000000000000FFFF
      FF0000000000FF000000FFFFFF00FF00000000000000FF000000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C0000000000070A17300D0FFD500A2D8A9009BD2
      A30068A17400306B3E00326A3F009BD0A500E3FFE80042633E00EDFFDF00EAEF
      D000BBB09500F8E2C900EACAB3005E3923000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000002C2CE000FFFFFF002C2CE0002C2C
      E0002C2CE0002C2CE000E7E6E0002C2CE0002C2CE000FFFFFF002C2CE000FFFF
      FF002C2CE0002C2CE0002C2CE0002C2CE000FF00000000000000FF0000000000
      0000FF00000000000000FF00000000000000FF00000000000000C0C0C000C0C0
      C000C0C0C000FFFFFF00C0C0C0000000000068976900D9FFD900A0D1A30073A7
      780042784900699E720053855B005D8B6100C9EFCB0039573400A2B29300AFB4
      9700C2BBA200D6C4AD00E2CAB400654833000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000002C2CE000E7E6E000FFFFFF00FFFF
      FF002C2CE0002C2CE000FFFFFF002C2CE0002C2CE000FFFFFF002C2CE000FFFF
      FF00FFFFFF00FFFFFF002C2CE0002C2CE00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF000000000000000000000000000000000081AC8100A0CB9E00659267005E8B
      6000DAFFDE00C7F3CC0078A17C00608662009EBD9E0040563900FBFFEE00F7FA
      E100A7A08C0042342200614D3C005B4434000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000002C2CE000FFFFFF002C2CE0002C2C
      E000E7E6E0002C2CE000FFFFFF002C2CE0002C2CE000E7E6E0002C2CE000FFFF
      FF002C2CE0002C2CE0002C2CE0002C2CE000FF00000000000000FF0000000000
      0000FF00000000000000FF00000000000000FF00000000000000FFFFFF00FFFF
      FF0080808000FFFFFF00000000000000000080A57D00DEFFDD00E8FFE700DAFF
      DB00E8FFEA00EAFFEA00E6FFE700EBFFEA00EAFFE7004C5C4500F4FBE600F8F8
      E600B6AFA000E2D7C9005C4C3F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C2CE000FFFFFF00FFFFFF00FFFF
      FF002C2CE0002C2CE000FFFFFF00FFFFFF00FFFFFF002C2CE0002C2CE000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002C2CE0000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008080800000000000000000000000000087A8850076977400739472008EAF
      8D0057765700658163005D765C006579620065745F00535D4C00F9FCED00EDEB
      E000BFB9AE00443B320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C2CE0002C2CE0002C2CE0002C2C
      E0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2CE0002C2C
      E0002C2CE0002C2CE0002C2CE0002C2CE0000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000000000000000000000000000000000000000000000000000AFCE
      AF00B5CEB200ACC5A900B5C9B200B4C5B000ACB8A600C0C7B800B9BAB000B5B3
      A900BDB7B000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C00107FF00000000800003FF00000000
      800003FF00000000800000FF000000008000807F00000000C001C00700000000
      8000E003000000008000F001000000008000F801000000008000F80100000000
      C001F801000000008000F801000000008000F801000000008000F80100000000
      8000FC0300000000C001FE0700000000E000FFFF000180038000E00100008003
      0000800100008003000020010000800300000001000080030000000100018003
      000000010000800300000001000080030000000100008003E000800100008003
      E000800100018003E000C00100008003E000E00100008003E001E00100008007
      E003E0030000800FE007E0070001801F80018001E000E000800180018000E000
      800180010000E000800180010000E000800100010000E0008001000100000000
      80010001000000008001000100000000800100010000000080010001E0000000
      80030001E000000080078001E000000080098001E000E00080118001E005E005
      80218003E003E00380418007E007E007FFFFC003E000E000FFFFC003E000E000
      E003C003E000E000E003C003E000E000E003C0030000E000E003C00300000000
      E003C00300000000E003C00300000000E003C00300000000E003000000000000
      E003000000000000E003000000000000E007000000000000E00F000000010001
      E01F0000E0030003FFFF0000E007E00700000000000000000000000000000000
      000000000000}
  end
  object odFile: TOpenDialog [29]
    Left = 450
    Top = 441
  end
  object tbMensR: TkbmMemTable [30]
    DesignActivation = True
    AttachedTo = tbMens
    AttachedAutoRefresh = True
    AttachMaxCount = 3
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
      end
      item
        Name = 'ORG'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'OFFICIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RANK'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'TEL_WORK'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEL_MOB'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SIGNDATE'
        DataType = ftDate
      end
      item
        Name = 'SROK'
        DataType = ftDate
      end
      item
        Name = 'ATTESTATION'
        DataType = ftString
        Size = 1
      end>
    Filtered = True
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    Filter = 'tip=0'
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 400
    Top = 18
  end
  object dsMens: TDataSource [31]
    DataSet = tbMens
    OnDataChange = dsMensDataChange
    Left = 165
    Top = 559
  end
  object dsMensR: TDataSource [32]
    DataSet = tbMensR
    Left = 333
    Top = 112
  end
  object tbMensAll: TkbmMemTable [33]
    DesignActivation = True
    AttachedTo = tbMens
    AttachedAutoRefresh = True
    AttachMaxCount = 3
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'NOMER'
        DataType = ftInteger
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
      end
      item
        Name = 'ORG'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'OFFICIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RANK'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'TEL_WORK'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEL_MOB'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SIGNDATE'
        DataType = ftDate
      end
      item
        Name = 'SROK'
        DataType = ftDate
      end
      item
        Name = 'ATTESTATION'
        DataType = ftString
        Size = 1
      end>
    Filtered = True
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 352
    Top = 26
  end
  inherited Zip: TZipForge
    Left = 832
    Top = 98
  end
  object dsTask: TDataSource
    DataSet = tbTask
    Left = 828
    Top = 253
  end
  object tbFolder: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterScroll = tbFolderAfterScroll
    Left = 592
    Top = 16
    object tbFolderPOST_ID: TIntegerField
      FieldName = 'POST_ID'
    end
    object tbFolderTASK_ID: TIntegerField
      FieldName = 'TASK_ID'
    end
    object tbFolderTASK_ID_SOURCE: TIntegerField
      FieldName = 'TASK_ID_SOURCE'
    end
    object tbFolderNOMER: TSmallintField
      FieldName = 'NOMER'
    end
    object tbFolderADD_TYPE: TSmallintField
      FieldName = 'ADD_TYPE'
    end
    object tbFolderIDNUMBER: TStringField
      FieldName = 'IDNUMBER'
      Size = 40
    end
    object tbFolderKIND: TStringField
      FieldName = 'KIND'
      Size = 50
    end
    object tbFolderTEXT: TMemoField
      FieldName = 'TEXT'
      BlobType = ftMemo
    end
    object tbFolderTASKDATE: TDateField
      FieldName = 'TASKDATE'
    end
    object tbFolderTASKNUMBER: TStringField
      FieldName = 'TASKNUMBER'
      Size = 40
    end
    object tbFolderCONFIDENT: TStringField
      FieldName = 'CONFIDENT'
      Size = 100
    end
    object tbFolderNUMCOPY: TSmallintField
      FieldName = 'NUMCOPY'
    end
    object tbFolderFLAG: TSmallintField
      FieldName = 'FLAG'
    end
    object tbFolderDEADLINE: TDateField
      FieldName = 'DEADLINE'
    end
    object tbFolderTASK_REG: TBooleanField
      FieldName = 'TASK_REG'
    end
    object tbFolderTASK_COPY: TBooleanField
      FieldName = 'TASK_COPY'
    end
    object tbFolderCONTENTS: TMemoField
      FieldName = 'CONTENTS'
      BlobType = ftMemo
    end
    object tbFolderPAGES: TIntegerField
      FieldName = 'PAGES'
    end
  end
  object dsFolder: TDataSource
    DataSet = tbFolder
    Left = 876
    Top = 245
  end
  object tbReferred: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 4
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'REGDATE'
        DataType = ftDate
      end
      item
        Name = 'REGNUMBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RETYPE'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterPost = tbReferredAfterPost
    Left = 784
    Top = 154
    object tbReferredPOST_ID: TIntegerField
      FieldName = 'POST_ID'
    end
    object tbReferredPARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
    end
    object tbReferredREGDATE: TDateField
      FieldName = 'REGDATE'
    end
    object tbReferredREGNUMBER: TStringField
      FieldName = 'REGNUMBER'
      Size = 30
    end
    object tbReferredIDNUMBER: TStringField
      FieldName = 'IDNUMBER'
      Size = 40
    end
    object tbReferredRETYPE: TSmallintField
      FieldName = 'RETYPE'
    end
  end
  object dsReferredAdd: TDataSource
    DataSet = tbReferredAdd
    Left = 928
    Top = 122
  end
  object tbReferredAdd: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedTo = tbReferred
    AttachedAutoRefresh = True
    AttachMaxCount = 4
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'REGDATE'
        DataType = ftDate
      end
      item
        Name = 'REGNUMBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RETYPE'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 928
    Top = 154
  end
  object tbReferredR: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedTo = tbReferred
    AttachedAutoRefresh = True
    AttachMaxCount = 4
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'REGDATE'
        DataType = ftDate
      end
      item
        Name = 'REGNUMBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RETYPE'
        DataType = ftSmallint
      end>
    Filtered = True
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    Filter = 'parent_id=0'
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 832
    Top = 154
  end
  object dsReferredR: TDataSource
    DataSet = tbReferredR
    Left = 832
    Top = 122
  end
  object DataSource1: TDataSource
    DataSet = tbReferred
    Left = 784
    Top = 122
  end
  object dsReferredTask: TDataSource
    DataSet = tbReferredTask
    Left = 880
    Top = 122
  end
  object tbReferredTask: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedTo = tbReferred
    AttachedAutoRefresh = True
    AttachMaxCount = 4
    FieldDefs = <
      item
        Name = 'POST_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'REGDATE'
        DataType = ftDate
      end
      item
        Name = 'REGNUMBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNUMBER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RETYPE'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 880
    Top = 154
  end
  object pmFiles: TPopupMenu
    Images = fmMain.ImageList
    Left = 84
    Top = 439
    object pmFiles_Open: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      OnClick = pmFiles_OpenClick
    end
    object pmFiles_Save: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1074' '#1087#1072#1087#1082#1091
      OnClick = pmFiles_SaveClick
    end
    object pmFilesWithETSP64_Save: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' c '#1069#1062#1055'(Base64) '#1074' '#1087#1072#1087#1082#1091
      OnClick = pmFilesWithETSP64_SaveClick
    end
    object pmFilesWithETSP_Save: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' c '#1069#1062#1055'(p7s) '#1074' '#1087#1072#1087#1082#1091
      OnClick = pmFilesWithETSP_SaveClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmFiles_Add: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1074' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 119
      OnClick = pmFiles_AddClick
    end
    object pmFilesWithETSP_Load: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' c '#1069#1062#1055' '#1074' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      OnClick = pmFilesWithETSP_LoadClick
    end
    object pmFiles_Del: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083' '#1080#1079' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      ImageIndex = 120
      OnClick = pmFiles_DelClick
    end
    object pmFiles_ETSP: TMenuItem
      Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086'-'#1094#1080#1092#1088#1086#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
      ImageIndex = 87
      OnClick = pmFiles_ETSPClick
    end
  end
  object pmMens: TPopupMenu
    Images = fmMain.ImageList
    Left = 108
    Top = 551
    object pmMens_Add: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 119
      OnClick = pmMens_AddClick
    end
    object pmMens_Del: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = pmMens_DelClick
    end
    object pmMens_Edit: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 118
      OnClick = pmMens_EditClick
    end
  end
end
