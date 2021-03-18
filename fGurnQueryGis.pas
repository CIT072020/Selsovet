unit fGurnQueryGis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, mPermit,
  TB2Item, TB2Dock, TB2Toolbar, dBase, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnQueryGis = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnQueryGis: TfmGurnQueryGis;

implementation

{$R *.DFM}

{ fmGurnQueryGis }

constructor TfmGurnQueryGis.Create(Owner: TComponent);
begin
  TypeEditObj := _TypeObj_QueryGis;
  inherited;
  //------- !!! пока удаление недоступно !!! -----------
  if not Role.SystemAdmin then begin
    QuestDel:='';
    VisibleItems([TBItemDelDok], false);
  end;
  VisibleItem(TBItemAddDok, true);
  VisibleItems([TBItemDelayRegister, TBItemGrantSprav, TBSubSysFlt], false);
//  QuestDel:='  Удалить запрос в ГИс РН ?  ';
  //------------------------------------------------
end;

function TfmGurnQueryGis.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
  {
  try
    c := Grid.FieldColumns['DOKUMENT'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsDOKUMENT;
    end;
  except
  end;
  }
//  CreateSysFlt_GISUN;
end;

procedure TfmGurnQueryGis.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
//var
//  fld : TField;
begin
//  fld := Query.FindField('VOSSTAN');
//  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
//    AFont.Color := Grid.Color1;
//  end;
//  fld := Query.FindField('DATE_ANUL');
//  if (fld <> nil) and not fld.IsNull then begin
//    AFont.Color := clRed;
//  end;
end;

end.
