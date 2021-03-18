inherited fmLichSchet: TfmLichSchet
  Left = 498
  Top = 202
  Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
  ClientHeight = 662
  ClientWidth = 970
  Constraints.MinHeight = 700
  Constraints.MinWidth = 800
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001100
    0011000000001111001B11000000111111BB6B1100001111116B6BBB11001111
    1BB886BBBB10111118000B66BB101111BB80E0BB661011116B80FE0BB100111B
    B6330FE0B1001116B6BBB0FE000011BB666BBB0FE00011BB6BB66BB0FE000011
    BBBBB6610000000011BBBB10000000000011BB10000000000000110000003CFF
    00000C3F0000000F000000030000000100000001000000010000000300000003
    0000000700000003000000010000C0000000F0190000FC1F0000FF3F0000}
  OldCreateOrder = True
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBDock: TTBDock
    Width = 970
    inherited TBToolbar: TTBToolbar
      Options = [tboShowHint]
      inherited TBSubmenuRun: TTBSubmenuItem [0]
        DisplayMode = nbdmImageAndText
        HelpContext = 1
        object TBItemPropAutoSum: TTBItem
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1072#1074#1090#1086#1089#1091#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1077#1084#1083#1080
          HelpContext = 1
          OnClick = TBItemPropAutoSumClick
        end
      end
      object TBSubmenuSort: TTBSubmenuItem [1]
        Caption = #1055#1086#1088#1103#1076#1086#1082
        DisplayMode = nbdmImageAndText
        Hint = #1055#1086#1088#1103#1076#1086#1082' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1083#1102#1076#1077#1081
        ImageIndex = 84
        object TBItemSort_Nomer: TTBItem
          Caption = #1053#1086#1084#1077#1088' '
          OnClick = TBItemSort_NomerClick
        end
        object TBItemSort_FIO: TTBItem
          Caption = #1060#1072#1084#1080#1083#1080#1103','#1048#1084#1103
          OnClick = TBItemSort_FIOClick
        end
        object TBItemSort_DateP: TTBItem
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080
          OnClick = TBItemSort_DatePClick
        end
      end
      inherited TBItemDelList: TTBItem [2]
        DisplayMode = nbdmImageAndText
        Visible = False
      end
      inherited TBItemReLoad: TTBItem [3]
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBItemPreView: TTBItem [4]
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBItemPrint: TTBItem [5]
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBSubmenuTmp: TTBSubmenuItem [6]
        DisplayMode = nbdmImageAndText
        object TBItem1: TTBItem
          Caption = '111111111'
        end
      end
      inherited TBItemWrite: TTBItem
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBItemCancel: TTBItem
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBItemSetUp: TTBItem
        DisplayMode = nbdmImageAndText
        Options = [tboShowHint, tboToolbarStyle]
      end
      inherited TBItemDesignReport: TTBItem
        Options = [tboShowHint, tboToolbarStyle]
      end
      object TBSubmenuProp: TTBSubmenuItem
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        Hint = #1057#1074#1086#1081#1089#1090#1074#1072
        ImageIndex = 105
        Visible = False
      end
    end
    inherited TBToolbarMove: TTBToolbar
      Left = 632
    end
  end
  inherited sb: TScrollBox
    Width = 970
    Height = 617
    object pnShap: TPanel
      Left = 0
      Top = 0
      Width = 970
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = True
      TabOrder = 0
      DesignSize = (
        970
        65)
      object lbClose: TvchDBText
        Left = 2
        Top = 9
        Width = 655
        Height = 19
        DataField = 'DATE_LIKV'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnGetText = lbCloseGetText
      end
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 100
        Height = 16
        Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090' '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 39
        Width = 35
        Height = 16
        Caption = #1040#1076#1088#1077#1089
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object TextAdres: TvchDBText
        Left = 58
        Top = 38
        Width = 348
        Height = 18
        Color = clInfoBk
        DataField = 'ADRES_ID'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnGetText = TextAdresGetText
      end
      object lbSobst: TLabel
        Left = 265
        Top = 11
        Width = 201
        Height = 16
        Caption = #1060'.'#1048'.'#1054'. '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072', '#1085#1072#1085#1080#1084#1072#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ImageNotStat: TImage
        Left = 945
        Top = 8
        Width = 18
        Height = 18
        Anchors = [akTop, akRight]
        Picture.Data = {
          055449636F6E0000010001001010000001001800680300001600000028000000
          1000000020000000010018000000000000030000000000000000000000000000
          000000004451593A3E435C4C4D74544E612F23794A4C5E3F66423B863444B506
          2092132677373E7D4B3D7F0000001100B71905E83B3A4AFFF9FFFFFBF9FFFFF5
          FFFCEEFFFBFB472E4AF8ECFF4A51AE5466D127399E000000191983190E8C3929
          CE1A09BE604265FFF7FFFAEDE5FFFFF1FFFFEEFFF9F25E4D56FFF3FFF1E5FF5B
          5CB63546D50016C50D26E22532DA1D178C0000005D3B5A55394C66544D484130
          59584E44443E53494951434F4E41613835852C40DB2B4CFF0D32FF0003B60000
          000000005C474FFFECEFFFFBFBFFFBFBFFFBFDFFFEFF4B4B4BF1F3FDF6F5FFC3
          C9FF485DE84264FF1D44FE0327C70000000000004A4437FFFFF8FFEDF4FFF8FF
          FFF1FEFFFAFF414147F1FCFFE2F1FF6173BA778FF92C47C7304FD44360E00E25
          93000000505A3C4646365F43505E344B6E41525C3B4A504B5A2C3D585C7CB197
          BAFA5068A42E3F782F3A743946943D55CC1633BE464E37FFFFF7FFF5FFFFF5FF
          FFF6FFFFF7FF4C3E50EFF7FF7592C55376A8E3F8FFDFE8FC4E4C600000001F2F
          9300169452414CFFFBFFFFFAFCFFFEFDFFFDFCFFFBFF553E4CFFF6FFE8F2FFE6
          F8FFECF9FFF4F8FF4F465B0000000000000000006243644D384E4C4A493E4538
          4F4F434E433F624A54533C4B5B50604D4A594141514A4A5A4E485B0000000000
          0000000051305CFFF4FFFCF3F0FFFFF2F6FEEDFFFFF94E4046FFF9FFFFEAEFFF
          FBFFFFFAFFF2EEFA4C4C5C0000000000000000005A3E62FDE5FDFFFCFBFFFFF4
          FFFFF5FFFFFB50494EFFF1F9FFFAFCFFFBFBFFFCFEFFFEFF45484C0000000000
          0000000051434E503D466D4F5456393C6153544740434C484E4F444E5D3E475F
          3D3E593D366253434E4C3A000000000000000000605148FFFDFBFFE6EDFFF7FF
          FFF5FFFFF3FE574E58FFFAFFFFF8FFFFFCFEFFFEF7FFEEDF6F64560000000000
          000000005F422DFFFDF2FFF7FFFFF7FFFFF2FFFFF6FF49343CFFFDFEFFFBF8FF
          FEFBFFF9FCFFFBFF563F470000000000000000007B563A5F4130604951614E63
          43254263465D65485162514E524F474B4B454E41496954635034470000000000
          0000000000040000001000000001000000030000000300000001000000000000
          0004000000070000000700000007000000070000000700000007000000070000
          00070000}
      end
      object lbDateSost: TvchDBText
        Left = 746
        Top = 9
        Width = 106
        Height = 18
        Color = clBtnFace
        DataField = 'DATE_FIKS'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnGetText = lbDateSostGetText
      end
      object edLichSchet: TDBEditEh
        Left = 117
        Top = 8
        Width = 136
        Height = 22
        DataField = 'NOMER'
        DataSource = dsDokument
        EditButtons = <
          item
            Glyph.Data = {
              AE040000424DAE0400000000000036040000280000000A0000000A0000000100
              08000000000078000000000000000000000000010000000000007F7F7F008000
              0000000080000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EC2094000000
              00009016F500982006004E16F500781306006A16F500000000006B15F5000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000005600
              580000ECFD001A020000881E9400A0200600381E940000000000F02294004500
              000028020000FFFFFF00BA39F500173AF5006A59010000000600302094008000
              1000F02294000590F700C8D5F600FFFFFF006A16F500000000006B15F5009BB2
              E700B700000002000000E02294000100000018000000000000004C2194004200
              000000000000302194000000000000000000000000000C000000020000000101
              F50000ECFD005600000000000000030000005E001A00A020060000000000A020
              060005000000BEB3E70088219400A3B4E700B800000000000000000000000000
              0000020000008000000000000000C8229400CF034B00B8262500000000000000
              0000BC22940002000000800000000000000064000000502394002946D300463A
              5C00726F6A006374730053656C006F766500375C4200505C6C0073745F006F6D
              650046313000626D7000F022940000000000E82CF500C8229400000000009016
              F500F8F50B004E16F500E8060600E0229400000000009016F500601C0C004E16
              F500D80706006A16F5002C23940004000000B8000000600E1800070000003800
              0000030000001800000007000000000000000700000098062500000002000700
              0000380000009C2294000590F700E0D5F600FFFF010000000200D02194000000
              0200C42294000590F700C8D5F600FFFFFF006A16F500A8034900000002000000
              000098062500000000001C2394002946D30098062500980D0500563DC60060C0
              C9000C000000000000000100000009000000F61B4600B8262500000000000000
              0000000000000000000000000000000000000000000100000000000200000001
              0001000100000202000000000101010000020202000001010101010102020202
              0000000001010100000202020000000100010001000002020000000000010000
              000000020000000000000000000000000000}
            Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
            Style = ebsGlyphEh
            Width = 16
            OnClick = edLichSchetEditButtons0Click
          end
          item
            Glyph.Data = {
              76010000424D760100000000000036000000280000000A0000000A0000000100
              18000000000040010000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000807F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F8000007F7F7F7F7F7F0000000080000080
              7F7F7F7F7F7F7F7F7F8000007F7F7F8000007F7F7F8000000000000080000080
              0000807F7F7F7F7F7F7F7F7F8000008000008000007F7F7F0000000080000080
              0000800000808000008000008000008000008000008000000000000080000080
              0000807F7F7F7F7F7F7F7F7F8000008000008000007F7F7F0000000080000080
              7F7F7F7F7F7F7F7F7F8000007F7F7F8000007F7F7F80000000000000807F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F8000007F7F7F7F7F7F00007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000}
            Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#1080#1079' '#1074#1090#1086#1088#1086#1081' '#1075#1088#1091#1087#1087#1099
            Style = ebsGlyphEh
            Width = 16
            OnClick = edLichSchetEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object btAdres: TBitBtn
        Left = 414
        Top = 36
        Width = 36
        Height = 22
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089
        TabOrder = 1
        OnClick = btAdresClick
        Glyph.Data = {
          D6000000424DD600000000000000560000002800000010000000100000000100
          040000000000800000000000000000000000080000000800000004020400FCFE
          04000402840004868400FC02FC0004FEFC000402FC0084868400444444444444
          4444440000000000074444055555055037444400000505503744440011050550
          3744440011050550374444000005000037444003333333333774402266666666
          2674440226000262674444402261062674444444022662677444444440222607
          7444444444026707744444444440740004444444444444444444}
      end
      object N_F_cbOwnHouse: TDBCheckBoxEh
        Left = 472
        Top = 39
        Width = 128
        Height = 17
        Caption = #1074' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
        DataField = 'OWN_HOUSE'
        DataSource = dsDokument
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = N_F_cbOwnHouseClick
      end
      object edTypeHouse: TDBLookupComboboxEh
        Left = 603
        Top = 35
        Width = 360
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Constraints.MaxWidth = 400
        DataField = 'TYPEHOUSE'
        DataSource = dsDokument
        DropDownBox.Rows = 20
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edTypeHouseEditButtons0Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dsSprTypeHouse
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object edFirst: TDBEditEh
        Left = 477
        Top = 8
        Width = 255
        Height = 22
        Color = clInfoBk
        DataField = 'FIRST_FIO'
        DataSource = dsDokument
        EditButtons = <
          item
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1075#1083#1072#1074#1091' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
            Style = ebsEllipsisEh
            OnClick = edFEditButtons0Click
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
            OnClick = edFirstEditButtons1Click
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Flat = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Visible = True
      end
    end
    object pc: TPageControl
      Left = 0
      Top = 65
      Width = 970
      Height = 552
      ActivePage = tsAdd
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = pcChange
      object tsSostav: TTabSheet
        Caption = #1057#1086#1089#1090#1072#1074
        object Split1: TSplitter
          Left = 0
          Top = 394
          Width = 962
          Height = 5
          Cursor = crVSplit
          Align = alTop
        end
        object pnNomer: TPanel
          Left = 0
          Top = 0
          Width = 962
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = True
          TabOrder = 0
          object lbKadastr: TLabel
            Left = 281
            Top = 9
            Width = 230
            Height = 16
            Caption = #1053#1086#1084#1077#1088' '#1087#1086' '#1079#1077#1084#1077#1083#1100#1085#1086'-'#1082#1072#1076#1072#1089#1090#1088#1086#1074#1086#1081' '#1082#1085#1080#1075#1077
          end
          object lbNomKn: TLabel
            Left = 12
            Top = 10
            Width = 33
            Height = 16
            Caption = #1050#1085#1080#1075#1072
          end
          object lbNomStr: TLabel
            Left = 136
            Top = 10
            Width = 56
            Height = 16
            Caption = #1057#1090#1088#1072#1085#1080#1094#1072
          end
          object edNomKn: TDBEditEh
            Left = 57
            Top = 6
            Width = 55
            Height = 24
            DataField = 'KNIGA_NOMER'
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
          object edNomStr: TDBEditEh
            Left = 206
            Top = 6
            Width = 55
            Height = 24
            DataField = 'KNIGA_STR'
            DataSource = dsDokument
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
          object edKadastr: TDBEditEh
            Left = 526
            Top = 6
            Width = 136
            Height = 24
            DataField = 'KADASTR'
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
          end
        end
        object pnDopInfo: TPanel
          Left = 0
          Top = 399
          Width = 962
          Height = 122
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = True
          TabOrder = 4
          object Split2: TSplitter
            Left = 657
            Top = 0
            Width = 5
            Height = 122
            Align = alRight
          end
          object gbDop: TGroupBox
            Left = 0
            Top = 0
            Width = 657
            Height = 122
            Align = alClient
            Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              657
              122)
            object edDop: TDBEditEh
              Left = 5
              Top = 15
              Width = 648
              Height = 102
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSelect = False
              AutoSize = False
              DataField = 'DOPOLN'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Flat = True
              ParentFont = False
              TabOrder = 0
              Visible = True
              WantTabs = True
              WantReturns = True
              WordWrap = True
            end
          end
          object gbPriznak: TGroupBox
            Left = 662
            Top = 0
            Width = 300
            Height = 122
            Align = alRight
            Caption = ' '#1055#1088#1080#1079#1085#1072#1082#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object gbSostav: TGroupBox
          Left = 0
          Top = 124
          Width = 962
          Height = 270
          Align = alTop
          Caption = ' '#1063#1083#1077#1085#1099' '#1093#1086#1079#1103#1081#1089#1090#1074#1072' '
          Constraints.MinHeight = 270
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object GridMens: TSasaDBGrid
            Left = 2
            Top = 15
            Width = 851
            Height = 253
            Align = alClient
            Ctl3D = True
            DataSource = dsMens
            DrawMemoText = True
            EditActions = [geaCopyEh, geaSelectAllEh]
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            UseMultiTitle = True
            VertScrollBar.VisibleMode = sbNeverShowEh
            OnDblClick = btEditMenClick
            OnGetCellParams = GridMensGetCellParams
            EnterDirection = mdNextGraph
            OptionsS = []
            SelRowColor = clAqua
            Color1 = clRed
            Color2 = clBlue
            TypeSave = 0
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NSTR'
                Footers = <>
                Title.Caption = #8470
                Width = 22
              end
              item
                Alignment = taLeftJustify
                EditButtons = <>
                FieldName = 'OTNOSH'
                Footers = <>
                Title.Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '
                Width = 107
                OnGetCellParams = GridMensColumns1GetCellParams
              end
              item
                EditButtons = <>
                FieldName = 'FAMILIA'
                Footers = <>
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'OTCH'
                Footers = <>
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'DATER'
                Footers = <>
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'POL'
                Footers = <>
                Width = 58
                OnGetCellParams = GridMensColumns6GetCellParams
              end
              item
                EditButtons = <>
                FieldName = 'LICH_NOMER'
                Footers = <>
                Title.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
                Width = 113
              end
              item
                EditButtons = <>
                FieldName = 'DATEP'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1087#1080#1089#1082#1080
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'DATEV'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'DATE_SROK'
                Footers = <>
                Title.Caption = #1044#1086' '#1082#1072#1082#1086#1075#1086' '#1089#1088#1086#1082#1072
                Width = 72
              end>
          end
          object pnWorkMens: TPanel
            Left = 853
            Top = 15
            Width = 107
            Height = 253
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object btDelMen: TBitBtn
              Left = 13
              Top = 35
              Width = 85
              Height = 25
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 0
              OnClick = btDelMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000008000
                00000080000080800000000080008000800000808000C0C0C00080808000FF00
                000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00777777777777
                777777777C7777777C7777777CC77777C777077777CC777C77770770007CCCC7
                7777700FF077CC777777770F000CCCC77777700FFCCC77CC77770000FCC07777
                C777000FFFFF07777777000FFF007777777700000FF0777777770000000F0777
                7777700000000777777777000007777777777777777777777777}
            end
            object btAddMen: TBitBtn
              Left = 13
              Top = 2
              Width = 85
              Height = 25
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = btAddMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888AA88888888888888AA88808888808888AA88808800088AAAA
                AAAA800FF088AAAAAAAA880F0008888AA888800FFFF0888AA8880000FFF0888A
                A888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btEditMen: TBitBtn
              Left = 13
              Top = 68
              Width = 85
              Height = 25
              Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072
              Caption = #1050#1086#1088#1088#1077#1082#1090'.'
              TabOrder = 2
              OnClick = btEditMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888880888880888888888088000888888
                8888800FF08888888888880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btChoiceMen: TBitBtn
              Left = 13
              Top = 101
              Width = 85
              Height = 25
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1080#1079' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
              Caption = #1042#1099#1073#1088#1072#1090#1100
              TabOrder = 3
              OnClick = btChoiceMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888E88888888888888EEE888088888088EEEE88808800088EEE8
                EE88800FF0888E888EE8880F0008888888EE800FFFF08888888E0000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btPerevodMen: TBitBtn
              Left = 69
              Top = 165
              Width = 28
              Height = 25
              Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
              Caption = #1055#1077#1088#1077#1074#1086#1076
              TabOrder = 4
              Visible = False
              OnClick = btReadAllClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888880880008088888888800FF00888888888880F000888888800000FFFF000
                00087FF000FFF0FFFF087F000FFFFF0000087F000FFF00FF0E087F00000FF0FF
                00087F0000000F0F0B087F700000000F00087F7F00000FFF08087F7FFF70F77F
                00087F7F77F0FFFF0808777FFF087FFF00088877778887777888}
            end
            object btUp: TBitBtn
              Left = 14
              Top = 165
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1074#1077#1088#1093
              TabOrder = 5
              OnClick = btUpClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
                0000000000000000000000000000000000008000000080000000800000000000
                000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
                C000000000008000000080000000800000008000000080000000800000008000
                0000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C0000000000080000000800000008000000080000000800000008000
                00008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C00000000000800000008000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000000000008000000000000000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
            end
            object btDown: TBitBtn
              Left = 38
              Top = 165
              Width = 20
              Height = 25
              Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1095#1077#1083#1086#1074#1077#1082#1072' '#1074#1085#1080#1079
              TabOrder = 6
              OnClick = btDownClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000800000000000
                0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000000000008000000080000000800000008000
                00008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C00000000000800000008000000080000000800000008000
                0000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C0000000000080000000800000008000000080000000800000008000
                000080000000800000008000000000000000C0C0C000C0C0C000C0C0C000C0C0
                C000000000000000000000000000000000000000000080000000800000008000
                00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080000000800000008000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
            end
            object btIsklMen: TBitBtn
              Left = 13
              Top = 133
              Width = 85
              Height = 25
              Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1095#1083#1077#1085#1072' '#1093#1086#1079#1103#1081#1089#1090#1074#1072' '#1080#1079' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
              Caption = #1048#1089#1082#1083#1102#1095'. '
              TabOrder = 7
              OnClick = btIsklMenClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888888888888808888808CCCCCCC808800088CCCC
                CCC8800FF088CCCCCCC8880F000888888888800FFFF0888888880000FFF08888
                8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                8888800000000888888888000008888888888888888888888888}
            end
            object btReadAll: TBitBtn
              Left = 13
              Top = 219
              Width = 85
              Height = 25
              Hint = 
                #1057#1086#1073#1088#1072#1090#1100' '#1074#1089#1077#1093' '#1083#1102#1076#1077#1081', '#1082#1090#1086' '#1088#1072#1085#1077#1077' '#1087#1088#1086#1078#1080#1074#1072#1083' '#1087#1086' '#1072#1076#1088#1077#1089#1091' ('#1080#1079' '#1089#1086#1089#1090#1086#1103#1085#1080#1081' '#1073 +
                #1072#1079#1099')'
              Caption = #1057#1086#1073#1088#1072#1090#1100
              TabOrder = 8
              OnClick = btReadAllClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000380000
                0038000000380000003800000038000000380000003800000038000000380000
                0038000000380000003800000038000000380000002C0000000000000022183C
                B7FF183CB7FF183CB7FF183CB7FF063485FF063485FF063485FF063485FF0634
                85FF183CB7FF183CB7FF183CB7FF183CB7FF0000002200000000000000003669
                DCFF386FDEFF386FDEFF386FDEFF063485FF1B54ABFF1B54ABFF1B54ABFF0634
                85FF386EDEFF386EDEFF3669DCFF3669DCFF0000000000000000000000000000
                00008F8F91FFD3D2D2FFD3D2D2FF063485FF1B54ABFF1B54ABFF1B54ABFF0634
                85FFD3D2D2FFD3D2D2FF8F8F91FF000000000000000000000000000000000000
                00008F8F91FFD3D2D2FFD3D2D2FF063485FF1B54ABFF1B54ABFF1B54ABFF0634
                85FFD3D2D2FFD3D2D2FF8F8F91FF000000000000000000000000000000000000
                00008F8F91FFD3D2D2FFD3D2D2FF063485FF2464B8FF2464B8FF2464B8FF0634
                85FFD3D2D2FFD3D2D2FF8F8F91FF000000000000000000000000000000000000
                00008F8F91FFD3D2D2FFD3D2D2FF063485FF063485FF063485FF063485FF0634
                85FFD3D2D2FFDADADAFF8F8F91FF000000000000000000000000030609094981
                E2FF8F8F91FFCECECEFFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFDADA
                DAFFDADADAFFCECECEFF8F8F91FF4B84E3FF13233D440000000000000000264A
                CBFF4981E2FFA2A2A4FFCECECEFFDADADAFF164CA4FF164CA4FF164CA4FFDADA
                DAFFCECECEFFA2A2A4FF4981E2FF1A35C0FF060B181C0000000000000000264A
                CBFF3663DAFF508DE9FFA2A2A4FFCECECEFF164CA4FFF1B288FF164CA4FFCECE
                CEFFA2A2A4FF4D88E6FF1A35C0FF1A35C0FF0000000000000000000000000F1A
                424F264ACBFF3663DAFF589CF2FFA2A2A4FF164CA4FF063485FF164CA4FFA2A2
                A4FF589CF2FF1A35C0FF1A35C0FF182B6A800000000000000000000000000000
                00000F1C4553264ACBFF3663DAFF589CF2FFA2A2A4FFCECECEFFA2A2A4FF589C
                F2FF1A35C0FF1A35C0FF192D7188000000000000000000000000000000000000
                0000000000000F1B4350264ACBFF3663DAFF589CF2FFA2A2A4FF589CF2FF1A35
                C0FF1A35C0FF8F8F91FF00000000000000000000000000000000000000000000
                000000000000000000000E1A414E264ACBFF3663DAFF589CF2FF1A35C0FF1A35
                C0FF8F8F91FF8F8F91FF00000000000000000000000000000000000000000000
                00000000000000000000000000000E193E4B264ACBFF3663DAFF1A35C0FF060C
                2A388F8F91FF8F8F91FF00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000D183C48264ACBFF1B3078900000
                0000000000000000000000000000000000000000000000000000}
            end
          end
        end
        object pnOsnov: TPanel
          Left = 0
          Top = 63
          Width = 962
          Height = 61
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            962
            61)
          object Label6: TLabel
            Left = 12
            Top = 8
            Width = 289
            Height = 16
            Anchors = [akLeft]
            Caption = #1046#1080#1083#1086#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1077' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1077#1085#1086' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
          end
          object Label18: TLabel
            Left = 692
            Top = 8
            Width = 13
            Height = 16
            Caption = #1086#1090
          end
          object Label48: TLabel
            Left = 573
            Top = 38
            Width = 15
            Height = 16
            Caption = #8470
          end
          object edOSNOV_ID: TDBComboBoxEh
            Left = 312
            Top = 4
            Width = 368
            Height = 24
            DataField = 'OSNOV_ID'
            DataSource = dsDokument
            DropDownBox.Rows = 15
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
          object edDate_Osnov: TDBDateTimeEditEh
            Left = 716
            Top = 4
            Width = 115
            Height = 24
            DataField = 'OSNOV_DATE'
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
            EditFormat = 'DD/MM/YYYY      '
          end
          object edDogovor: TDBEditEh
            Left = 13
            Top = 33
            Width = 540
            Height = 24
            Anchors = [akLeft]
            DataField = 'DOGOVOR'
            DataSource = dsDokument
            EditButtons = <
              item
                Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
                Style = ebsEllipsisEh
                OnClick = edDogovorEditButtons0Click
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
          object edNomer_Osnov: TDBEditEh
            Left = 596
            Top = 33
            Width = 112
            Height = 24
            DataField = 'OSNOV_NOMER'
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
        end
        object pnRekv: TPanel
          Left = 0
          Top = 32
          Width = 962
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 12
            Top = 6
            Width = 53
            Height = 16
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object Label7: TLabel
            Left = 296
            Top = 6
            Width = 128
            Height = 16
            Caption = #1053#1086#1084#1077#1088' '#1072#1073#1086#1085#1077#1085#1090#1072' ('#1075#1072#1079')'
          end
          object edTelefon: TDBEditEh
            Left = 78
            Top = 2
            Width = 161
            Height = 24
            DataField = 'TELEFON'
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
          end
          object edAbonentGAZ: TDBEditEh
            Left = 435
            Top = 2
            Width = 88
            Height = 24
            DataField = 'ABONENT_GAZ'
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
          object N_F_cbMNS_LPX: TDBCheckBoxEh
            Left = 555
            Top = 6
            Width = 166
            Height = 17
            Caption = #1074#1099#1075#1088#1091#1078#1072#1090#1100' '#1074' '#1052#1080#1085#1090#1088#1091#1076#1072
            DataField = 'MNS_LPX'
            DataSource = dsDokument
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object tsHouse: TTabSheet
        Caption = #1044#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 3
        ParentFont = False
        object sbDom: TScrollBox
          Left = 0
          Top = 0
          Width = 624
          Height = 521
          HorzScrollBar.Visible = False
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = True
          ParentFont = False
          TabOrder = 0
          OnResize = sbDomResize
        end
        object Panel4: TPanel
          Left = 624
          Top = 0
          Width = 338
          Height = 521
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Label2: TLabel
            Left = 13
            Top = 73
            Width = 141
            Height = 16
            Caption = #1053#1072#1093#1086#1076#1080#1090#1089#1103' '#1074' '#1074#1077#1076#1077#1085#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 13
            Top = 116
            Width = 200
            Height = 16
            Caption = #1054#1089#1091#1097#1077#1089#1090#1074#1083#1103#1077#1090' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 59
            Top = 260
            Width = 116
            Height = 16
            Caption = #1101#1090#1072#1078#1085#1086#1075#1086' '#1079#1076#1072#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 13
            Top = 285
            Width = 170
            Height = 16
            Caption = #1047#1072#1085#1080#1084#1072#1077#1084#1072#1103' '#1095#1072#1089#1090#1100'('#1076#1086#1083#1103')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 13
            Top = 48
            Width = 104
            Height = 16
            Caption = #1059#1095#1077#1090#1085#1099#1081' '#1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPredst: TDBLookupComboboxEh
            Left = 13
            Top = 181
            Width = 309
            Height = 24
            DataField = 'PREDST'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dsPredst
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edEtag: TDBNumberEditEh
            Left = 13
            Top = 228
            Width = 32
            Height = 24
            DataField = 'ETAG'
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
          object edKol_Etag: TDBNumberEditEh
            Left = 13
            Top = 256
            Width = 32
            Height = 24
            DataField = 'KOL_ETAG'
            DataSource = dsDokument
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object N_F_cbPrivateSect: TDBCheckBoxEh
            Left = 161
            Top = 230
            Width = 146
            Height = 17
            Caption = #1063#1072#1089#1090#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
            DataField = 'PRIVATE_SECT'
            DataSource = dsDokument
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
            OnClick = N_F_cbOwnHouseClick
          end
          object edControlHouse: TDBComboBoxEh
            Left = 13
            Top = 91
            Width = 309
            Height = 24
            Hint = #1053#1072#1093#1086#1076#1080#1090#1089#1103' '#1074' '#1074#1077#1076#1077#1085#1080#1080', '#1093#1086#1079#1103#1081#1089#1090#1074#1077#1085#1085#1086#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1080
            DataField = 'CONTROL'
            DataSource = dsDokument
            EditButton.Width = 16
            EditButtons = <
              item
                Glyph.Data = {
                  C6000000424DC60000000000000076000000280000000A0000000A0000000100
                  0400000000005000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                  0000008888880800000080088880080000008000880088000000880000088800
                  0000888000888800000088000008880000008000880088000000800888800800
                  00008088888888000000}
                Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1079' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
                Style = ebsGlyphEh
                Width = 16
              end
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000008000
                  00000080000080800000000080008000800000808000C0C0C00080808000FF00
                  000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
                  8888888888888888888888808888808888888880880008888888888800FF0888
                  8888888880F000888888888800FFFF0888888880000FFF088888888000FFFFF0
                  8888888000FFF008888888800000FF0888888880000000F08888888800000000
                  8888888880000088888888888888888888888888888888888888}
                Hint = #1042' '#1095#1072#1089#1090#1085#1086#1081' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
                Style = ebsGlyphEh
                Width = 16
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Visible = True
            OnUpdateData = edControlHouseUpdateData
          end
          object edUseGilfond: TDBComboBoxEh
            Left = 13
            Top = 134
            Width = 309
            Height = 24
            Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1103#1102#1097#1072#1103' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
            DataField = 'USE_GILFOND'
            DataSource = dsDokument
            EditButton.Width = 16
            EditButtons = <
              item
                Glyph.Data = {
                  C6000000424DC60000000000000076000000280000000A0000000A0000000100
                  0400000000005000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
                  0000008888880800000080088880080000008000880088000000880000088800
                  0000888000888800000088000008880000008000880088000000800888800800
                  00008088888888000000}
                Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1079' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
                Style = ebsGlyphEh
                Width = 16
              end
              item
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000008000
                  00000080000080800000000080008000800000808000C0C0C00080808000FF00
                  000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
                  8888888888888888888888808888808888888880880008888888888800FF0888
                  8888888880F000888888888800FFFF0888888880000FFF088888888000FFFFF0
                  8888888000FFF008888888800000FF0888888880000000F08888888800000000
                  8888888880000088888888888888888888888888888888888888}
                Hint = #1042' '#1095#1072#1089#1090#1085#1086#1081' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
                Style = ebsGlyphEh
                Visible = False
                Width = 16
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edPloshZanim: TDBNumberEditEh
            Left = 144
            Top = 331
            Width = 59
            Height = 24
            DataField = 'PL_ZANIM'
            DataSource = dsDokument
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
          object edKomnZanim: TDBNumberEditEh
            Left = 144
            Top = 358
            Width = 40
            Height = 24
            DataField = 'KOM_ZANIM'
            DataSource = dsDokument
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
          object edTailHouse: TDBEditEh
            Left = 144
            Top = 304
            Width = 156
            Height = 24
            DataField = 'TAIL_HOUSE'
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
          object StaticText4: TStaticText
            Left = 13
            Top = 161
            Width = 192
            Height = 20
            Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1086#1073#1086#1081' ('#1103#1074#1083#1103#1077#1090#1089#1103')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object StaticText5: TStaticText
            Left = 13
            Top = 207
            Width = 290
            Height = 17
            AutoSize = False
            Caption = #1055#1086#1084#1077#1097#1077#1085#1080#1077' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1086' '#1085#1072' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object StaticText6: TStaticText
            Left = 59
            Top = 230
            Width = 40
            Height = 20
            Caption = #1101#1090#1072#1078#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object StaticText11: TStaticText
            Left = 29
            Top = 307
            Width = 72
            Height = 20
            Caption = #1087#1086#1084#1077#1097#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object StaticText12: TStaticText
            Left = 29
            Top = 333
            Width = 99
            Height = 20
            Caption = #1078#1080#1083#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object StaticText9: TStaticText
            Left = 29
            Top = 360
            Width = 54
            Height = 20
            Caption = #1082#1086#1084#1085#1072#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object edPloshUch: TDBNumberEditEh
            Left = 142
            Top = 16
            Width = 98
            Height = 24
            DataField = 'PLOSH_UCH'
            DataSource = dsDokument
            DecimalPlaces = 4
            DisplayFormat = '### ##0.####'
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
          object StaticText1: TStaticText
            Left = 13
            Top = 20
            Width = 112
            Height = 17
            AutoSize = False
            Caption = #1055#1083#1086#1097#1072#1076#1100' '#1091#1095#1072#1089#1090#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 17
          end
          object edUchNomer: TDBEditEh
            Left = 142
            Top = 44
            Width = 183
            Height = 24
            DataField = 'UCH_NOMER'
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
        end
      end
      object tsAnimal: TTabSheet
        Caption = #1046#1080#1074#1086#1090#1085#1086#1074#1086#1076#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object sbAnimal: TScrollBox
          Left = 0
          Top = 0
          Width = 962
          Height = 521
          HorzScrollBar.Visible = False
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = True
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnResize = sbAnimalResize
          object btSetAutoSum: TBitBtn
            Left = 788
            Top = 16
            Width = 22
            Height = 20
            Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1072#1074#1090#1086#1089#1091#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1077#1084#1083#1080
            TabOrder = 0
            Visible = False
            OnClick = btSetAutoSumClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00E3591A00E3591A00E359
              1A00E3591A00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00E3591A00E3591A00E359
              1A00E3591A00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00BEBEBE00E3591A00E3591A00FF00FF00FF00FF00FF00
              FF00FF00FF00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00FF00FF00FF00
              FF00FF00FF00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00E3591A00E3591A00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00C2C2C200E3591A00E3591A00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00E3591A00E3591A00FF00FF00FF00FF00FF00
              FF00FF00FF00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00E3591A00E3591A00E359
              1A00E3591A00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00E3591A00E3591A00E3591A00E3591A00E3591A00E359
              1A00E3591A00E3591A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
        end
      end
      object tsLand: TTabSheet
        Caption = #1047#1077#1084#1083#1103
        ImageIndex = 2
        object sbZeml: TScrollBox
          Left = 0
          Top = 0
          Width = 962
          Height = 521
          HorzScrollBar.Visible = False
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = True
          ParentFont = False
          TabOrder = 0
          OnResize = sbZemlResize
        end
      end
      object tsNalogi: TTabSheet
        Caption = #1053#1072#1083#1086#1075#1080
        ImageIndex = 5
        object GridNalogi: TSasaDBGrid
          Left = 0
          Top = 0
          Width = 849
          Height = 521
          Align = alClient
          Ctl3D = True
          DataSource = dsNalogi
          DrawMemoText = True
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          ParentCtl3D = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          SumList.ExternalRecalc = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = GridNalogiDblClick
          OnGetCellParams = GridNalogiGetCellParams
          EnterDirection = mdNextGraph
          OptionsS = [dgsSelectCurrentColor]
          SelRowColor = clAqua
          Color1 = clBlack
          Color2 = clBlack
          TypeSave = 0
          Columns = <
            item
              EditButtons = <>
              FieldName = 'GOD'
              Footers = <>
              Title.Caption = #1043#1086#1076
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'NALOG_NAME'
              Footer.Value = #1057#1091#1084#1084#1072
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1053#1072#1083#1086#1075
              Width = 183
            end
            item
              EditButtons = <>
              FieldName = 'DATE_VIST'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
            end
            item
              EditButtons = <>
              FieldName = 'DATE_SROK'
              Footers = <>
              Title.Caption = #1057#1088#1086#1082' '#1086#1087#1083#1072#1090#1099
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'SUMMA_VIST'
              Footer.FieldName = 'SUMMA_VIST'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1072
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'SUMMA_OPL'
              Footer.FieldName = 'SUMMA_OPL'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1090#1072'|'#1057#1091#1084#1084#1072
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'DATE_OPL'
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1090#1072'|'#1044#1072#1090#1072
              Width = 81
            end
            item
              EditButtons = <>
              FieldName = 'NOMER_OPL'
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1090#1072'|'#1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'DELTA'
              Footer.FieldName = 'DELTA'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1048#1090#1086#1075
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'MEN_ID'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Visible = False
              Width = 205
              OnGetCellParams = GridNalogiColumns9GetCellParams
            end>
        end
        object Panel1: TPanel
          Left = 849
          Top = 0
          Width = 113
          Height = 521
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object btAddNalog: TBitBtn
            Left = 11
            Top = 21
            Width = 95
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            TabOrder = 0
            OnClick = btAddNalogClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F00FF0000FF0017AE177F7F7F7F7F7F7F7F7F7F7F7F
              A5A5A5A9A9A9AAAAAAAAAAAAAAAAAAA8A9A8A8A9A8A6AAA69FAA9F00FF0000FF
              0013B0137F7F7F7F7F7F7F7F7F00000000000000000080808000000000000000
              0200000700000D006F876F00FF0000FF000CB30C688A687F7F7F7F7F7F808080
              F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4F7F400FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF007F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4
              F7F400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF007F7F7F000000
              F8F8F8F8F8F88080808080808080807E807E7A827AE5F3E5D8F0D800FF0000FF
              000CB30C698B697F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F7
              F7F7F5F7F5F2F6F2E9F4E900FF0000FF0013B0137F7F7F7F7F7F7F7F7F808080
              00000000000000000080808000000000000000000080808000040000FF0000FF
              001BAD1B7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F5F7F50007009EAB9E7D897D7F7F7F7F7F7F7F7F7F000000
              F8F8F8808080808080808080808080808080808080808080F7F7F7000200A7A9
              A77F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F8F8F8000000AAAAAA7F7F7F7F7F7F7F7F7F7F7F7F808080
              000000000000000000000000000000808080000000808080000000000000A9A9
              A97F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F880808080808080808080
              8080808080F8F8F8F8F8F8000000A5A5A57F7F7F7F7F7F7F7F7F7F7F7F808080
              0000000000000000008080800000000000000000008080800000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F}
          end
          object btDeleteNalog: TBitBtn
            Left = 11
            Top = 94
            Width = 95
            Height = 25
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 1
            OnClick = btDeleteNalogClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              0200020205000303070004040A0007070F000909140014142C007F7F7F007F7F
              80007F7F83007F7F84007F7F88007F7F8C007F7F94005656B7005A5ABF000000
              FF007D7DCE006767DA007B7BD3007B7BD8007979DB007B7BE0007A7AE1007A7A
              E2007A7AE3008080800085858D0084848F0085858F0085859100858593008484
              940084849C009E9EBD00A5A5A500A6A6AE00A9A9A900A8A8AA00A8A8AB00AAAA
              AA00A5A5B100A1A1B400A1A1B600A2A2B600A1A1B8008888DE008888E2008181
              EC00C0C0C000E0E0F900E4E4F900E9E9F800EAEAF800ECECF800EDEDF800F1F1
              F800F4F4F800F5F5F800F7F7F800F8F8F8000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000009020
              940000000000E538F8000000AF00C821AF00000000006C2094008806AF002021
              9400952BF8002039F800FFFFFF003021940040B7FC007813AF00D021AF000000
              000091B6FC000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000D021AF0000000000000000000000
              0000000000000000000000000000BC1E940000ECFD00020000000000AF004500
              000000000A00D8B1F8003E00000001000000F4B5E800A0209400010101003823
              9400952BF8001836F800FFFFFF00AC21940008B6E800AC2194002FB6E8000000
              0000020000002823940001000000180000000000000090219400420000000000
              0000742194000000000000000000000000000C0000000200000001019400573E
              F80000ECFD00000000000200000046001A00D021AF007FFFFF0000000000D021
              AF0005000000A677E800D02194009AB6E8005401000000000000000000000000
              000002000000000000000000000010239400CF034B0098D0B100000000000000
              0000042394000200000080000000000000000001000098239400153AE100463A
              5C00726F6A006374730053656C006F7665005C646F0044656C00626D70008806
              A800C4229400952BF8002039F800FFFFFF00D422940040B7FC00D807A8004046
              B700000000004046B700153AE100F80D040000000000C0E8AE000000A8008022
              94004D73E100D304E2000000A800000000000700000000000000010000000022
              940007000000D304E200F8EBFD00000000004046B7003800000097B1FC000000
              A8000700000000229400952BF8000836F80001FFFF00F4229400442294000101
              01000C239400952BF8001836F800FFFFFF001C239400A80349000000A8000000
              00004046B7000000000064239400153AE10028000000F234F400010000003A09
              00000C00000000000000010000000F000000F61B460098D0B100080808080808
              190E0808080808081608080808080820111722211E1D0814110808082426282A
              111131232E2B2F110808080000000905071111131A0F11080808081B3D3D3C39
              3432111111112D1C080808003D3D3B383332321111102C1D080808003D3D0A0D
              151811111111301F080808003D3D3A3711111135361111120808081B0000020C
              1111060B03042511080808003D3D3C3B3A3A3B3C3D012708080808003D1B1B1B
              1B1B1B1B3D002908080808003D3D3D3D3D3D3D3D3D0029080808081B00000000
              001B001B00002608080808003D3D1B1B1B1B1B3D3D0024080808081B0000001B
              0000001B001B0808080808080808080808080808080808080808}
          end
          object btEditNalog: TBitBtn
            Left = 11
            Top = 57
            Width = 95
            Height = 25
            Caption = #1050#1086#1088#1088#1077#1082#1090'.'
            TabOrder = 2
            OnClick = btEditNalogClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000007F7F
              7F0080808000A5A5A500A9A9A900AAAAAA00F8F8F80000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000009020
              940000000000E538F8000000AF00C821AF00000000006C2094008806AF002021
              9400952BF8002039F800FFFFFF003021940040B7FC007813AF00D021AF000000
              000091B6FC000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000D021AF0000000000000000000000
              0000000000000000000000000000BC1E940000ECFD00020000000000AF004500
              000000000A00D8B1F8003800000001000000F4B5E800A0209400010101003823
              9400952BF8001836F800FFFFFF00AC21940008B6E800AC2194002FB6E800B700
              0000020000002823940001000000180000000000000090219400420000000000
              0000742194000000000000000000000000000C0000000200000001019400573E
              F80000ECFD00000000000300000040001A00D021AF007FFFFF0000000000D021
              AF0005000000A677E800D02194009AB6E800A001000000000000000000000000
              000002000000000000000000000010239400CF034B0078BAB200000000000000
              0000042394000200000080000000000000000001000098239400153AE100463A
              5C00726F6A006374730053656C006F7665005C646F002E626D00002294008806
              A800C4229400952BF8002039F800FFFFFF00D422940040B7FC00D807A800F0FC
              B10000000000F0FCB100153AE100F80D040000000000C0E8AE000000A8008022
              94004D73E100D304E2000000A800000000000700000000000000010000000022
              940007000000D304E200F8EBFD0000000000F0FCB1003800000097B1FC000000
              A8000700000000229400952BF8000836F80001FFFF00F4229400442294000101
              01000C239400952BF8001836F800FFFFFF001C239400A80349000000A8000000
              0000F0FCB1000000000064239400153AE10028000000F234F400010000009A09
              00000C00000000000000010000000F000000F61B460078BAB200010101010101
              0101010101010101010101010101010101010101010101010101010103040505
              0505050505040301010101000000020000000000020004010101010206060606
              0606060606020501010101000606060606060606060005010101010006060202
              0202020606000501010101000606060606060606060005010101010200000002
              0000000200000501010101000606060606060606060005010101010006020202
              0202020206000501010101000606060606060606060005010101010200000000
              0002000200000401010101000606020202020206060003010101010200000002
              0000000200020101010101010101010101010101010101010101}
          end
        end
      end
      object tsDokumets: TTabSheet
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
        ImageIndex = 6
        object GridDok: TSasaDBGrid
          Left = 0
          Top = 0
          Width = 849
          Height = 521
          Align = alClient
          Ctl3D = True
          DataSource = dsDokuments
          DrawMemoText = True
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          VertScrollBar.VisibleMode = sbNeverShowEh
          OnDblClick = GridDokDblClick
          EnterDirection = mdNextGraph
          OptionsS = [dgsSelectCurrentColor]
          SelRowColor = clAqua
          Color1 = clBlack
          Color2 = clBlack
          TypeSave = 0
          Columns = <
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'Date_Dok'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 87
            end
            item
              Alignment = taLeftJustify
              EditButtons = <>
              FieldName = 'TypeDok'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Width = 297
            end
            item
              Alignment = taRightJustify
              EditButtons = <>
              FieldName = 'Nomer'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'Komm'
              Footers = <>
              Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
              Width = 254
            end>
        end
        object Panel2: TPanel
          Left = 849
          Top = 0
          Width = 113
          Height = 521
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object btAddDok: TBitBtn
            Left = 11
            Top = 21
            Width = 95
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            TabOrder = 0
            OnClick = btAddDokClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F00FF0000FF0017AE177F7F7F7F7F7F7F7F7F7F7F7F
              A5A5A5A9A9A9AAAAAAAAAAAAAAAAAAA8A9A8A8A9A8A6AAA69FAA9F00FF0000FF
              0013B0137F7F7F7F7F7F7F7F7F00000000000000000080808000000000000000
              0200000700000D006F876F00FF0000FF000CB30C688A687F7F7F7F7F7F808080
              F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4F7F400FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF007F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4
              F7F400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF007F7F7F000000
              F8F8F8F8F8F88080808080808080807E807E7A827AE5F3E5D8F0D800FF0000FF
              000CB30C698B697F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F7
              F7F7F5F7F5F2F6F2E9F4E900FF0000FF0013B0137F7F7F7F7F7F7F7F7F808080
              00000000000000000080808000000000000000000080808000040000FF0000FF
              001BAD1B7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F5F7F50007009EAB9E7D897D7F7F7F7F7F7F7F7F7F000000
              F8F8F8808080808080808080808080808080808080808080F7F7F7000200A7A9
              A77F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F8F8F8000000AAAAAA7F7F7F7F7F7F7F7F7F7F7F7F808080
              000000000000000000000000000000808080000000808080000000000000A9A9
              A97F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F880808080808080808080
              8080808080F8F8F8F8F8F8000000A5A5A57F7F7F7F7F7F7F7F7F7F7F7F808080
              0000000000000000008080800000000000000000008080800000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F}
          end
          object btDelDok: TBitBtn
            Left = 11
            Top = 94
            Width = 95
            Height = 25
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 1
            OnClick = btDelDokClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              0200020205000303070004040A0007070F000909140014142C007F7F7F007F7F
              80007F7F83007F7F84007F7F88007F7F8C007F7F94005656B7005A5ABF000000
              FF007D7DCE006767DA007B7BD3007B7BD8007979DB007B7BE0007A7AE1007A7A
              E2007A7AE3008080800085858D0084848F0085858F0085859100858593008484
              940084849C009E9EBD00A5A5A500A6A6AE00A9A9A900A8A8AA00A8A8AB00AAAA
              AA00A5A5B100A1A1B400A1A1B600A2A2B600A1A1B8008888DE008888E2008181
              EC00C0C0C000E0E0F900E4E4F900E9E9F800EAEAF800ECECF800EDEDF800F1F1
              F800F4F4F800F5F5F800F7F7F800F8F8F8000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000009020
              940000000000E538F8000000AF00C821AF00000000006C2094008806AF002021
              9400952BF8002039F800FFFFFF003021940040B7FC007813AF00D021AF000000
              000091B6FC000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000D021AF0000000000000000000000
              0000000000000000000000000000BC1E940000ECFD00020000000000AF004500
              000000000A00D8B1F8003E00000001000000F4B5E800A0209400010101003823
              9400952BF8001836F800FFFFFF00AC21940008B6E800AC2194002FB6E8000000
              0000020000002823940001000000180000000000000090219400420000000000
              0000742194000000000000000000000000000C0000000200000001019400573E
              F80000ECFD00000000000200000046001A00D021AF007FFFFF0000000000D021
              AF0005000000A677E800D02194009AB6E8005401000000000000000000000000
              000002000000000000000000000010239400CF034B0098D0B100000000000000
              0000042394000200000080000000000000000001000098239400153AE100463A
              5C00726F6A006374730053656C006F7665005C646F0044656C00626D70008806
              A800C4229400952BF8002039F800FFFFFF00D422940040B7FC00D807A8004046
              B700000000004046B700153AE100F80D040000000000C0E8AE000000A8008022
              94004D73E100D304E2000000A800000000000700000000000000010000000022
              940007000000D304E200F8EBFD00000000004046B7003800000097B1FC000000
              A8000700000000229400952BF8000836F80001FFFF00F4229400442294000101
              01000C239400952BF8001836F800FFFFFF001C239400A80349000000A8000000
              00004046B7000000000064239400153AE10028000000F234F400010000003A09
              00000C00000000000000010000000F000000F61B460098D0B100080808080808
              190E0808080808081608080808080820111722211E1D0814110808082426282A
              111131232E2B2F110808080000000905071111131A0F11080808081B3D3D3C39
              3432111111112D1C080808003D3D3B383332321111102C1D080808003D3D0A0D
              151811111111301F080808003D3D3A3711111135361111120808081B0000020C
              1111060B03042511080808003D3D3C3B3A3A3B3C3D012708080808003D1B1B1B
              1B1B1B1B3D002908080808003D3D3D3D3D3D3D3D3D0029080808081B00000000
              001B001B00002608080808003D3D1B1B1B1B1B3D3D0024080808081B0000001B
              0000001B001B0808080808080808080808080808080808080808}
          end
          object btEditDok: TBitBtn
            Left = 11
            Top = 57
            Width = 95
            Height = 25
            Caption = #1050#1086#1088#1088#1077#1082#1090'.'
            TabOrder = 2
            OnClick = btEditDokClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000007F7F
              7F0080808000A5A5A500A9A9A900AAAAAA00F8F8F80000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000009020
              940000000000E538F8000000AF00C821AF00000000006C2094008806AF002021
              9400952BF8002039F800FFFFFF003021940040B7FC007813AF00D021AF000000
              000091B6FC000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000D021AF0000000000000000000000
              0000000000000000000000000000BC1E940000ECFD00020000000000AF004500
              000000000A00D8B1F8003800000001000000F4B5E800A0209400010101003823
              9400952BF8001836F800FFFFFF00AC21940008B6E800AC2194002FB6E800B700
              0000020000002823940001000000180000000000000090219400420000000000
              0000742194000000000000000000000000000C0000000200000001019400573E
              F80000ECFD00000000000300000040001A00D021AF007FFFFF0000000000D021
              AF0005000000A677E800D02194009AB6E800A001000000000000000000000000
              000002000000000000000000000010239400CF034B0078BAB200000000000000
              0000042394000200000080000000000000000001000098239400153AE100463A
              5C00726F6A006374730053656C006F7665005C646F002E626D00002294008806
              A800C4229400952BF8002039F800FFFFFF00D422940040B7FC00D807A800F0FC
              B10000000000F0FCB100153AE100F80D040000000000C0E8AE000000A8008022
              94004D73E100D304E2000000A800000000000700000000000000010000000022
              940007000000D304E200F8EBFD0000000000F0FCB1003800000097B1FC000000
              A8000700000000229400952BF8000836F80001FFFF00F4229400442294000101
              01000C239400952BF8001836F800FFFFFF001C239400A80349000000A8000000
              0000F0FCB1000000000064239400153AE10028000000F234F400010000009A09
              00000C00000000000000010000000F000000F61B460078BAB200010101010101
              0101010101010101010101010101010101010101010101010101010103040505
              0505050505040301010101000000020000000000020004010101010206060606
              0606060606020501010101000606060606060606060005010101010006060202
              0202020606000501010101000606060606060606060005010101010200000002
              0000000200000501010101000606060606060606060005010101010006020202
              0202020206000501010101000606060606060606060005010101010200000000
              0002000200000401010101000606020202020206060003010101010200000002
              0000000200020101010101010101010101010101010101010101}
          end
          object btIsvechNal: TBitBtn
            Left = 13
            Top = 164
            Width = 95
            Height = 25
            Hint = #1048#1079#1074#1077#1097#1077#1085#1080#1077' '#1087#1086' '#1085#1072#1083#1086#1075#1091' '#1085#1072' '#1085#1077#1076#1074#1080#1078#1080#1084#1086#1089#1090#1100' '#1080' '#1079#1077#1084#1077#1083#1100#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
            Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077
            TabOrder = 3
            OnClick = btIsvechNalClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000000000000000000000000000000000007F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F00FF0000FF0017AE177F7F7F7F7F7F7F7F7F7F7F7F
              A5A5A5A9A9A9AAAAAAAAAAAAAAAAAAA8A9A8A8A9A8A6AAA69FAA9F00FF0000FF
              0013B0137F7F7F7F7F7F7F7F7F00000000000000000080808000000000000000
              0200000700000D006F876F00FF0000FF000CB30C688A687F7F7F7F7F7F808080
              F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4F7F400FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF007F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F4
              F7F400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF007F7F7F000000
              F8F8F8F8F8F88080808080808080807E807E7A827AE5F3E5D8F0D800FF0000FF
              000CB30C698B697F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F7
              F7F7F5F7F5F2F6F2E9F4E900FF0000FF0013B0137F7F7F7F7F7F7F7F7F808080
              00000000000000000080808000000000000000000080808000040000FF0000FF
              001BAD1B7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F5F7F50007009EAB9E7D897D7F7F7F7F7F7F7F7F7F000000
              F8F8F8808080808080808080808080808080808080808080F7F7F7000200A7A9
              A77F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8F8F8F8F8F8F8000000AAAAAA7F7F7F7F7F7F7F7F7F7F7F7F808080
              000000000000000000000000000000808080000000808080000000000000A9A9
              A97F7F7F7F7F7F7F7F7F7F7F7F000000F8F8F8F8F8F880808080808080808080
              8080808080F8F8F8F8F8F8000000A5A5A57F7F7F7F7F7F7F7F7F7F7F7F808080
              0000000000000000008080800000000000000000008080800000008080807F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F}
          end
        end
      end
      object tsAdd: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 4
        object sbDop: TScrollBox
          Left = 0
          Top = 0
          Width = 962
          Height = 521
          Align = alClient
          BorderStyle = bsNone
          ParentBackground = True
          TabOrder = 0
          OnResize = sbDopResize
          object gbSozd: TGroupBox
            Left = 0
            Top = 129
            Width = 962
            Height = 50
            Align = alTop
            Caption = ' '#1057#1086#1079#1076#1072#1085#1080#1077' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label12: TLabel
              Left = 10
              Top = 24
              Width = 29
              Height = 16
              Caption = #1044#1072#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 199
              Top = 24
              Width = 50
              Height = 16
              Caption = #1055#1088#1080#1095#1080#1085#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 593
              Top = 24
              Width = 53
              Height = 16
              Caption = #1051#1080#1094'.'#1089#1095#1077#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edDateSozd: TDBDateTimeEditEh
              Left = 54
              Top = 18
              Width = 121
              Height = 24
              DataField = 'DATE_SOZD'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
            object edPrSozd: TDBLookupComboboxEh
              Left = 266
              Top = 18
              Width = 312
              Height = 24
              DataField = 'PRICH_SOZD'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = dsSprPrSozd
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
            object edTowNomerS: TDBEditEh
              Left = 661
              Top = 18
              Width = 57
              Height = 24
              DataField = 'NOMER_TWO_S'
              DataSource = dsDokument
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
          end
          object cbLikv: TGroupBox
            Left = 0
            Top = 179
            Width = 962
            Height = 47
            Align = alTop
            Caption = ' '#1051#1080#1082#1074#1080#1076#1072#1094#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label15: TLabel
              Left = 10
              Top = 21
              Width = 29
              Height = 16
              Caption = #1044#1072#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 199
              Top = 21
              Width = 50
              Height = 16
              Caption = #1055#1088#1080#1095#1080#1085#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 593
              Top = 21
              Width = 53
              Height = 16
              Caption = #1051#1080#1094'.'#1089#1095#1077#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edDateLikv: TDBDateTimeEditEh
              Left = 54
              Top = 15
              Width = 121
              Height = 24
              DataField = 'DATE_LIKV'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
            object edPrLikv: TDBLookupComboboxEh
              Left = 266
              Top = 15
              Width = 312
              Height = 24
              DataField = 'PRICH_LIKV'
              DataSource = dsDokument
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = dsSprPrLikv
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
            object edTwoNomerL: TDBEditEh
              Left = 661
              Top = 15
              Width = 57
              Height = 24
              DataField = 'NOMER_TWO_L'
              DataSource = dsDokument
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
          end
          object gbSobstv: TGroupBox
            Left = 0
            Top = 0
            Width = 962
            Height = 129
            Align = alTop
            Caption = ' '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object GridSobstv: TSasaDBGrid
              Left = 2
              Top = 15
              Width = 853
              Height = 112
              Align = alClient
              Ctl3D = True
              DataSource = dsHouseOwners
              DrawMemoText = True
              EditActions = [geaCopyEh, geaSelectAllEh]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'Tahoma'
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              UseMultiTitle = True
              VertScrollBar.VisibleMode = sbNeverShowEh
              OnGetCellParams = GridSobstvGetCellParams
              EnterDirection = mdNextGraph
              OptionsS = [dgsSelectCurrentColor]
              SelRowColor = clAqua
              Color1 = clBlack
              Color2 = clBlack
              TypeSave = 0
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'TYPEKOD'
                  Footers = <>
                  ImageList = ImageList
                  Title.Caption = #1058#1080#1087
                  Width = 24
                  OnGetCellParams = GridSobstvColumns0GetCellParams
                end
                item
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footers = <>
                  Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086' / '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
                  Width = 217
                end
                item
                  EditButtons = <>
                  FieldName = 'ADRES'
                  Footers = <>
                  Title.Caption = #1040#1076#1088#1077#1089
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = 'TAIL'
                  Footers = <>
                  Title.Caption = #1063#1072#1089#1090#1100' ('#1076#1086#1083#1103')'
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = 'DATES'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' c'
                  Width = 83
                end
                item
                  EditButtons = <>
                  FieldName = 'DATEP'
                  Footers = <>
                  Width = 83
                end>
            end
            object Panel3: TPanel
              Left = 855
              Top = 15
              Width = 105
              Height = 112
              Align = alRight
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object btAddSobstv: TBitBtn
                Left = 10
                Top = 4
                Width = 85
                Height = 25
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
                Caption = #1044#1086#1073#1072#1074#1080#1090#1100
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = btAddSobstvClick
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888888888888AA88888888888888AA88808888808888AA88808800088AAAA
                  AAAA800FF088AAAAAAAA880F0008888AA888800FFFF0888AA8880000FFF0888A
                  A888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                  8888800000000888888888000008888888888888888888888888}
              end
              object btDelSobstv: TBitBtn
                Left = 10
                Top = 70
                Width = 85
                Height = 25
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
                Caption = #1059#1076#1072#1083#1080#1090#1100
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btDelSobstvClick
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000008000
                  00000080000080800000000080008000800000808000C0C0C00080808000FF00
                  000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00777777777777
                  777777777C7777777C7777777CC77777C777077777CC777C77770770007CCCC7
                  7777700FF077CC777777770F000CCCC77777700FFCCC77CC77770000FCC07777
                  C777000FFFFF07777777000FFF007777777700000FF0777777770000000F0777
                  7777700000000777777777000007777777777777777777777777}
              end
              object btEditSobstv: TBitBtn
                Left = 10
                Top = 37
                Width = 85
                Height = 25
                Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1072
                Caption = #1050#1086#1088#1088#1077#1082#1090'.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnClick = btEditSobstvClick
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888888888888888888888888888880888880888888888088000888888
                  8888800FF08888888888880F000888888888800FFFF0888888880000FFF08888
                  8888000FFFFF08888888000FFF008888888800000FF0888888880000000F0888
                  8888800000000888888888000008888888888888888888888888}
              end
            end
          end
          object edNotStat: TDBCheckBoxEh
            Left = 4
            Top = 240
            Width = 275
            Height = 17
            Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1092#1086#1088#1084#1099' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
            DataField = 'NOT_STAT'
            DataSource = dsDokument
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = edNotStatClick
          end
        end
      end
    end
  end
  inherited StBar: TStatusBar
    Top = 643
    Width = 970
    Panels = <
      item
        Style = psOwnerDraw
        Text = 
          '<F2> '#1079#1072#1087#1080#1089#1072#1090#1100'  <F3> '#1086#1090#1084#1077#1090#1080#1090#1100' <F5> '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088'  <F6> '#1087#1077#1095#1072#1090#1100'   <C' +
          'trl-F2> '#1074#1099#1093#1086#1076
        Width = 50
      end>
  end
  inherited dsDokument: TDataSource
    Left = 320
    Top = 226
  end
  inherited dsObl: TDataSource
    Left = 432
    Top = 226
  end
  inherited dsRN: TDataSource
    Left = 368
    Top = 226
  end
  inherited dsGorod: TDataSource
    Left = 440
    Top = 202
  end
  inherited dsStran: TDataSource
    Left = 388
    Top = 369
  end
  inherited dsTypeGorod: TDataSource
    Left = 400
    Top = 402
  end
  object dsMens: TDataSource
    DataSet = dmMen.mtDokument
    OnDataChange = dsMensDataChange
    Left = 352
    Top = 319
  end
  object dsDopProp: TDataSource
    DataSet = dmLichSchet.tbDopProp
    OnDataChange = dsDopPropDataChange
    Left = 300
    Top = 313
  end
  object dsPriznak: TDataSource
    DataSet = dmLichSchet.tbPriznaki
    OnDataChange = dsMensDataChange
    Left = 492
    Top = 442
  end
  object dsSprTypeHouse: TDataSource
    DataSet = dmBase.SprTypeHouse
    Left = 348
    Top = 362
  end
  object dsSprPrSozd: TDataSource
    DataSet = dmBase.SprPrSozd
    Left = 388
    Top = 314
  end
  object dsSprPrLikv: TDataSource
    DataSet = dmBase.SprPrLikv
    Left = 340
    Top = 259
  end
  object dsNalogi: TDataSource
    OnDataChange = dsNalogiDataChange
    Left = 228
    Top = 346
  end
  object dsDokuments: TDataSource
    DataSet = dmLichSchet.tbDokumens
    Left = 444
    Top = 314
  end
  object dsPredst: TDataSource
    DataSet = dmBase.SprPredst
    Left = 716
    Top = 73
  end
  object ImageList: TImageList
    Left = 284
    Top = 346
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000008482040084820400848204008482
      0400848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008482040084820400848204008482
      0400848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848204008482040084820400848204008482
      0400848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000848204008482040084820400848204008482
      0400848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084820400848204008482040084820400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000084820400848204008482040084820400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FC020400FC020400FC020400FC020400FC020400848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000402FC000402FC000402FC000402FC000402FC00848204008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FC020400FC020400FC020400FC020400FC020400FC020400FC0204008482
      0400848204008482040084820400000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      8000008080000080800000808000000000000000000000000000000000000000
      00000402FC000402FC000402FC000402FC000402FC000402FC000402FC008482
      0400848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FC020400FC020400FC020400FC020400FC020400FC020400FC020400FC02
      04008482040084820400848204000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000080800000808000000000000000000000000000000000000402
      FC000402FC000402FC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204008482040084820400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FC020400FC020400FC020400FC020400FC020400FC020400FC020400FC02
      04008482040084820400000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000080800000000000000000000000000000000000000000000402
      FC000402FC000402FC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204008482040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FCFEFC00FCFEFC00FC020400FC020400FC020400FC020400FC020400FC02
      04008482040000000000000000000000000000000000000000000000000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      0000008080000000000000000000000000000000000000000000000000000402
      FC00FCFEFC00FCFEFC000402FC000402FC000402FC000402FC000402FC000402
      FC00848204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FC02
      0400FCFEFC00FCFEFC00FC020400FC020400FC020400FC020400FC020400FC02
      04000000000000000000000000000000000000000000000000000000000000FF
      0000FFFFFF00FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000402
      FC00FCFEFC00FCFEFC000402FC000402FC000402FC000402FC000402FC000402
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FC020400FC020400FC020400FC020400FC020400FC020400FC0204000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000402FC000402FC000402FC000402FC000402FC000402FC000402FC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FC020400FC020400FC020400FC020400FC020400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402FC000402FC000402FC000402FC000402FC00000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FF07FF07FF070000FE03FE03FE030000FC01FC01FC010000F801F801F8010000
      F001F001F0010000E001E001E0010000E003E003E0030000E007E007E0070000
      E00FE00FE00F0000F01FF01FF01F0000F83FF83FF83F0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object dsHouseOwners: TDataSource
    DataSet = dmLichSchet.tbHouseOwners
    Left = 412
    Top = 347
  end
end
