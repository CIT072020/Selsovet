unit fVvodDecl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, AddEvents, uProject, uTypes,uProjectAll,
  uPadegFIO, MetaTask, OpisEdit, dbFunc, FuncPr, ToolCtrlsEh, DBCtrlsEh, Dialogs, ExtCtrls, StdCtrls, DB, DBLookupEh, Mask, Buttons;

type
  TfmVvodDecl = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    dsTypeGorod: TDataSource;
    pnFIO: TPanel;
    Label4: TLabel;
    edFIO: TDBEditEh;
    pnAdres: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edObl: TDBEditEh;
    edRaion: TDBEditEh;
    edTypePunkt: TDBLookupComboboxEh;
    edGOROD: TDBEditEh;
    edUL: TDBEditEh;
    edDom: TDBEditEh;
    edKorp: TDBEditEh;
    edKv: TDBEditEh;
    Label25: TLabel;
    edB_OBL: TDBCheckBoxEh;
    Label27: TLabel;
    dsRnGor: TDataSource;
    edRNGOROD: TDBLookupComboboxEh;
    Label1: TLabel;
    dsStran: TDataSource;
    pnGosud: TPanel;
    Label15: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edULEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edOblUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edFIOUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edULUpdateData(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FCheckRegistr:Boolean;
    FClearKey : Boolean;
    FWordsLowerCase:String;
    procedure CityUpdate(Sender: TObject; var Handled: Boolean);
    procedure SetEdit(FIO:String; adr : TAdres);
    procedure SetMRUList(ed:TDbEditEh;nLimit:Integer;nType:Integer;lAll:Boolean;lReload:Boolean;lBel:Boolean;lAddButton:Boolean;lPunktFromSpr:Boolean=false);
    procedure MRUListOpen(Sender: TObject;  var Handled: Boolean);
    function GetEdit(var FIO:String; var adr : TAdres):String;
    procedure ChoiceUl( ed : TDbEditEh );
    procedure UpdateActions; override;
  end;

  function VvodDecl(lDecl:Boolean; lGosud:Boolean; var FIO:String; var adr : TAdres) : String;

implementation

{$R *.dfm}

function VvodDecl(lDecl:Boolean; lGosud:Boolean; var FIO:String; var adr : TAdres) : String;
var
  fmVvodDecl: TfmVvodDecl;
begin
  Result:='';
  fmVvodDecl:=TfmVvodDecl.Create(nil);
  fmVvodDecl.FClearKey:=false;
  fmVvodDecl.FCheckRegistr:=true;
  if not lDecl  then begin
    fmVvodDecl.pnFIO.Visible:=false;
    fmVvodDecl.Height:=fmVvodDecl.Height-fmVvodDecl.pnFIO.Height;
    fmVvodDecl.Caption:='Адрес';
  end;
  if not lGosud then begin
    fmVvodDecl.pnGosud.Visible:=false;
    fmVvodDecl.Height:=fmVvodDecl.Height-fmVvodDecl.pnGosud.Height;
  end;
  fmVvodDecl.SetEdit(FIO,adr);

  if fmVvodDecl.ShowModal=mrOk then begin
    Result:=fmVvodDecl.GetEdit(FIO,adr);
  end;
  fmVvodDecl.Free;
end;


{ TfmVvodDecl }

function TfmVvodDecl.GetEdit(var FIO:String; var adr: TAdres):String;
var
  nType:Integer;
begin
  adr.AdresPropis:='';
  adr.Raion:=edRaion.Text;
  adr.RnGorName:=Trim(edRNGOROD.Text);
  adr.Ulica:=edUl.Text;
  adr.NDom:=edDom.Text;
  adr.Korp:=edKorp.Text;
  adr.Kv:=edKv.Text;
  adr.Strana:='';
  if (edGOSUD.Value<>null) and pnGosud.Visible then begin
    if dmBase.SprStran.Locate('ID',edGOSUD.Value,[]) then begin
      adr.Strana := dmBase. SprStran.FieldByName('FNAME').AsString;
    end;
  end;

  if adr.Raion<>'' then begin
    adr.Raion:=adr.Raion+GetWordRAION(adr.Raion, 'R.');
  end;
  if adr.RnGorName<>'' then begin
    adr.RnGorName:=adr.RnGorName+GetWordRAION(adr.RnGorName, 'R.');
  end;

  if edB_OBL.STATE=cbChecked then nType:=1
  else if edB_OBL.STATE=cbUnChecked then nType:=0
  else if edB_OBL.STATE=cbGrayed then nType:=-1;
  adr.Obl:=dmBase.NameObl(edObl.Text,  nType, 'R.');

  if edTypePunkt.Value=null then nType:=0 else nType:=edTypePunkt.Value;
  adr.Punkt:=dmBase.NamePunkt(edGorod.Text, nType, 'R');

  Result:='';
  if pnFIO.Visible and (edFIO.Text<>'') then begin
    Result:=GetPadegFIO(edFIO.Text,'Ж','И')+', ';
  end;
  if adr.Strana<>''
    then if Result='' then Result:=adr.Strana else Result:=Result+' '+adr.Strana;
  if adr.Obl<>''
    then if Result='' then Result:=adr.Obl else Result:=Result+' '+adr.Obl;
  if adr.Raion<>''
    then if Result='' then Result:=adr.Raion else Result:=Result+' '+adr.Raion;
  if adr.Punkt<>''
    then if Result='' then Result:=adr.Punkt else Result:=Result+' '+adr.Punkt;
  if adr.RnGorName<>''
    then if Result='' then Result:=adr.RnGorName else Result:=Result+' '+adr.RnGorName;
  if adr.Ulica<>''
    then if Result='' then Result:=adr.Ulica else Result:=Result+' '+adr.Ulica;
  if adr.NDom<>''  then Result:=Result+' '+sokrDom+' '+adr.NDom;
  if adr.Korp<>''  then Result:=Result+' '+sokrKorp+' '+adr.Korp;
  if adr.Kv<>''    then Result:=Result+' '+sokrKv+' '+adr.Kv;
end;

//-----------------------------------------------------------
procedure TfmVvodDecl.SetEdit(FIO:String; adr: TAdres);
begin
{
  edObl.Text:=adr.Obl;
  edRaion.Text:=adr.Raion;
  edGorod.Text:=adr.Punkt;
  edUl.Text:=adr.Ulica;
  edDom.Text:=adr.NDom;
  edKorp.Text:=adr.Korp;
  edKv.Text:=adr.Kv;
}
  if pnGosud.Visible
    then edGOSUD.Value:=MY_GRAG;
  edObl.Text := Globaltask.ParamAsString('OBL');
  edRaion.Text := Globaltask.ParamAsString('RAION');
  edGOROD.Text := Globaltask.ParamAsString('GOROD');
  edRNGOROD.Text  := Globaltask.ParamAsString('RN_GOROD');
  edTypePunkt.Value := Globaltask.ParamAsString('TYPEPUNKT');

end;

procedure TfmVvodDecl.edULEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceUl(edUL);
end;

procedure TfmVvodDecl.ChoiceUl( ed : TDbEditEh );
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  s,ss : String;
  ParamFlt : TParamFieldFlt;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_UL_SPR');
  if Opis<>nil then begin
    SetLength(arrRec,1);
    ParamFlt := TParamFieldFlt.Create;
    s := Trim(ed.Text);
    if (s<>'') and (Pos(' ',s)=0) then begin
      Opis.AutoFilter:=true;
      with ParamFlt do begin
        TypeSr:=tsBegin;
        Value1:=s;
        FieldName:='NAME';
        CICharacter:=true;
        OnlySet:=true;
      end;
    end;
    v:=null;
    if Opis.ChoiceFromSprEx(ed, v, arrRec, ParamFlt) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      v := GetValueField(arrRec, 'TIP');
      ss := '';
      if v<>null then begin
        if dmBase.SprTypeUl.Locate('ID', v, []) then begin
          ss := dmBase.SprTypeUl.FieldByName('NAME').AsString+' ';
        end;
      end;
      v := GetValueField(arrRec, 'NAME');
      if v <> null then ed.Text := ss+VarToStr(v);
      Screen.Cursor := old;
    end;
    ParamFlt.Free;
  end;
end;

procedure TfmVvodDecl.SetMRUList(ed: TDbEditEh; nLimit, nType: Integer; lAll, lReload, lBel: Boolean;lAddButton:Boolean;
                                lPunktFromSpr:Boolean);
var
  bt : TEditButtonEh;
begin
  if (nType=3) and lPunktFromSpr then begin  // загружать населенные путкты из спраочника нас. пунктов
    ed.MRUList.Items:=GetMRUName_Punkt(lBel,lReload);
  end else begin
    ed.MRUList.Items:=GetMRUName(nType,lAll,lReload,lBel);
  end;
  if ed.MRUList.Items.Count>0 then begin
//    ed.OnChange:=DbEditMRUList_Change;
    ed.MRUList.Rows:=15;
    ed.MRUList.Active:=true;
    ed.MRUList.AutoAdd:=false;
    if nLimit>0 then  ed.MRUList.Limit:=nLimit;
    if lAddButton then begin
      if ed.EditButtons.Count=0 then begin
        bt := ed.EditButtons.Add;
      end else begin
        bt := ed.EditButtons[0];
      end;
      bt.OnClick := MRUListOpen;
      bt.Visible := true;
    end else begin
    end;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmVvodDecl.MRUListOpen(Sender: TObject;  var Handled: Boolean);
begin
  if Sender is TDbEditEh then begin
    if not TDbEditEh(Sender).MRUList.DroppedDown
      then TDbEditEh(Sender).MRUList.DropDown
      else TDbEditEh(Sender).MRUList.CloseUp(false);
  end else begin
    if not TDbEditEh(TControl(Sender).Parent).MRUList.DroppedDown
      then TDbEditEh(TControl(Sender).Parent).MRUList.DropDown
      else TDbEditEh(TControl(Sender).Parent).MRUList.CloseUp(false);
  end;
end;

procedure TfmVvodDecl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmVvodDecl.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      ModalResult:=mrOk;
    end;
  end;
end;

procedure TfmVvodDecl.UpdateActions;
begin
  inherited;
  btOk.Enabled:= (edGorod.Text<>'');
end;

procedure TfmVvodDecl.FormCreate(Sender: TObject);
var
  n:Integer;
begin
  n:=LimitMRUList(3);
  SetMRUList(edGorod,n,3,true,false,false,true);
  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,true);
  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,true);
  FWordsLowerCase := ','+StringReplace(ANSILowerCase(Trim(GlobalTask.ParamAsString('WORDS_LOWER'))),' ','',[rfReplaceAll])+',';

