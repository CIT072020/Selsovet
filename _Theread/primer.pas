// стать€:  http://www.kansoftware.ru/?tid=5388	


TMyTread = class(TThread)
private
  FHandles: array[0..1] of THandle;
protected
  procedure Execute; override;
public
  constructor Create;
  destructor Destroy; override;
  procudure Pause;
  procudure UnPause;
  procudure Stop;
end;

constructor TMyThread.Create;
begin
  inherited Create(False);
  FHandles[0] := CreateEvent(nil, False, False, nil);  // ”правление завершением потока
  FHandles[1] := CreateEvent(nil, True, True, nil);  // ”правление паузой
  FreeOnTerminate := True;
end;

destructor TMyThread.Destroy;
begin
  CloseHandle(FHandles[1]);
  CloseHandle(FHandles[0]);
  inherited Destroy;
end;

procedure TMyThread.Execute;
begin
  while not Terminated do begin
    case WaitForMultipleObjects(2, @FHandles[0], False, INFINITE) do
      WAIT_FAILED: RaiseLastOsError;
      WAIT_OBJECT_0: Terminate;
      WAIT_OBJECT_0 + 1: begin
        // “ут выполн€ем полезную работу
      end;
  end;
end;

procedure TMyThread.Pause;
begin
  ResetEvent(FHandles[1]);
end;

procedure TMyThread.UnPause;
begin
  SetEvent(FHandles[1]);
end;

procedure TMyThread.Stop;
begin
  SetEvent(FHandles[0]);
end;




