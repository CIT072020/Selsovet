object fmSimple: TfmSimple
  Left = 372
  Top = 203
  AutoScroll = False
  ClientHeight = 473
  ClientWidth = 789
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock: TTBDock
    Left = 0
    Top = 0
    Width = 789
    Height = 26
    AllowDrag = False
    object TBToolbar: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1052#1077#1085#1102
      ChevronHint = #1041#1086#1083#1100#1096#1077' '#1082#1085#1086#1087#1086#1082'|'
      DockPos = 8
      Images = fmMain.ImageList
      ProcessShortCuts = True
      Stretch = True
      TabOrder = 0
      object TBItemDelList: TTBItem
        Caption = '&'#1059#1076#1072#1083#1080#1090#1100
        HelpContext = 1
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1089#1087#1080#1089#1082#1077
        ImageIndex = 41
        ShortCut = 16430
        OnClick = TBItemDelListClick
      end
      object TBItemReLoad: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        HelpContext = 1
        Hint = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1074#1090#1086#1088#1085#1086
        ImageIndex = 69
        Visible = False
        OnClick = TBItemReLoadClick
      end
      object TBItemPreView: TTBItem
        Caption = #1055'&'#1088#1086#1089#1084#1086#1090#1088
        Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' F5'
        ImageIndex = 31
        ShortCut = 116
        OnClick = TBItemPreViewClick
      end
      object TBItemPrint: TTBItem
        Caption = '&'#1055#1077#1095#1072#1090#1100
        Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' F6'
        ImageIndex = 24
        ShortCut = 117
        OnClick = TBItemPrintClick
      end
      object TBSubmenuTmp: TTBSubmenuItem
        Caption = '&'#1044#1086#1082#1091#1084#1077#1085#1090#1099
        ImageIndex = 95
        Options = [tboLongHintInMenuOnly]
      end
      object TBSubmenuRun: TTBSubmenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        ImageIndex = 22
        Visible = False
      end
      object TBItemWrite: TTBItem
        Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
        HelpContext = 1
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1090' '#1074' '#1073#1072#1079#1077'  F2'
        ImageIndex = 36
        ShortCut = 113
        OnClick = TBItemWriteClick
      end
      object TBItemCancel: TTBItem
        Caption = '&'#1042#1099#1093#1086#1076
        Hint = #1042#1099#1081#1090#1080' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103'  Ctrl-F2'
        ImageIndex = 37
        ShortCut = 16497
        OnClick = TBItemCancelClick
      end
      object TBItemSetUp: TTBItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
        ImageIndex = 23
        OnClick = TBItemSetUpClick
      end
      object TBItemDesignReport: TTBItem
        Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1072#1090#1100
        Hint = #1056#1072#1079#1088#1072#1073#1086#1090#1072#1090#1100' '#1086#1090#1095#1077#1090
        ImageIndex = 12
        OnClick = TBItemDesignReportClick
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItemAddHist: TTBItem
        Caption = #1044#1086#1073'. '#1074' '#1080#1089#1090#1086#1088#1080#1102
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1080#1089#1090#1086#1088#1080#1102
        ImageIndex = 101
        OnClick = TBItemAddHistClick
      end
      object TBItemHist: TTBItem
        Caption = #1048#1089#1090#1086#1088#1080#1103
        Hint = #1048#1089#1090#1086#1088#1080#1103' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1088#1077#1082#1074#1080#1079#1080#1090#1072
        ImageIndex = 3
        OnClick = TBItemHistClick
      end
    end
    object TBToolbarMove: TTBToolbar
      Left = 616
      Top = 0
      Align = alRight
      Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      DockPos = 616
      Images = fmMain.ImageList
      ProcessShortCuts = True
      Stretch = True
      TabOrder = 1
      object TBItemFirst: TTBItem
        Caption = #1042' '#1085#1072#1095#1072#1083#1086
        Hint = #1042' '#1085#1072#1095#1072#1083#1086'  Ctrl-PgUp'
        ImageIndex = 0
        Images = fmMain.ImageListMove
        ShortCut = 16417
        OnClick = TBItemFirstClick
      end
      object TBItemPrev: TTBItem
        Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
        Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081'   PgUp'
        ImageIndex = 1
        Images = fmMain.ImageListMove
        ShortCut = 33
        OnClick = TBItemPrevClick
      end
      object TBItemNext: TTBItem
        Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081
        Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081'   PgDn'
        ImageIndex = 2
        Images = fmMain.ImageListMove
        ShortCut = 34
        OnClick = TBItemNextClick
      end
      object TBItemLast: TTBItem
        Caption = #1042' '#1082#1086#1085#1077#1094
        Hint = #1042' '#1082#1086#1085#1077#1094'   Ctrl-PgDn'
        ImageIndex = 3
        Images = fmMain.ImageListMove
        ShortCut = 16418
        OnClick = TBItemLastClick
      end
      object TBItemNonQuery: TTBItem
        AutoCheck = True
        Caption = #1047#1072#1087#1080#1089#1100' '#1073#1077#1079' '#1079#1072#1087#1088#1086#1089#1072
        HelpContext = 1
        Hint = #1047#1072#1087#1080#1089#1100' '#1073#1077#1079' '#1079#1072#1087#1088#1086#1089#1072'  '#1087#1088#1080'  '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1080
        ImageIndex = 99
      end
    end
  end
  object sb: TScrollBox
    Left = 0
    Top = 26
    Width = 789
    Height = 428
    Align = alClient
    BorderStyle = bsNone
    Constraints.MinHeight = 100
    TabOrder = 1
    object ImBtClear: TImage
      Left = 552
      Top = 8
      Width = 17
      Height = 17
      Picture.Data = {
        07544269746D6170C6000000424DC60000000000000076000000280000000A00
        00000A0000000100040000000000500000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00888888888800000000888888080000008008888008000000800088008800
        0000880000088800000088800088880000008800000888000000800088008800
        000080088880080000008088888888000000}
      Visible = False
    end
    object ImBtRun: TImage
      Left = 592
      Top = 8
      Width = 17
      Height = 17
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000232E0000232E0000000000000000
        0001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5
        E5BFBFBF9F9F9F8888888888889F9F9FBFBFBFE5E5E5FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCDCDCD9696969E9E9EACACACB5B5B5B5B5B5ACACAC
        9E9E9E969696CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF8E8E8EACAC
        ACB4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4ACACAC8E8E8ECFCFCFFFFFFFFF
        FFFFFFFFFFE8E8E8A0A0A0A9A9A9AFAFAFAFAFAF5F5F5FACACACAFAFAFAFAFAF
        AFAFAFAFAFAFA9A9A9A0A0A0E8E8E8FFFFFFFFFFFFC8C8C89E9E9EA9A9A9A9A9
        A9A9A9A90000004949499C9C9CA9A9A9A9A9A9A9A9A9A9A9A99E9E9EC8C8C8FF
        FFFFFFFFFFB1B1B1A0A0A0A3A3A3A3A3A3A3A3A30000000000002424247C7C7C
        A3A3A3A3A3A3A3A3A3A0A0A0B1B1B1FFFFFFFFFFFFA4A4A49D9D9D9D9D9D9D9D
        9D9D9D9D0000000000000000000707075454549D9D9D9D9D9D9D9D9DA4A4A4FF
        FFFFFFFFFFA8A8A8979797969696969696969696000000000000000000060606
        4F4F4F969696969696979797A8A8A8FFFFFFFFFFFFBDBDBD9696969090909090
        909090900000000000001F1F1F6D6D6D909090909090909090969696BDBDBDFF
        FFFFFFFFFFD6D6D69B9B9B8A8A8A8A8A8A8A8A8A0000003A3A3A7F7F7F8A8A8A
        8A8A8A8A8A8A8A8A8A9B9B9BD6D6D6FFFFFFFFFFFFEFEFEFBEBEBE8D8D8D8585
        858585854747478282828585858585858585858585858D8D8DBEBEBEEFEFEFFF
        FFFFFFFFFFFFFFFFE2E2E2BABABA8A8A8A808080808080808080808080808080
        8080808A8A8ABABABAE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3C5C5
        C59B9B9B8B8B8B8080808080808B8B8B9B9B9BC5C5C5E3E3E3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2DEDEDECECECEC2C2C2C2C2C2CECECE
        DEDEDEF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
  end
  object StBar: TStatusBar
    Left = 0
    Top = 454
    Width = 789
    Height = 19
    Panels = <
      item
        Style = psOwnerDraw
        Text = 
          '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'  <F5> '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088'  <F6> '#1087#1077#1095#1072#1090#1100'  <F7> '#1082#1072#1088#1090#1086#1095#1082#1072'/'#1089#1087#1080 +
          #1089#1086#1082'  <F12> '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100'  <Ctrl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
    OnDrawPanel = StBarDrawPanel
  end
  object dsDokument: TDataSource
    OnDataChange = dsDokumentDataChange
    Left = 464
    Top = 58
  end
  object dsObl: TDataSource
    DataSet = dmBase.LookupObl
    Left = 504
    Top = 202
  end
  object dsRN: TDataSource
    DataSet = dmBase.LookupRN
    Left = 584
    Top = 194
  end
  object dsGorod: TDataSource
    DataSet = dmBase.LookupGorod
    Left = 584
    Top = 234
  end
  object dsStran: TDataSource
    DataSet = dmBase.SprStran
    Left = 412
    Top = 145
  end
  object dsTypeGorod: TDataSource
    DataSet = dmBase.TypePunkt
    Left = 512
    Top = 154
  end
end
