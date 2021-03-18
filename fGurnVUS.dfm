inherited fmGurnVUS: TfmGurnVUS
  Left = 355
  Top = 121
  Width = 974
  Height = 549
  Caption = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1099#1081' '#1089#1090#1086#1083
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000222222222222222222772227777277772BBB
    72BBBB7BBBB72B22B7222B7B72222B77B7222B7B72222BBB72BBBB7B72222B22
    B7B72B7B72222B77B7B72B7B77722BBB22B22B2BBBB222222222222222222222
    222222222222222222222222222200000000000000000000000000000000FFFF
    0000FFFF00000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFF0000FFFF0000}
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 958
    inherited TBToolbarMenu: TTBToolbar
      Stretch = True
      object TBItemAdd: TTBItem [0]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        HelpContext = 1
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072
        ImageIndex = 113
        OnClick = TBItemAddClick
      end
      object TBItemEditLic: TTBItem [7]
        Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
        ImageIndex = 60
        OnClick = TBItemEditLicClick
      end
      inherited TBSubSysFlt: TTBSubmenuItem
        Visible = False
      end
      inherited TBItemSysFlt: TTBItem
        Visible = True
      end
      inherited TBItemYear: TTBItem
        Visible = False
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 724
      Top = 0
      Caption = 'TBToolWindow'
      ClientAreaHeight = 22
      ClientAreaWidth = 151
      DockPos = 471
      TabOrder = 1
      object Label1: TLabel
        Left = 2
        Top = 4
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object lbSost: TLabel
        Left = 344
        Top = 4
        Width = 64
        Height = 16
        Caption = '                '
        Color = 16776176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object DBText: TvchDBText
        Left = 176
        Top = 4
        Width = 168
        Height = 15
        DataField = 'DATE_FIKS'
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
        OnGetText = DBTextGetText
      end
      object edSeek: TDBEditEh
        Left = 64
        Top = 1
        Width = 75
        Height = 21
        EditButtons = <>
        TabOrder = 0
        Visible = True
        OnChange = edSeekChange
      end
    end
  end
  inherited Grid: TSasaDBGrid
    Width = 958
    Height = 435
    OnGetCellParams = GridGetCellParams
  end
  inherited StBar: TStatusBar
    Top = 487
    Width = 958
  end
  inherited TBDock24: TTBDock
    Width = 958
  end
  inherited Query: TAdsQuery
    ParamData = <>
  end
  inherited TmpQuery: TAdsQuery
    ParamData = <>
  end
end
