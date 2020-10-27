unit fCurDokFR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db,
  Dialogs, FR_DSet, FR_DBSet, kbmMemTable;

type
  TfmCurDokFR = class(TForm)
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    Dokument: TkbmMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCurDokFR: TfmCurDokFR;

implementation

{$R *.dfm}

initialization
//  fmCurDokFR:=TfmCurDokFR.Create(nil);    
finalization
//  FreeAndNil(fmCurDokFR);
end.
