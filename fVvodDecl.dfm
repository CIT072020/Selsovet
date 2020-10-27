object fmVvodDecl: TfmVvodDecl
  Left = 466
  Top = 244
  ActiveControl = edFIO
  BorderStyle = bsDialog
  Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
  ClientHeight = 308
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 267
    Width = 441
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btOk: TBitBtn
      Left = 239
      Top = 6
      Width = 83
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 338
      Top = 6
      Width = 83
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnFIO: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 12
      Width = 190
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103', '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edFIO: TDBEditEh
      Left = 219
      Top = 6
      Width = 212
      Height = 24
      HelpType = htKeyword
      HelpContext = 888
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MRUList.AutoAdd = False
      MRUList.Active = True
      MRUList.Items.Strings = (
        #1041#1088#1077#1089#1090#1089#1082#1072#1103
        #1042#1080#1090#1077#1073#1089#1082#1072#1103
        #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
        #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
        #1052#1080#1085#1089#1082#1072#1103
        #1052#1086#1075#1080#1083#1077#1074#1089#1082#1072#1103)
      MRUList.Limit = 6
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnUpdateData = edFIOUpdateData
    end
  end
  object pnAdres: TPanel
    Left = 0
    Top = 73
    Width = 441
    Height = 194
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label2: TLabel
      Left = 112
      Top = 42
      Width = 30
      Height = 13
      Caption = #1088#1072#1081#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 83
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 122
      Top = 164
      Width = 19
      Height = 13
      Caption = #1076#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 253
      Top = 164
      Width = 28
      Height = 13
      Caption = #1082#1086#1088#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 355
      Top = 164
      Width = 16
      Height = 13
      Caption = #1082#1074'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 113
      Top = 133
      Width = 30
      Height = 13
      Caption = #1091#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 68
      Top = 11
      Width = 76
      Height = 13
      Caption = #1086#1073#1083#1072#1089#1090#1100' ('#1082#1088#1072#1081')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 62
      Top = 72
      Width = 82
      Height = 13
      Caption = #1075#1086#1088#1086#1076' ('#1089#1077#1083#1077#1085#1080#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 74
      Top = 103
      Width = 69
      Height = 13
      Caption = #1088#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edObl: TDBEditEh
      Left = 180
      Top = 5
      Width = 230
      Height = 24
      EditButtons = <
        item
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MRUList.AutoAdd = False
      MRUList.Active = True
      MRUList.Items.Strings = (
        #1041#1088#1077#1089#1090#1089#1082#1072#1103
        #1042#1080#1090#1077#1073#1089#1082#1072#1103
        #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
        #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
        #1052#1080#1085#1089#1082#1072#1103
        #1052#1086#1075#1080#1083#1077#1074#1089#1082#1072#1103)
      MRUList.Limit = 6
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnUpdateData = edOblUpdateData
    end
    object edRaion: TDBEditEh
      Left = 180
      Top = 36
      Width = 230
      Height = 24
      EditButtons = <
        item
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MRUList.AutoAdd = False
      MRUList.Active = True
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnUpdateData = edOblUpdateData
    end
    object edTypePunkt: TDBLookupComboboxEh
      Left = 180
      Top = 66
      Width = 49
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsTypeGorod
      ParentFont = False
      TabOrder = 3
      Visible = True
    end
    object edGOROD: TDBEditEh
      Left = 239
      Top = 66
      Width = 171
      Height = 24
      EditButtons = <
        item
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
      OnUpdateData = edOblUpdateData
    end
    object edUL: TDBEditEh
      Left = 180
      Top = 127
      Width = 230
      Height = 24
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edULEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = True
      OnUpdateData = edULUpdateData
    end
    object edDom: TDBEditEh
      Left = 180
      Top = 158
      Width = 54
      Height = 24
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
    object edKorp: TDBEditEh
      Left = 292
      Top = 158
      Width = 45
      Height = 24
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
    object edKv: TDBEditEh
      Left = 381
      Top = 158
      Width = 46
      Height = 24
      HelpType = htKeyword
      HelpContext = 999
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
    object edB_OBL: TDBCheckBoxEh
      Left = 158
      Top = 9
      Width = 15
      Height = 17
      AllowGrayed = True
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edRNGOROD: TDBLookupComboboxEh
      Left = 180
      Top = 97
      Width = 230
      Height = 24
      DropDownBox.Rows = 15
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'R_NAME'
      ListField = 'R_NAME'
      ListSource = dsRnGor
      ParentFont = False
      Style = csDropDownEh
      TabOrder = 5
      Visible = True
    end
  end
  object pnGosud: TPanel
    Left = 0
    Top = 41
    Width = 441
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label15: TLabel
      Left = 10
      Top = 12
      Width = 134
      Height = 13
      Caption = #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072' ('#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edGOSUD: TDBLookupComboboxEh
      Left = 180
      Top = 6
      Width = 230
      Height = 24
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsStran
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
  end
  object dsTypeGorod: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 24
    Top = 154
  end
  object dsRnGor: TDataSource
    DataSet = dmBase.LookupRnGor
    Left = 24
    Top = 114
  end
  object dsStran: TDataSource
    DataSet = dmBase.SprStran
    Left = 20
    Top = 81
  end
end
