-----------------------------------------------------
Так, чтобы временно запретить форме перерисовываться, необходим следующий код:

1)
Perform(WM_SETREDRAW, 0, 0);

... и, чтобы возвратиться к нормальному состоянию: 

Perform(WM_SETREDRAW, 1, 0);
Refresh;

2)
LockWindowUpdate(Memo1.Handle); 
...
...
LockWindowUpdate(0);


-----------------------------------------------------

Отключить реакцию на события мыши  
procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;  var Handled: Boolean);
begin
  Handled := (msg.wParam = vk_lButton) or
             (msg.wParam = vk_rButton) or
             (msg.wParam = vk_mButton);
end;

--------------------------------------------------------------------------------
Как отключить курсор мыши  

//Выключение курсора
procedure TForm1.Button1Click(Sender: TObject);
var
  CState: Integer;
begin
  CState := ShowCursor(True);
  while Cstate >= 0 do
    Cstate := ShowCursor(False);
end;

//Включение курсора
procedure TForm1.Button2Click(Sender: TObject);
var
  Cstate: Integer;
begin
  Cstate := ShowCursor(True);
  while CState < 0 do
    CState := ShowCursor(True);
end;

 
 
 
