object fmRekvOtec: TfmRekvOtec
  Left = 321
  Top = 216
  BorderStyle = bsDialog
  Caption = '��������� ���� ��� ������ � �������'
  ClientHeight = 188
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 147
    Width = 363
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btOk: TBitBtn
      Left = 141
      Top = 8
      Width = 91
      Height = 25
      Caption = '��������'
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 253
      Top = 8
      Width = 91
      Height = 25
      Caption = '�����'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object cb: TCheckListBox
    Left = 0
    Top = 0
    Width = 363
    Height = 147
    Align = alClient
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 20
    Items.Strings = (
      '15. �������'
      '16. ���'
      '17. ��������'
      '18. ���� ��������'
      '19. ��������������'
      '22. ����� ����������� ����������')
    ParentFont = False
    TabOrder = 1
  end
end
