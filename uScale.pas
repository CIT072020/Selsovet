
{  ��������  ���������  ���.  ��  ������������  ���  ������ �����, ���
� ������ �������. ������� ��� � Form.FormCreate. ������� ��� �������. }

unit uScale;

interface

uses Forms, Controls;

procedure RunAutoScale(MForm: TForm);

implementation

Type
 TFooClass = class(TControl); { ���������� �������� ������������ }

{ �������� Font }


procedure RunAutoScale(MForm: TForm);
const
  cScreenWidth :integer = 1024; //800;
  cScreenHeight:integer = 768; //600;
  cPixelsPerInch:integer= 96;
  cFontHeight:integer   = -11;  {� ������ �������������� �������� �� Font.Height}
var
  i: integer;
begin
{
�����!! : ���������� � ���������� �������� �������� Scaled TForm � FALSE.
��������� ��������� ������������ ����� ���, ����� ��� ��������� ���������
�������������� �� ������� ������ � �������� �� ����. ������������� ����
������� ���� ���������, ���������� �� ������ ������ �� ����� ����������
�� ������� �� ����� ��������������. ���� ��, Scaled ��������������� � True
� ���������� ����� �������������� ���, ����� ��� ���������� � ��� ��
������� ������, ��� � �� ����� ��������������.
}
if (Screen.width <> cScreenWidth)or(Screen.PixelsPerInch <> cPixelsPerInch) then
begin
MForm.scaled := TRUE;
MForm.height := MForm.height * screen.Height DIV cScreenHeight;
MForm.width  := MForm.width  * screen.width DIV cScreenWidth;
MForm.ScaleBy(screen.width, cScreenWidth);


end;


{
���� ��� ���������, ���������� �� ������ ������ �� ����� ���������� ��
������� �� ����� ��������������. ���� �� ����� ���������� pixelsperinch
����� ���������� �� pixelsperinch �� ����� ��������������, ������ �����
�������������� ���, ����� ����� �� ���������� �� ���, ������� ���� ��
����� ����������. ��������������� ������������ ������ �� ������������,
����������� ����� ������� �������� font.height �� ����� ��������������
�� font.height �� ����� ����������. Font.size � ���� ������ �������� ��
�����, ��� ��� ��� ����� ���� ��������� �������, ��� ������� �������
�����������, ��� ���� ����� ����� ��������� �� ��������� ������� ����������.
��������, ����� ������� ��� �������� ������ 800x600 � ��������������
���������� ��������, �������� ������ font.size = 8. ����� �� ����������
� ������� � 800x600 � �������� ��������, font.size ����� ����� ����� 8,
�� ����� ����� ������� ��� ��� ������ � ������� � ���������� ��������.
������ ��������������� ��������� ����� ���� � ��� �� ������ �������
��� ��������� ���������� �������.
}


if (Screen.PixelsPerInch <> cPixelsPerInch) then
begin


for i := MForm.ControlCount - 1 downto 0 do
TFooClass(MForm.Controls[i]).Font.Height :=
(MForm.Font.Height div cFontHeight) *
TFooClass(MForm.Controls[i]).Font.Height;


end;

end;

end.  
