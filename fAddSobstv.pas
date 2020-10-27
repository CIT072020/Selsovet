unit fAddSobstv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db, uTypes,
  StdCtrls, ExtCtrls, ComCtrls, dAdres, DBCtrlsEh, Mask, Buttons, OpisEdit, fmChList,
  MetaTask, dbFunc, dBase, SasaDbGrid, FuncPr, uFunc
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmAddSobstv = class(TForm)
    edAdres: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edTail: TDBEditEh;
    edPrim: TDBEditEh;
    edDateS: TDBDateTimeEditEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    edDateP: TDBDateTimeEditEh;
    edSobstv: TDBEditEh;
    procedure edSobstvEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSobstvEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSobstvEditButtons2Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSobstvEditButtons3Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    tbHouseOwners:TDataset;
    tbHouseOwnersHist:TDataset;
    tbMensLic:TDataset;
    FIDAdres:Integer;
//    dmAdr : TdmAdres;
    FAdd  : Boolean;
    FNasel  : Boolean;
    FIDSobstv : Integer;
    FPropis:Boolean;
  public
    { Public declarations }
    procedure EditModal;
  end;

  procedure EditSobstv( ds,dsHist,dsMensLic:TDataSet; nIDAdresLic:Integer; lAdd : Boolean);


implementation

uses fMain, fChoiceNasel, dMen;

{$R *.DFM}

procedure EditSobstv( ds,dsHist,dsMensLic:TDataSet; nIDAdresLic:Integer; lAdd : Boolean);
var
  fmAddSobstv: TfmAddSobstv;
begin
  fmAddSobstv := TfmAddSobstv.Create(nil);
  try
    fmAddSobstv.tbHouseOwners := ds;
    fmAddSobstv.tbHouseOwnersHist := dsHist;
    fmAddSobstv.tbMensLic := dsMensLic;
    fmAddSobstv.FIDAdres := nIDAdresLic;
    fmAddSobstv.tbHouseOwners.DisableControls;
    fmAddSobstv.FIDSobstv:=-1;
//    fmAddSobstv.dmAdr := dm;
    fmAddSobstv.FAdd  := lAdd;
    fmAddSobstv.EditModal;
  finally
    fmAddSobstv.tbHouseOwners.EnableControls;
    fmAddSobstv.Free;
  end;
end;

{ TfmAddSobstv }

procedure TfmAddSobstv.EditModal;
var
  strName : String;
begin
  if not FAdd then begin
    Caption := ' орректировка';
//    FIDSobstv := dmAdr.tbHouseOwnersKOD.AsInteger;
    FIDSobstv := tbHouseOwners.FieldByName('KOD').AsInteger;
    if tbHouseOwners.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL
      then FNasel:=true
      else FNasel:=false;
    FPropis:=false;

    edAdres.Text := dmBase.AdresOwner(fmMain.DateFiks,
                    tbHouseOwners.FieldByName('KOD').AsString, tbHouseOwners.FieldByName('TYPEKOD').AsInteger, strName, FPropis);

    // человека нет еще в базе  (лицевой счет не запсиан)
    if (strName='') and FNasel and (tbMensLic<>nil) then begin
      tbMensLic.First;
      while not tbMensLic.Eof do begin
        if tbMensLic.FieldByName('ID').AsInteger=FIDSobstv then begin
          strName:=tbMensLic.FieldByName('FAMILIA').AsString+' '+tbMensLic.FieldByName('NAME').AsString+' '+
                   tbMensLic.FieldByName('OTCH').AsString;
          edAdres.Text:=dmBase.AdresFromIDEx(fmMain.DateFiks,IntToStr(FIDAdres),true,true);
          FPropis:=true;
          break;
        end;
        tbMensLic.Next;
      end;
      tbMensLic.First;
    end;
    edSobstv.Text := strName;

    if not tbHouseOwners.FieldByName('DATES').IsNull  then edDateS.Value := tbHouseOwners.FieldByName('DATES').AsDateTime;
    if not tbHouseOwners.FieldByName('DATEP').IsNull  then edDateP.Value := tbHouseOwners.FieldByName('DATEP').AsDateTime;
    edTail.Text := tbHouseOwners.FieldByName('TAIL').AsString;
    edPrim.Text := tbHouseOwners.FieldByName('PRIM').AsString;
    edSobstv.EditButtons[0].Visible:=false;
    edSobstv.EditButtons[1].Visible:=false;
    edSobstv.EditButtons[2].Visible:=false;
    edSobstv.EditButtons[3].Visible:=false;
    edSobstv.Enabled := false;
  end else begin
    if tbMensLic=nil then begin
      edSobstv.EditButtons[2].Visible:=false;
    end;
  end;
  if (ShowModal=mrOk) and (FIDSobstv>0) then begin
    if FAdd and tbHouseOwners.Locate('KOD',FIDSobstv,[]) then begin
      PutError('¬ыбранный собственник уже существует в списке.');
    end else begin
      if FAdd then begin
        tbHouseOwners.Append;
      end else begin
        tbHouseOwners.Edit;
      end;
      tbHouseOwners.FieldByName('KOD').AsInteger := FIDSobstv;
      if FNasel
        then tbHouseOwners.FieldByName('TYPEKOD').AsInteger := OWNER_NASEL
        else tbHouseOwners.FieldByName('TYPEKOD').AsInteger := OWNER_ORG;

      tbHouseOwners.FieldByName('ADRES').AsString := edAdres.Text;
      tbHouseOwners.FieldByName('NAME').AsString   := edSobstv.Text;
      tbHouseOwners.FieldByName('PROPIS').AsBoolean := FPropis;

