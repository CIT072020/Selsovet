program GetATE;

uses
  Forms,
  fMainGetATE in 'fMainGetATE.pas' {fmMainGetATE};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '���';
  Application.CreateForm(TfmMainGetATE, fmMainGetATE);
  Application.Run;
end.
