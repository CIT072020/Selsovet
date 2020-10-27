object fmPropHouse: TfmPropHouse
  Left = 506
  Top = 202
  Width = 300
  Height = 350
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = #1055#1088#1080#1079#1085#1072#1082#1080' '#1072#1076#1088#1077#1089#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sp: TSplitter
    Left = 0
    Top = 105
    Width = 284
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 284
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 41
    TabOrder = 0
    DesignSize = (
      284
      41)
    object btOk: TBitBtn
      Left = 79
      Top = 8
      Width = 90
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = btOkClick
      Kind = bkOK
    end
    object btCancel: TBitBtn
      Left = 188
      Top = 8
      Width = 90
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object gbConst: TGroupBox
    Left = 0
    Top = 0
    Width = 284
    Height = 105
    Align = alTop
    Caption = ' '#1055#1086#1089#1090#1086#1103#1085#1085#1099#1077' '#1087#1088#1080#1079#1085#1072#1082#1080' '
    Constraints.MinHeight = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      284
      105)
    object lbConst: TListBox
      Left = 5
      Top = 12
      Width = 282
      Height = 88
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 110
    Width = 284
    Height = 161
    Align = alClient
    Caption = ' '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1087#1088#1080#1079#1085#1072#1082#1080' '
    Constraints.MinHeight = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      284
      161)
    object Grid: TDBGridEh
      Left = 5
      Top = 13
      Width = 250
      Height = 154
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
      DataSource = DataSource
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
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Width = 262
        end>
    end
    object Panel2: TPanel
      Left = 249
      Top = 15
      Width = 33
      Height = 144
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        33
        144)
      object sbAdd: TSpeedButton
        Left = 5
        Top = 4
        Width = 24
        Height = 24
        Anchors = [akTop]
        OnClick = sbAddClick
      end
      object sbDel: TSpeedButton
        Left = 5
        Top = 32
        Width = 24
        Height = 24
        Anchors = [akTop]
        OnClick = sbDelClick
      end
    end
  end
  object DataSource: TDataSource
    Left = 40
    Top = 160
  end
end
