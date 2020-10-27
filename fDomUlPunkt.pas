unit fDomUlPunkt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, uFunc, fMain, TB2Item, TB2Dock, TB2Toolbar;

type
  TfmDomUlPunkt = class(TForm)
    cbDomKorp: TCheckListBox;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDomUlPunkt: TfmdomUlPunkt;

implementation

{$R *.DFM}

procedure TfmDomUlPunkt.FormCreate(Sender: TObject);
begin
  LoadPosForm(Self);
end;

procedure TfmDomUlPunkt.FormDestroy(Sender: TObject);
begin
  SavePosForm(Self);
end;

procedure TfmDomUlPunkt.TBItem2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
