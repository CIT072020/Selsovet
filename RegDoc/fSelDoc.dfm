object fmSelDoc: TfmSelDoc
  Left = 405
  Top = 198
  ActiveControl = dgSelDoc
  AutoScroll = False
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
  ClientHeight = 352
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    729
    352)
  PixelsPerInch = 96
  TextHeight = 13
  object btCancel: TButton
    Left = 646
    Top = 322
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object btOk: TButton
    Left = 558
    Top = 322
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 2
  end
  object dgSelDoc: TDBGridEh
    Left = 8
    Top = 128
    Width = 712
    Height = 187
    AllowedOperations = []
    Anchors = [akLeft, akTop, akBottom]
    Ctl3D = True
    DataSource = dsoSelDoc
    DrawMemoText = True
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    VTitleMargin = 5
    OnDblClick = dgSelDocDblClick
  end
  object gbFilter: TGroupBox
    Left = 8
    Top = 7
    Width = 712
    Height = 111
    Caption = ' '#1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1103': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object laSignName: TLabel
      Left = 8
      Top = 26
      Width = 54
      Height = 13
      Caption = #1047#1072#1103#1074#1080#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object laSubjId: TLabel
      Left = 8
      Top = 54
      Width = 48
      Height = 13
      Caption = #1058#1077#1084#1072#1090#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object laYear: TLabel
      Left = 8
      Top = 82
      Width = 19
      Height = 13
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object laGroup: TLabel
      Left = 204
      Top = 82
      Width = 36
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chbShowAllSubj: TCheckBox
      Left = 542
      Top = 52
      Width = 132
      Height = 17
      Caption = #1087#1086' '#1074#1089#1077#1084' '#1090#1077#1084#1072#1090#1080#1082#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = OnFilterChange
    end
    object chbShowAllDoc: TCheckBox
      Left = 542
      Top = 24
      Width = 132
      Height = 17
      Caption = #1087#1086' '#1074#1089#1077#1084' '#1079#1072#1103#1074#1080#1090#1077#1083#1103#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = OnFilterChange
    end
    object dlSubjId: TDBLookupComboboxEh
      Left = 80
      Top = 50
      Width = 451
      Height = 21
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
          OnClick = dlSubjIdEditButtons0Click
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object dlSignName: TDBLookupComboboxEh
      Left = 80
      Top = 22
      Width = 451
      Height = 21
      DropDownBox.Width = 347
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'NAME'
      ListField = 'NAME'
      ListSource = dsoSignName
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object dcYear: TDBComboBoxEh
      Left = 80
      Top = 78
      Width = 97
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object dcGroup: TDBComboBoxEh
      Left = 272
      Top = 78
      Width = 259
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
  end
  object dsoSelDoc: TDataSource
    Left = 168
    Top = 144
  end
  object dsoSignName: TDataSource
    Left = 264
    Top = 144
  end
end
