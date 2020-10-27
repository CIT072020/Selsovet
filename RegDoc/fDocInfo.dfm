object fmDocInfo: TfmDocInfo
  Left = 246
  Top = 172
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 233
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    500
    233)
  PixelsPerInch = 96
  TextHeight = 13
  object btClose: TButton
    Left = 416
    Top = 203
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 2
    TabOrder = 0
  end
  object gbDocInfo: TGroupBox
    Left = 10
    Top = 10
    Width = 482
    Height = 178
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#1058#1077#1082#1091#1097#1077#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1087#1086' '#1086#1073#1088#1072#1097#1077#1085#1080#1103#1084' '#1075#1088#1072#1078#1076#1072#1085': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object paDocInfo: TPanel
      Left = 2
      Top = 15
      Width = 478
      Height = 161
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 10
      TabOrder = 0
      object dgInfo: TDBGridEh
        Left = 10
        Top = 10
        Width = 458
        Height = 141
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = dsoInfo
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
        HorzScrollBar.Visible = False
        Options = [dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghClearSelection]
        ParentFont = False
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
            FieldName = 'Name'
            Footers = <>
            Width = 430
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Value'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Footers = <>
            Width = 40
            OnGetCellParams = dgInfoColumns1GetCellParams
          end>
      end
    end
  end
  object dsoInfo: TDataSource
    Left = 8
    Top = 152
  end
end
