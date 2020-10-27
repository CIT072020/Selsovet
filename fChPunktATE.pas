unit fChPunktATE;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask, Variants, uTypes,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, FuncPr, uProjectAll;

{$I Task.inc}

type
  TfmChPunktATE = class(TForm)
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    edObl: TDBLookupComboboxEh;
    edRn: TDBLookupComboboxEh;
    edSS: TDBLookupComboboxEh;
    Bevel1: TBevel;
    queryRn: TAdsQuery;
    querySS: TAdsQuery;
    dsObl: TDataSource;
    dsRn: TDataSource;
    dsSS: TDataSource;
    edNP: TDBLookupComboboxEh;
    queryNP: TAdsQuery;
    dsNP: TDataSource;
    cbObl: TComboBox;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edOblChange(Sender: TObject);
    procedure edRnChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edSSChange(Sender: TObject);
    procedure edNPChange(Sender: TObject);
    procedure cbOblChange(Sender: TObject);
  private
    FValueSOATO: String;
    FClearKey : Boolean;
    FFromATE: Boolean;
    FValueATE: Integer;
    FTypeChoice: Integer;
    FAdd: Boolean;
    procedure SetValueSOATO(const Value: String);
    procedure SetFromATE(const Value: Boolean);
    procedure SetValueATE(const Value: Integer);
    procedure SetTypeChoice(const Value: Integer);
    procedure SetAdd(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    function IndexToObl(n:Integer): Integer;
    function OblToIndex(v:Variant): Integer;
    function GetLastATE(var nUr:Integer):Integer;
    function GetATEValues:TATE;
    function GetATEValue(nUr:Integer; var Category:Integer):Integer;
//    function GetDatasetUr(nUr:Integer):TDataSet;
    function GetControlUr(nUr:Integer):TComponent;

    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
    property ValueATE : Integer read FValueATE write SetValueATE;
    property TypeChoice:Integer read FTypeChoice write SetTypeChoice;
    property Add:Boolean read FAdd write SetAdd;
  end;

  function ChoiceFromATE(Owner:TWinControl; lAdd:Boolean; nATE:Integer):TATE;

implementation

uses uProject, mPermit;

{$R *.DFM}

function ChoiceFromATE(Owner:TWinControl; lAdd:Boolean; nATE:Integer):TATE;
var
  f: TfmChPunktATE;
begin
  f:=TfmChPunktATE.Create(Owner);
  f.Edit1.Visible:=Role.SystemAdmin;
  f.Add:=lAdd;
  Result.ATE_ID:=0;
  f.ValueATE:=nATE;
  if f.ShowModal=mrOk then begin
    Result:=f.GetATEValues;
  end else begin

  end;
  f.Free;

end;

{ TfmChPunktATE }

procedure TfmChPunktATE.SetValueSOATO(const Value: String);
var
  cur : TCursor;
begin
  {$IFDEF OCHERED}
    lbDetail.Caption:='√ород';
    querySS.SQL.Text:=
     'SELECT *  FROM —пр—ќј“ќ s '+
     '  WHERE Substring(kod,1,4)=:PAR_RN and '+
     ' (Substring(kod,5,1)=''3'' or ( ((Substring(kod,5,1)=''5'' and Substring(kod,7,1)<>''0'') or (Substring(kod,5,2)=''51'')) '+
     ' and Substring(kod,8,3)='+QStr('000')+' and Substring(kod,2,1)<>'+QStr('4')+'))';
    edSS.DropDownBox.Rows:=5;
  {$ENDIF}
  FValueSOATO := Value;
  if Value <> '' then begin
    cur := Screen.Cursor;
    edObl.Value:= Copy(Value,1,1)+'000000000';
//    queryObl.Open;
    queryRn.ParamByName('PAR_OBL').AsString := Copy(Value,1,1);
    queryRn.Open;
    querySS.ParamByName('PAR_RN').AsString := Copy(Value,1,4);
    querySS.Open;

    edRn.Value := Copy(Value,1,4) + '000000';
    edSS.Value := Copy(Value,1,7) +'000';

    Screen.Cursor := cur;
  end;
end;


procedure TfmChPunktATE.FormCreate(Sender: TObject);
var
  sName:String;
begin
  sName:='iif(front=1,trim(namec)+'' '','''')+trim(name)+iif(front=1,'''','' ''+trim(namec)) full_name';
//  if Role.SystemAdmin                                  
//    then sName:='CAST(ATE_ID AS SQL_CHAR)+'+sName;
  queryRn.SQL.Text:='select ATE_ID KOD,'+sName+' , ate_parentid parent, category from sysspr.ate where ate_parentid=:PAR and dateout is null order by kod';
  querySS.SQL.Text:=queryRn.SQL.Text;
  queryNP.SQL.Text:='select ATE_ID KOD,'+sName+' , ate_parentid parent, category from sysspr.ate where ate_parentid=:PAR and dateout is null order by name';
  FClearKey := false;
  FTypeChoice:=0;
end;

procedure TfmChPunktATE.edOblChange(Sender: TObject);
var
  cur:TCursor;
  v:Variant;
begin
 cur := Screen.Cursor;
 queryRn.Close;
 querySS.Close;
 queryNP.Close;
 edRN.Value:=null;
 edSS.Value:=null;
 edNP.Value:=null;
 v:=TDBLookupComboboxEh(Sender).Value;
 if (v=null) or (VarToStr(v)='') then begin
   queryRn.ParamByName('PAR').AsInteger:=-1;
 end else begin
   queryRn.ParamByName('PAR').AsInteger:=IndexToObl(StrToInt(VarToStr(v))); //Copy(TDBLookupComboboxEh(Sender).Value,1,1);
 end;
 queryRn.Open;
 Screen.Cursor:=cur;
end;

procedure TfmChPunktATE.cbOblChange(Sender: TObject);
var
  cur:TCursor;
  n:Integer;
begin
 cur := Screen.Cursor;
 Tag:=0;
 queryRn.Close;
 querySS.Close;
 queryNP.Close;
 edRN.Value:=null;
 edSS.Value:=null;
 edNP.Value:=null;
 n:=cbObl.ItemIndex;
 if (n<0) then begin
   queryRn.ParamByName('PAR').AsInteger := -1;
 end else begin
   n:=IndexToObl(n);
   queryRn.ParamByName('PAR').AsInteger := n; //Copy(TDBLookupComboboxEh(Sender).Value,1,1);
   if dmBase.ATESys.Locate('ATE_ID',n,[]) then begin
     Tag:=dmBase.ATESys.fieldByName('CATEGORY').AsInteger;
   end;
 end;
 queryRn.Open;
 Screen.Cursor:=cur;
end;

procedure TfmChPunktATE.edRnChange(Sender: TObject);
var
  cur:TCursor;
  v:Variant;
begin
 cur := Screen.Cursor;
 Tag:=queryRn.fieldByName('CATEGORY').AsInteger;
 querySS.Close;
 queryNP.Close;
 edSS.Value:=null;
 edNP.Value:=null;
 v:=TDBLookupComboboxEh(Sender).Value;
 if (v=null) or (VarToStr(v)='') then begin
   querySS.ParamByName('PAR').AsInteger:=-1;
 end else begin
   querySS.ParamByName('PAR').AsInteger:=v; //Copy(TDBLookupComboboxEh(Sender).Value,1,4);
 end;
 querySS.Open;
 Screen.Cursor:=cur;
 try
   if v=null
     then edit1.Text:='нет'
     else edit1.Text:=VarToStr(v);
 except
   edit1.Text:='error';
 end;
end;


procedure TfmChPunktATE.edSSChange(Sender: TObject);
var
  cur : TCursor;
  v:Variant;
begin
 cur := Screen.Cursor;
 Tag:=querySS.fieldByName('CATEGORY').AsInteger;
 queryNP.Close;
 edNP.Value:=null;
 v:=TDBLookupComboboxEh(Sender).Value;
 if (v=null) or (VarToStr(v)='') then begin
   queryNP.ParamByName('PAR').AsInteger:=-1;
 end else begin
   queryNP.ParamByName('PAR').AsInteger:=v; //Copy(TDBLookupComboboxEh(Sender).Value,1,7);
 end;
 queryNP.Open;
 Screen.Cursor:=cur;
 try
   if v=null
     then edit1.Text:='нет'
     else edit1.Text:=VarToStr(v);
 except
   edit1.Text:='error';
 end;

end;

procedure TfmChPunktATE.edNPChange(Sender: TObject);
begin
 Tag:=queryNP.fieldByName('CATEGORY').AsInteger;
 try
   if edNP.Value=null
     then edit1.Text:='нет'
     else edit1.Text:=VarToStr(edNP.Value);
 except
   edit1.Text:='error';
 end;
end;

procedure TfmChPunktATE.btOkClick(Sender: TObject);
var
  n:Integer;
begin
//  if FTypeChoice=0 then begin   // выбор нас.пункта
  FValueATE:=GetLastATE(n);
  if FValueATE>0 then begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmChPunktATE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChPunktATE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmChPunktATE.SetFromATE(const Value: Boolean);
begin
  FFromATE := Value;
end;

procedure TfmChPunktATE.SetValueATE(const Value: Integer);
var
 arr:array[1..4] of Integer;
 n,m,i:Integer;
 ds:TDataSet;
begin
  if Value>0 then begin
    n:=Value;
    for m:=1 to 4 do arr[m]:=0;
    m:=4;
    ds:=dmBase.ATESys;
    while n>0 do begin
      if ds.Locate('ATE_ID',n,[]) then begin
        arr[m]:=n;
        if ds.FieldByName('ATE_PARENTID').Asinteger>0 then begin
          m:=m-1;
          n:=ds.FieldByName('ATE_PARENTID').Asinteger;
        end else begin
          n:=0;
        end;
      end else begin
        n:=0;
      end;
    end;
    n:=1;
    for i:=m to 4 do begin
      case n of
        1: begin
             cbObl.ItemIndex:=OblToIndex(arr[i]);
             cbOblChange(cbObl);
           end;
        2: begin
             edRn.Value:=arr[i];
             edRnChange(edRn);
           end;
        3: begin
             edSS.Value:=arr[i];
             edSSChange(edSS);
           end;
        4: begin
             if not FAdd then begin
               edNP.Value:=arr[i];
               edNPChange(edNP);
             end;
           end;
      end;
      n:=n+1;
    end;
  end;

  FValueATE := Value;
end;

function TfmChPunktATE.IndexToObl(n:Integer): Integer;
begin
  result:=-1;
  case n of
    0: result:=ATEID_MnGor;
    1: result:=ATEID_BrObl;
    2: result:=ATEID_VtObl;
    3: result:=ATEID_GoObl;
    4: result:=ATEID_GrObl;
    5: result:=ATEID_MoObl;
    6: result:=ATEID_MnObl;
  end;
end;

function TfmChPunktATE.OblToIndex(v:Variant): Integer;
var
  n:Integer;
//  s,ss:String;
begin
  result:=-1;
  if VarType(v)=varString then begin
    n:=0;
  end else begin
    n:=StrToInt(VarToStr(v));
  end;
  case n of
    ATEID_MnGor: result:=0;
    ATEID_BrObl: result:=1;
    ATEID_VtObl: result:=2;
    ATEID_GoObl: result:=3;
    ATEID_GrObl: result:=4;
    ATEID_MoObl: result:=5;
    ATEID_MnObl: result:=6;
  end;
end;

function TfmChPunktATE.GetLastATE(var nUr:Integer): Integer;
begin
  nUr:=0;
  Result:=0;
  if (edNP.Value<>null) and (VarToStr(edNP.Value)<>'') then begin
    nUr:=4;
    Result:=edNP.Value;
  end else if (edSS.Value<>null) and (VarToStr(edSS.Value)<>'') then begin
    nUr:=3;
    Result:=edSS.Value;
  end else if (edRN.Value<>null) and (VarToStr(edRN.Value)<>'') then begin
    nUr:=2;
    Result:=edRN.Value;
  end else if (cbObl.ItemIndex>-1) then begin
    nUr:=1;
    Result:=IndexToObl(cbObl.ItemIndex);
  end;
end;

{
function TfmChPunktATE.GetDatasetUr(nUr:Integer):TDataSet;
begin
  Result:=nil;
  case nUr of
    1: Result:=queryObl;
    2: Result:=queryRn;
    3: Result:=querySS;
    4: Result:=queryNP;
  end;
end;
}
function TfmChPunktATE.GetControlUr(nUr:Integer):TComponent;
begin
  Result:=nil;
  case nUr of
    1: Result:=edObl;
    2: Result:=edRn;
    3: Result:=edSS;
    4: Result:=edNP;
  end;
end;

function TfmChPunktATE.GetATEValue(nUr:Integer; var Category:Integer):Integer;
var
  v:Variant;
begin
  Category:=0;
  Result:=0;
  case nUr of
    1: v:=IndexToObl(cbObl.ItemIndex);
    2: v:=edRn.Value;
    3: v:=edSS.Value;
    4: v:=edNP.Value;
  end;
  case nUr of
    1: Category:=cbObl.Tag;
    2: Category:=edRn.Tag;
    3: Category:=edSS.Tag;
    4: Category:=edNP.Tag;
  end;
  if (v<>null) and (VarToStr(v)<>'') then begin
    try
      Result:=v;
    except
      Result:=0;
    end;
  end;
end;

function TfmChPunktATE.GetATEValues:TATE;
var
  arr:array[1..4] of Integer;
  nUr,n,m,i,nCat:Integer;
  ds:TDataSet;
//  fld:TField;
  s:String;
  cont:TComponent;
begin
//  ds:=dmBase.ATE;
//  fld:=ds.FieldByName('CATEGORY');
  Result.Obl:='';
  Result.Raion:='';
  Result.SS:='';
  Result.Name:='';
  Result.Category:=0;
  Result.ATE_ID:=GetLastATE(nUr);
  if Result.ATE_ID>0 then begin
    for m:=nUr downto 1 do begin
      n:=GetATEValue(m, nCat);
      ds:=SeekATE(n);
//      ds:=GetDatasetUr(m);  // !!!
//      cont:=GetControlUr(nUr);
//      if ds.Locate('ATE_ID',n,[]) then begin
//      if ds.Locate('KOD',n,[]) then begin
      if ds<>nil then begin
        s:=ds.FieldByName('NAME').AsString;
        nCat:=ds.FieldByName('CATEGORY').AsInteger;
        i:=CategoryType(nCat);
        if i=CATEGORY_OBL then begin
          Result.Obl:=s;
        end else if i=CATEGORY_RAION then begin
          Result.Raion:=s;
        end else if i=CATEGORY_RNGOROD then begin
          Result.RnGorod:=s;
        end else if i=CATEGORY_SS then begin
          Result.SS:=s;
        end else if i=CATEGORY_PUNKT then begin
          Result.Name:=s; // !!!!!
//          Result.Category:=StrToInt(fld.AsString);
          Result.Category:=nCat;
        end;
      end;
    end;
  end;
end;

procedure TfmChPunktATE.SetTypeChoice(const Value: Integer);
begin
  FTypeChoice := Value;
end;

procedure TfmChPunktATE.SetAdd(const Value: Boolean);
begin
  FAdd := Value;
end;

end.
