unit fGurnRegDogN2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, mPermit, FuncPr,
  TB2Item, TB2Dock, TB2Toolbar, dBase, ImgList, Menus, ComCtrls, ExtCtrls,
  StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow;

type
  TfmGurnRegDogN2 = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    edFind: TComboBox;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edSeekEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edSeekEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edSeekChange(Sender: TObject);
    procedure edFindChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  getDefaultAddWhere : String; override;
    function  getAdditiveWhere   : String; override;
    procedure SetListParEditForm; override;
    procedure SetListParAddForm; override;

    procedure EditSeekChange;
    procedure ClearSeek;

    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnRegDogN2: TfmGurnRegDogN2;

implementation

{$R *.DFM}

{ fmGurnRegDogN2 }

constructor TfmGurnRegDogN2.Create(Owner: TComponent);
begin
  TypeEditObj := _TypeObj_RegDogN2;
  inherited;
  QuestDel := '  Удалить текущую запись ?  ';
  QuestDelFlt :='Удалить записи по oтбору';
  VisibleItems([TBItemAddDok], true);
  FSeekEnter:=false;
  //------------------------------------------------
end;

procedure TfmGurnRegDogN2.SetListParEditForm;
begin
  inherited;
  FListPar.Add('TYPEOBJ='+IntToStr(TypeEditObj));
end;
procedure TfmGurnRegDogN2.SetListParAddForm;
begin
  inherited;
  FListPar.Add('TYPEOBJ='+IntToStr(TypeEditObj));
end;

function TfmGurnRegDogN2.LoadQuery: Boolean;
var
  c : TColumnEh;
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
  TBItemDelayRegister.Visible:=false;
  TBSubSysFlt.Visible:=false;
end;

procedure TfmGurnRegDogN2.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
//var
//  fld : TField;
begin
  if (not Query.FieldByName('DATER2').IsNull and (dmBase.GetCurDate>=Query.FieldByName('DATER2').AsDateTime)) or
     (not Query.FieldByName('DATE_CANCEL').IsNull and (dmBase.GetCurDate>=Query.FieldByName('DATE_CANCEL').AsDateTime))
    then AFont.Color := clRed;
//  fld := Query.FindField('DATE_ANUL');
//  if (fld <> nil) and not fld.IsNull then begin
//    AFont.Color := clRed;
//  end;
end;

function TfmGurnRegDogN2.getAdditiveWhere: String;
var
 s : String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  Result:='TYPEOBJ='+IntToStr(TypeEditObj);
  if FFilter_Punkt<>'' then AddResult(FFilter_Punkt);
  s:=getYearWhere;
  if s<>'' then AddResult(s);
end;

function TfmGurnRegDogN2.getDefaultAddWhere: String;
begin
  Result:=getYearWhere;
end;

procedure TfmGurnRegDogN2.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=2400;
end;

procedure TfmGurnRegDogN2.edSeekEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  ClearSeek;
end;
procedure TfmGurnRegDogN2.edFindChange(Sender: TObject);
begin
  ClearSeek;
end;

procedure TfmGurnRegDogN2.edSeekEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmGurnRegDogN2.ClearSeek;
begin
  edSeek.Text:='';
  Query.Filtered := false;
  Query.OnFilterRecord:=nil;
  Query.Filter := '';
end;

procedure TfmGurnRegDogN2.edSeekChange(Sender: TObject);
begin
  if not FRun then begin
    if FSeekEnter then begin

    end else begin
//      if edFind.ItemIndex=TYPESEEK_FIO then begin
      EditSeekChange;
//      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnRegDogN2.EditSeekChange;
var
  sFld,strFilter : String;
  nLen,n : Integer;
begin
  strFilter := Trim(edSeek.Text);
  if (strFilter='') then begin
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
    Query.Filter := '';
  end else begin
    if ((edFind.ItemIndex=0) or (edFind.ItemIndex=1)) then begin   // без подтверждения клавишей [Enter]
      nLen := Length(strFilter);
      Query.DisableControls;
      Query.Filtered := false;
      Query.OnFilterRecord:=nil;
  //    if FSeekAsQuery_Active
  //      then
      if nLen = 0 then begin
        Query.Filter := '';
      end else begin
        if (edFind.ItemIndex=1) then sFld:='NANIM_FIO'
                                else sFld:='SOBST_FIO';
        n:=Pos(' ',strFilter);
        if n>0 then begin
          Query.Filter:=sFld+'='+QStr(Copy(strFilter,1,n-1)+'*')+
                        ' and At('+QStr(' '+Copy(strFilter,n+1,20))+', '+sFld+')>0';
        end else begin
          Query.Filter:=sFld+'='+QStr(strFilter+'*');
        end;
        Query.Filtered := true;
      end;
      Query.EnableControls;
    end;
  end;
end;


end.
