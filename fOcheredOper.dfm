inherited fmOcheredOper: TfmOcheredOper
  Left = 417
  Top = 157
  Caption = #1056#1077#1096#1077#1085#1080#1077
  ClientHeight = 677
  ClientWidth = 805
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImBtClear: TImage
    Left = 520
    Top = 96
    Height = 16
  end
  inherited Panel1: TPanel
    Top = 526
    Width = 731
    Align = alNone
    Visible = False
    inherited btOk: TBitBtn
      Left = 513
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    inherited btCancel: TBitBtn
      Left = 622
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 805
    Height = 278
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      805
      278)
    object Label83: TLabel
      Left = 16
      Top = 78
      Width = 93
      Height = 32
      Caption = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103#13#10'('#1087#1088#1086#1077#1082#1090#1072')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label85: TLabel
      Left = 16
      Top = 115
      Width = 85
      Height = 16
      Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label102: TLabel
      Left = 16
      Top = 144
      Width = 64
      Height = 16
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 52
      Height = 16
      Caption = #1056#1077#1096#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFIO: TLabel
      Left = 16
      Top = 46
      Width = 49
      Height = 16
      Caption = #1063#1077#1083#1086#1074#1077#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 144
      Width = 11
      Height = 16
      Caption = '1.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 120
      Top = 176
      Width = 11
      Height = 16
      Caption = '2.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 208
      Width = 92
      Height = 16
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDateSila: TLabel
      Left = 303
      Top = 114
      Width = 104
      Height = 16
      Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbResh: TLabel
      Left = 8
      Top = 240
      Width = 753
      Height = 35
      AutoSize = False
      Caption = 'lbResh'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object edResh: TDBEditEh
      Left = 136
      Top = 76
      Width = 137
      Height = 24
      DataField = 'NOMER'
      DataSource = DataSource
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
    object edDate: TDBDateTimeEditEh
      Left = 136
      Top = 110
      Width = 137
      Height = 24
      DataField = 'DATER'
      DataSource = DataSource
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
      OnUpdateData = edDateUpdateData
    end
    object edFIO: TDBEditEh
      Left = 136
      Top = 42
      Width = 337
      Height = 24
      Color = clInfoBk
      EditButtons = <
        item
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001863186318631863186318631863186318631863186318631863
            1863186318631863186310420040004010421042100010001042100010001042
            1863186318631863186318631042004010420040104210001042100010421863
            1863186318631863186318631863004010420040104210001042100010421863
            1863186318631863186318631863004010420040104210001042100010421863
            1863186318631863186318631863004000400040104210001000100010421863
            1863186318631863186318631863004000400040104210001000100010421863
            1042104218631863004010421863004010001042104210001000100010421042
            1000104218631863004000401042004010001000104210001000100010421000
            1000186318631863186300400040004000401000100010001000100010001000
            1863186318631863186318630040004000400040100010001000100010001863
            1863186318631863186318631863186300401042104218631000104210421863
            1863186318631863186318631863004000400040104210001000100010421863
            1863186318631863186318631863004000400040104210001000100010421863
            1863186318631863186318631863104200400040186310421000100018631863
            1863186318631863186318631863186318631863186318631863186318631863
            186318631863}
          Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1095#1077#1083#1086#1074#1077#1082#1072
          Style = ebsGlyphEh
          Width = 22
          OnClick = edFIOEditButtons0Click
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
    end
    object edOsnov: TDBEditEh
      Left = 136
      Top = 140
      Width = 663
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataField = 'OSNOV_TEXT'
      DataSource = DataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edOsnovEditButtons0Click
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
          OnClick = edOsnovEditButtons1Click
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
    object edOsnov2: TDBEditEh
      Left = 136
      Top = 172
      Width = 663
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataField = 'OSNOV_TEXT2'
      DataSource = DataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edOsnov2EditButtons0Click
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
          OnClick = edOsnov2EditButtons1Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = True
    end
    object cbOtkaz: TDBCheckBoxEh
      Left = 408
      Top = 13
      Width = 137
      Height = 17
      Caption = #1086#1090#1082#1072#1079#1072#1090#1100
      DataField = 'OTKAZ'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edAddInfo: TDBMemo
      Left = 136
      Top = 203
      Width = 663
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ADDINFO'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edDateSila: TDBDateTimeEditEh
      Left = 418
      Top = 110
      Width = 137
      Height = 24
      Hint = #1044#1072#1090#1072' '#1076#1083#1103' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080', '#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1076#1072#1090#1099' '#1088#1077#1096#1077#1085#1080#1103
      DataField = 'DATE_SILA'
      DataSource = DataSource
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
    object edOper: TComboBox
      Left = 136
      Top = 9
      Width = 236
      Height = 24
      Style = csDropDownList
      DropDownCount = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = edOperChange
    end
    object edOper1: TDBComboBoxEh
      Left = 616
      Top = 9
      Width = 113
      Height = 24
      TabStop = False
      DataField = 'TIP'
      DataSource = DataSource
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1055#1077#1088#1077#1086#1092#1086#1088#1084#1083#1077#1085#1080#1077
        #1056#1072#1079#1076#1077#1083#1077#1085#1080#1077
        #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077)
      KeyItems.Strings = (
        '1'
        '2'
        '3')
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 307
      Top = 79
      Width = 218
      Height = 17
      Caption = ' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1087#1088#1086#1077#1082#1090#1086#1084
      DataField = 'PLAN'
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      TabStop = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object gbResh: TGroupBox
    Left = 0
    Top = 304
    Width = 805
    Height = 173
    Align = alTop
    Caption = ' '#1058#1077#1082#1089#1090' '#1076#1083#1103' '#1088#1077#1096#1077#1085#1080#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      805
      173)
    object edTextResh: THunSpellDBMemo
      Left = 4
      Top = 17
      Width = 796
      Height = 151
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'TEXTRESH'
      DataSource = DataSource
      TabOrder = 0
      RightClickMoveCaret = False
      RightEdge = 0
    end
  end
  object gbVipis: TGroupBox
    Left = 0
    Top = 477
    Width = 805
    Height = 200
    Align = alClient
    Caption = ' '#1058#1077#1082#1089#1090' '#1076#1083#1103' '#1074#1099#1087#1080#1089#1082#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      805
      200)
    object edTextVipis: THunSpellDBMemo
      Left = 4
      Top = 17
      Width = 796
      Height = 178
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'TEXTVIPIS'
      DataSource = DataSource
      TabOrder = 0
      RightClickMoveCaret = False
      RightEdge = 0
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 805
    Height = 26
    AllowDrag = False
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar'
      CloseButton = False
      DragHandleStyle = dhDouble
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FullSize = True
      Images = fmMain.ImageList
      MenuBar = True
      Options = [tboSameWidth, tboShowHint]
      ParentFont = False
      ProcessShortCuts = True
      Resizable = False
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItemSave: TTBItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 36
        ShortCut = 113
        OnClick = TBItemSaveClick
      end
      object TBItemCancel: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        Hint = #1054#1090#1082#1072#1079
        ImageIndex = 37
        ShortCut = 16499
        OnClick = TBItemCancelClick
      end
      object TBItemText: TTBItem
        Caption = #1058#1077#1082#1089#1090
        DisplayMode = nbdmImageAndText
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1088#1077#1096#1077#1085#1080#1103
        ImageIndex = 4
        ShortCut = 115
        OnClick = TBItemTextClick
      end
      object TBItemVipis: TTBItem
        Caption = #1042#1099#1087#1080#1089#1082#1072
        DisplayMode = nbdmImageAndText
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074#1099#1087#1080#1089#1082#1091' '#1080#1079' '#1088#1077#1096#1077#1085#1080#1103
        ImageIndex = 95
        ShortCut = 116
        OnClick = TBItemVipisClick
      end
      object TBItemArxiv: TTBItem
        AutoCheck = True
        Caption = #1040#1088#1093#1080#1074#1085#1086#1077
        DisplayMode = nbdmImageAndText
        Hint = #1040#1088#1093#1080#1074#1085#1086#1077' '#1088#1077#1096#1077#1085#1080#1077' '#1073#1077#1079' '#1076#1072#1090#1099
        ImageIndex = 0
      end
      object TBItemLast: TTBItem
        Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077
        DisplayMode = nbdmImageAndText
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1088#1077#1096#1077#1085#1080#1077' '#1087#1086' '#1086#1073#1097#1077#1081' '#1086#1095#1077#1088#1077#1076#1080
        ImageIndex = 17
        Visible = False
        OnClick = TBItemLastClick
      end
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 512
    Top = 32
  end
end
