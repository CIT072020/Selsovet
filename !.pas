-----------------------------------------------------
���, ����� �������� ��������� ����� ����������������, ��������� ��������� ���:

1)
Perform(WM_SETREDRAW, 0, 0);

... �, ����� ������������ � ����������� ���������: 

Perform(WM_SETREDRAW, 1, 0);
Refresh;

2)
LockWindowUpdate(Memo1.Handle); 
...
...
LockWindowUpdate(0);


-----------------------------------------------------

��������� ������� �� ������� ����  
procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;  var Handled: Boolean);
begin
  Handled := (msg.wParam = vk_lButton) or
             (msg.wParam = vk_rButton) or
             (msg.wParam = vk_mButton);
end;

--------------------------------------------------------------------------------
��� ��������� ������ ����  

//���������� �������
procedure TForm1.Button1Click(Sender: TObject);
var
  CState: Integer;
begin
  CState := ShowCursor(True);
  while Cstate >= 0 do
    Cstate := ShowCursor(False);
end;

//��������� �������
procedure TForm1.Button2Click(Sender: TObject);
var
  Cstate: Integer;
begin
  Cstate := ShowCursor(True);
  while CState < 0 do
    CState := ShowCursor(True);
end;

 
 
 