//    tbHouseOwners.FieldByName('ADRES').AsString := dmBase.AdresOwner(fmMain.DateFiks,
//              tbHouseOwners.FieldByName('KOD').AsString, tbHouseOwners.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
//    tbHouseOwners.FieldByName('NAME').AsString   := strName;
//    tbHouseOwners.FieldByName('PROPIS').AsBoolean := lPropis;
      if edDateS.Value=null
        then tbHouseOwners.FieldByName('DATES').AsString   := ''
        else tbHouseOwners.FieldByName('DATES').AsDateTime := edDateS.Value;
      if edDateP.Value=null
        then tbHouseOwners.FieldByName('DATEP').AsString   := ''
        else tbHouseOwners.FieldByName('DATEP').AsDateTime := edDateP.Value;
      tbHouseOwners.FieldByName('TAIL').AsString := edTail.Text;
      tbHouseOwners.FieldByName('PRIM').AsString := edPrim.Text;
      tbHouseOwners.Post;
    end;
  end;
end;

procedure TfmAddSobstv.edSobstvEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  arrRec : TCurrentRecord;
  old : TCursor;
  strName : String;
  lPropis : Boolean;
  n:Integer;
begin
  if ChoiceMen( TControl(Sender), '', '', arrRec) then begin
    n := GetValueField(arrRec, 'ID');
    if FAdd and tbHouseOwners.Locate('KOD',n,[]) then begin
      PutError('¬ыбранный собственник уже существует в списке.');
    end else begin
      FNasel := true;
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      edSobstv.Text := GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+
                       GetValueFieldEx(arrRec, 'OTCH','');
      FIDSobstv     := n;
      edAdres.Text  := dmBase.AdresOwner(fmMain.DateFiks, IntToStr(FIDSobstv), 1, strName, lPropis);
      FPropis:=lPropis;
      Screen.Cursor := old;
    end;
  end;
end;

procedure TfmAddSobstv.edSobstvEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  Opis   : TOpisEdit;
  v      : Variant;
  arrRec : TCurrentRecord;
  n : Integer;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
  if Opis<>nil then begin
    try
      v := null;
      SetLength(arrRec,1);
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        n := GetValueField(arrRec, 'ID');
        if FAdd and tbHouseOwners.Locate('KOD',n,[]) then begin
          PutError('¬ыбранный собственник уже существует в списке.');
        end else begin
          FNasel := false;
          edSobstv.Text := GetValueFieldEx(arrRec, 'NAME','');
          edAdres.Text  := GetValueFieldEx(arrRec, 'ADRES','');
          FIDSobstv     := n;
          FPropis:=false;
        end;
      end;
    finally
    end;
  end;
end;

procedure TfmAddSobstv.edSobstvEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  i,nID : Integer;
  List : TStringList;
begin
  List := TStringList.Create;
  tbMensLic.First;
  while not tbMensLic.Eof do begin
    if tbMensLic.FieldByName('ID').AsInteger>0 then begin
      List.AddObject(tbMensLic.FieldByName('FAMILIA').AsString+' '+tbMensLic.FieldByName('NAME').AsString+' '+
               tbMensLic.FieldByName('OTCH').AsString, Pointer(tbMensLic.FieldByName('ID').AsInteger));
    end;
    tbMensLic.Next;
  end;
  tbMensLic.First;
  i := ChoiceFromList(List,'¬ыберите человека',edSobstv);
  if (i>-1)  then begin
    nID := Integer(List.Objects[i]);
    if FAdd and tbHouseOwners.Locate('KOD',nID,[]) then begin
      PutError('¬ыбранный собственник уже существует в списке.');
    end else begin
      FNasel := true;
      edSobstv.Text := List.Strings[i];
      FIDSobstv     := nID;
      FPropis:=true;
      if FIDAdres>0
        then edAdres.Text:=dmBase.AdresFromIDEx(fmMain.DateFiks,IntToStr(FIDAdres),true,true)
        else edAdres.Text:='';
//      edAdres.Text  := dmBase.AdresOwner(fmMain.DateFiks, IntToStr(FIDSobstv), 1, strName, lPropis);
    end;
  end;
  List.Free;
end;

procedure TfmAddSobstv.edSobstvEditButtons3Click(Sender: TObject;  var Handled: Boolean);
var
  ListPar:TStringList;
  old : TCursor;
  strName : String;
  lPropis : Boolean;
  n:Integer;
  dm,dmOld:TdmMen;
begin
  ListPar:=TStringList.Create;
  ListPar.Add('MEN_NOTPROPIS=1');
  ListPar.Add('MEN_ADD=1');
  ListPar.Add('PRINT=0');
  ListPar.Add('BEZADRESA=1');
  dm:=CreateAdd_dmMen(dmOld);
  dm.EditFromLichSchet:=false;
  dm.EditFromAdres:=false;
  try
    if fmMain.EditDokument(nil, dmBase.TypeObj_Nasel,'-1',ListPar,false,'') then begin
      n := fmMain.IDLastMen;
      if FAdd and tbHouseOwners.Locate('KOD',n,[]) then begin
        PutError('¬ыбранный собственник уже существует в списке.');
      end else begin
        FNasel := true;
        old := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        edSobstv.Text := dmBase.FIOMen(fmMain.DateFiks,IntToStr(n),' ');
        FIDSobstv     := n;
        edAdres.Text  := dmBase.AdresOwner(fmMain.DateFiks, IntToStr(FIDSobstv), 1, strName, lPropis);
        FPropis:=lPropis;
        Screen.Cursor := old;
      end;
    end;
  finally
    ListPar.Free;
  end;
  DestroyAdd_dmMen(dm,dmOld);
end;

end.
