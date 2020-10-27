object fmEdFile: TfmEdFile
  Left = 629
  Top = 235
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
  ClientHeight = 342
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    614
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object bvBottom: TBevel
    Left = 10
    Top = 300
    Width = 596
    Height = 6
    Shape = bsTopLine
  end
  object laStoreKind: TLabel
    Left = 10
    Top = 20
    Width = 87
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1093#1088#1072#1085#1077#1085#1080#1103
  end
  object laName: TLabel
    Left = 10
    Top = 47
    Width = 54
    Height = 13
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
  end
  object laReadOnly: TLabel
    Left = 10
    Top = 102
    Width = 97
    Height = 13
    Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103
  end
  object laNote: TLabel
    Left = 10
    Top = 126
    Width = 119
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1086#1087#1080#1089#1072#1085#1080#1077')'
  end
  object laPath: TLabel
    Left = 10
    Top = 75
    Width = 69
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
  end
  object lbSign: TLabel
    Left = 10
    Top = 182
    Width = 160
    Height = 13
    Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086'-'#1094#1080#1092#1088#1086#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
  end
  object btOk: TButton
    Left = 437
    Top = 314
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 5
  end
  object btCancel: TButton
    Left = 525
    Top = 314
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
  object dcStoreKind: TDBComboBoxEh
    Left = 140
    Top = 14
    Width = 198
    Height = 24
    DataField = 'STORE_KIND'
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
  object deName: TDBEditEh
    Left = 140
    Top = 41
    Width = 420
    Height = 24
    DataField = 'NAME'
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
  object dcReadOnly: TDBComboBoxEh
    Left = 140
    Top = 96
    Width = 80
    Height = 24
    DataField = 'READ_ONLY'
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
  object deNote: TDBEditEh
    Left = 140
    Top = 124
    Width = 420
    Height = 51
    AutoSize = False
    DataField = 'NOTE'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object dePath: TDBEditEh
    Left = 140
    Top = 69
    Width = 420
    Height = 24
    DataField = 'PATH'
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
  object edSign: TDBEditEh
    Left = 8
    Top = 200
    Width = 561
    Height = 89
    AutoSize = False
    DataField = 'SIGNINFO'
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
  object btETSPFile: TBitBtn
    Left = 578
    Top = 200
    Width = 28
    Height = 28
    Hint = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086'-'#1094#1080#1092#1088#1086#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
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
end
