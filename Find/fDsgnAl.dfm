object fmDsgnAlign: TfmDsgnAlign
  Left = 234
  Top = 158
  BorderStyle = bsDialog
  Caption = '������������'
  ClientHeight = 176
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btOk: TButton
    Left = 229
    Top = 147
    Width = 75
    Height = 23
    Caption = '��'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 313
    Top = 147
    Width = 75
    Height = 23
    Cancel = True
    Caption = '������'
    ModalResult = 2
    TabOrder = 1
  end
  object rgHorz: TRadioGroup
    Left = 6
    Top = 6
    Width = 186
    Height = 132
    Caption = ' ��������������: '
    ItemIndex = 0
    Items.Strings = (
      '�� ��������'
      '�� ������ ����'
      '�� ������'
      '�� ������� ����'
      '����� ������ ����������')
    TabOrder = 2
  end
  object rgVert: TRadioGroup
    Left = 203
    Top = 6
    Width = 186
    Height = 132
    Caption = ' ������������: '
    ItemIndex = 0
    Items.Strings = (
      '�� ��������'
      '�� �������� ����'
      '�� ������'
      '�� ������� ����'
      '����� ������ ����������')
    TabOrder = 3
  end
end