end;

//--------------------------------------------------------------------------------------
procedure TfmVvodDecl.CityUpdate(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
  i,j : Integer;
  s,ss,s2 : String;
  arr,arr2 : TArrStrings;
begin
  ed := TDbEditEh(Sender);
  StrToArr(trim(ed.Text),arr,' ',true);
  ss:='';
  if FCheckRegistr then begin  // контролировать регистр букв
    for i:=0 to length(arr)-1 do begin
      s:=Trim(arr[i]);
      if i=0 then begin  // только первое слово
        if Pos('-',s)>0 then begin
          StrToArr(s,arr2,'-',true);
          for j:=0 to length(arr2)-1 do begin
            s2:=arr2[j];
            if (Pos(','+ANSILowerCase(s2)+',',FWordsLowerCase)=0) then begin
              ss:=ss+ANSIUpperCase(Copy(s2,1,1))+ANSILowerCase(Copy(s2,2,Length(s2)-1));
            end else begin
              ss:=ss+s2;
            end;
            if j<length(arr2)-1 then ss:=ss+'-' else ss:=ss+' ';
          end;
        end else begin
          if (Pos(','+ANSILowerCase(s)+',',FWordsLowerCase)=0) then begin
            ss:=ss+ANSIUpperCase(Copy(s,1,1))+ANSILowerCase(Copy(s,2,Length(s)-1))+' ';
          end else begin
            ss:=ss+s+' ';
          end;
        end;
      end else begin
        ss:=ss+s+' ';
      end;
    end;
  end;
  if ss<>'' then begin
    ed.Text := Trim(ss);
  end;
end;

procedure TfmVvodDecl.edOblUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CityUpdate(Sender, Handled);
end;

procedure TfmVvodDecl.edULUpdateData(Sender: TObject;  var Handled: Boolean);
begin
//
end;

procedure TfmVvodDecl.edFIOUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  if pnFIO.Visible and (edFIO.Text<>'') then begin
    edFIO.Text:=GetPadegFIO(edFIO.Text,'Ж','И');
  end;
end;

initialization
finalization
end.



