unit fCallBackQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, AdsTable;

type
  TfmCallBackQuery = class(TForm)
    Button1: TButton;
    pb: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCancel : Boolean;
    FQuery  : TAdsQuery;
  end;

  procedure RegisterCallback(Query : TAdsQuery; nID : LongInt=1);
  function IsCloseCallback : Boolean;
  procedure ClearCallback;

implementation

var
  fmCallBackQuery: TfmCallBackQuery;

{$R *.DFM}

function IsCloseCallback : Boolean;
begin
  Result := fmCallBackQuery.FCancel;
end;

function CallBackOpenQuery( nProc : Word; iCallBackID : LongInt) : LongInt; stdcall;
begin
  Result := 0;
  fmCallBackQuery.pb.Position := nProc;
  Application.ProcessMessages;
  if fmCallBackQuery.FCancel then begin
    Result := 1;
  end;
end;

procedure RegisterCallback(Query : TAdsQuery; nID : LongInt);
begin
  fmCallBackQuery := TfmCallBackQuery.Create(nil);
  fmCallBackQuery.pb.Position:=0;
  fmCallBackQuery.FQuery := Query;
  fmCallBackQuery.Show;
  Query.AdsRegisterCallbackFunction(@CallBackOpenQuery,nID);
end;

procedure ClearCallback;
begin
  fmCallBackQuery.Close;
  fmCallBackQuery.FQuery.AdsClearCallbackFunction;
  FreeAndNil(fmCallBackQuery);
end;

procedure TfmCallBackQuery.Button1Click(Sender: TObject);
begin
  FCancel := true;
//
end;

procedure TfmCallBackQuery.FormCreate(Sender: TObject);
begin
  FCancel := false;
end;

initialization
  fmCallBackQuery:=nil;

end.
