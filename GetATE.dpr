program GetATE;

uses
  Forms,
  fMainGetATE in 'fMainGetATE.pas' {fmMainGetATE};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ภาล';
  Application.CreateForm(TfmMainGetATE, fmMainGetATE);
  Application.Run;
end.
