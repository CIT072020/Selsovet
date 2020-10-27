unit fIzbUch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, DBCtrlsEh, Mask, db, dBase, FuncPr, adsdata,
  adsfunc, adstable, MetaTask, uFunc, kbmMemTable, fMain, TB2Item, TB2Dock,
  TB2Toolbar;

type
  TfmIzbUch = class(TForm)
    edNomer: TDBNumberEditEh;
    edName: TDBEditEh;
    cbPunkts: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Query: TAdsQuery;
    tbDom: TkbmMemTable;
    tbDomUL: TIntegerField;
    tbDomPUNKT: TIntegerField;
    tbDomDOM: TStringField;
    QueryD: TAdsQuery;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    Query_not_ul: TAdsQuery;
    edOkrRN: TDBNumberEditEh;
    Label4: TLabel;
    Label5: TLabel;
    edOkrGOR: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    edOkrSS: TDBNumberEditEh;
    Label8: TLabel;
    edOkrOBL: TDBNumberEditEh;
    cbActive: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure TBItemDomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FKeyItems : TStringList;
    FKeyUL    : TarrStrings;
    FPunkts : String;
    FUL     : String;
    FID     : Integer;
    procedure EditRecord( ds : TDataSet; lAdd : Boolean);
  end;

implementation

uses fULPunkt;

{$R *.DFM}

{ TfmIzbUch }

procedure TfmIzbUch.EditRecord(ds: TDataset; lAdd: Boolean);
var
  i,j : Integer;
  arr, arrUL : TArrStrings;
begin
  SetLength(FKeyUL, cbPunkts.Items.Count);
  FUL := '';
  if lAdd then begin
    edNomer.Text := '';
    edName.Text := '';
    FID := -1;
//    cbPunkts.Clear;
  end else begin
    edNomer.Text := ds.FieldByName('NOMER').AsString;
    edOkrSS.Text := ds.FieldByName('OKRUG').AsString;
    edOkrGor.Text := ds.FieldByName('OKRUG_GOR').AsString;
    edOkrRn.Text := ds.FieldByName('OKRUG_RN').AsString;
    edOkrObl.Text := ds.FieldByName('OKRUG_OBL').AsString;
    edName.Text  := ds.FieldByName('NAME').AsString;
    cbActive.Checked:=ds.FieldByName('ACTIVE').AsBoolean;
    StrToArr(ds.FieldByName('PUNKTS').AsString,arr,',',true);
    StrToArr(ds.FieldByName('UL').AsString,arrUL,';',false);
    SetLength(arrUL, Length(arr));
    FUL := ds.FieldByName('UL').AsString;
    FID:=ds.FieldByName('ID').AsInteger;
    for i:=0 to Length(arr)-1 do begin
      j:=FKeyItems.IndexOf(arr[i]);
      if j>-1 then begin
        cbPunkts.Checked[j] := true;
        FKeyUL[j] := arrUL[i];
      end;
    end;
    if FID > -1 then begin
      dmBase.SprIzbUch2.IndexName := 'PR_KEY';
      dmBase.SprIzbUch2.SetRange([FID],[FID]);
      try
        while not dmBase.SprIzbUch2.Eof do begin
          tbDom.Append;
          tbDomPUNKT.AsString := dmBase.SprIzbUch2.FieldByName('PUNKT').AsString;
          tbDomUL.AsString    := dmBase.SprIzbUch2.FieldByName('UL').AsString;
          if tbDomUL.AsString='' then tbDomUL.AsString:='0';
          tbDomDOM.AsString   := dmBase.SprIzbUch2.FieldByName('DOM').AsString;
//          tbDomKORP.AsString  := dmBase.SprIzbUch2.FieldByName('KORP').AsString;
          dmBase.SprIzbUch2.Next;
          tbDom.Post;
        end;
      finally
        dmBase.SprIzbUch2.CancelRange;
      end;
    end;
  end;
  if ShowModal = mrOk then begin
    try
      if lAdd
        then ds.Append
        else ds.Edit;
      ds.FieldByName('NOMER').AsString  := edNomer.Text;
      ds.FieldByName('OKRUG').AsString  := edOkrSS.Text;
      ds.FieldByName('OKRUG_RN').AsString  := edOkrRn.Text;
      ds.FieldByName('OKRUG_GOR').AsString  := edOkrGor.Text;
      ds.FieldByName('OKRUG_OBL').AsString  := edOkrObl.Text;
      ds.FieldByName('NAME').AsString   := edName.Text;
      ds.FieldByName('PUNKTS').AsString := FPunkts;
      ds.FieldByName('UL').AsString := FUL;
      ds.FieldByName('ACTIVE').AsBoolean:=cbActive.Checked;
      ds.Post;
      if FID > -1 then begin
        dmBase.SprIzbUch2.IndexName := 'PR_KEY';
        dmBase.SprIzbUch2.SetRange([FID],[FID]);
        try
          while not dmBase.SprIzbUch2.Eof do dmBase.SprIzbUch2.Delete;
        finally
          dmBase.SprIzbUch2.CancelRange;
        end;
      end;
      FID := ds.FieldByName('ID').AsInteger;
      tbDom.First;
      while not tbDom.Eof do begin
        dmBase.SprIzbUch2.Append;
        dmBase.SprIzbUch2.FieldByName('ID').AsInteger   := FID;
        dmBase.SprIzbUch2.FieldByName('PUNKT').AsString := tbDomPUNKT.AsString;
        dmBase.SprIzbUch2.FieldByName('UL').AsString    := tbDomUL.AsString;
        if dmBase.SprIzbUch2.FieldByName('UL').AsString='' then dmBase.SprIzbUch2.FieldByName('UL').AsString:='0';
        dmBase.SprIzbUch2.FieldByName('DOM').AsString   := tbDomDOM.AsString;
        tbDom.Next;
        dmBase.SprIzbUch2.Post;
      end;
    except
      on E: Exception do PutError('Ошибка записи:'+#13+E.Message);
    end;
  end;
end;

procedure TfmIzbUch.FormCreate(Sender: TObject);
var
  s : String;
begin
//  LoadPosForm( Self );
  FKeyItems := TStringList.Create;
  // населенные пункты в которых есть дома без улиц
  if dmBase.LoadSQL('НасПункты_с_домами_без_улиц',s) then begin
    Query_not_ul.SQL.Text := s;
    Query_not_ul.Open;
  end;
  //
  if dmBase.LoadSQL('УлицыНасПунктов',s) then begin
    Query.SQL.Text := s;
    Query.Open;
  end;
  //
  if dmBase.LoadSQL('ДомаУлицНасПунктов',s) then begin
    QueryD.SQL.Text := s;
    QueryD.Open;
  end;
  tbDom.Open;
end;

procedure TfmIzbUch.FormDestroy(Sender: TObject);
begin
//  SavePosForm( Self );
  FKeyItems.Free;
end;

//------------------------------------------------------------------
procedure TfmIzbUch.BitBtn1Click(Sender: TObject);
var
  i : Integer;
begin
  FPunkts := '';
  FUL := '';
  for i:=0 to cbPunkts.Items.Count-1 do begin
    if cbPunkts.Checked[i] then begin
      FPunkts := FPunkts + FKeyItems.Strings[i]+',';
      FUL := FUL + FKeyUL[i] + ';';
    end;
  end;
  if FPunkts<>'' then FPunkts:=Copy(FPunkts,1,Length(FPunkts)-1);
  if FUL<>'' then FUL:=Copy(FUL,1,Length(FUL)-1);
  if edNomer.Text='' then begin
    PutError(' Заполните номер участка. ');
  end else if FPunkts='' then begin
    PutError(' Выберите хотя бы один населенный пункт. ');
  end else if edName.Text='' then begin
    PutError(' Заполните наименование. ');
  end else begin
    ModalResult := mrOk;
  end;
end;

//------------------------------------------------------------------
procedure TfmIzbUch.Button1Click(Sender: TObject);
var         
  i,n,j,nCount : Integer;
  arrUL, arrKey : TArrStrings;
  sUL : String;
  lNotUL:Boolean;
begin
  if (cbPunkts.ItemIndex>-1) and cbPunkts.Checked[cbPunkts.ItemIndex] then begin
    lNotUL:=false;
    StrToArr(FKeyUL[cbPunkts.ItemIndex], arrUL, ',', true);
    Query.Filter   := 'punkt='+FKeyItems.Strings[cbPunkts.ItemIndex];
    Query.Filtered := true;
    // если есть в населенном пункте дома без улицы
    if Query_not_ul.Locate('PUNKT',FKeyItems.Strings[cbPunkts.ItemIndex],[]) then begin
      lNotUL:=true;
    end;
    if not Query.Eof or lNotUL then begin
      nCount:=Query.RecordCount;
      if lNotUL then nCount:=nCount+1;
      fmULPunkt := TfmULPunkt.Create(nil);
      SetLength(arrKey, nCount);
      if lNotUL then begin
        fmULPunkt.cbUl.Items.Add('- БЕЗ УЛИЦЫ');
        arrKey[0] := '0';
        for j:=0 to Length(arrUL)-1 do begin
          if arrKey[0] = arrUL[j] then begin
            fmULPunkt.cbUl.Checked[0] := true;
          end;
        end;
      end;
      while not Query.Eof do begin
        fmULPunkt.cbUl.Items.Add( Query.FieldByName('NAME_UL').AsString );
        n := fmULPunkt.cbUl.Items.Count-1;
        arrKey[n] := Query.FieldByName('UL').AsString;
        for j:=0 to Length(arrUL)-1 do begin
          if arrKey[n] = arrUL[j] then begin
            fmULPunkt.cbUl.Checked[n] := true;
          end;
        end;
        Query.Next;
      end;
   //   if fmULPunkt.ShowModal = mrOk then begin
      fmULPunkt.FArrKodUL := arrKey;
      fmULPunkt.FPunkt    := FKeyItems.Strings[cbPunkts.ItemIndex];
      fmULPunkt.FQuery    := QueryD;
      fmULPunkt.FTbDom    := tbDom;

      fmULPunkt.ShowModal;
      sUL := '';
      for i:=0 to fmULPunkt.cbUl.Items.Count-1 do begin
        if fmULPunkt.cbUl.Checked[i] then begin
          sUL := sUL + arrKey[i]+',';
        end;
      end;
      if sUL<>'' then sUL:=Copy(sUL,1,Length(sUL)-1);
      FKeyUL[cbPunkts.ItemIndex] := sUL;
      fmULPunkt.Free;
    end else begin
      Beep;
    end;
  end else begin
    Beep;
  end;
end;

//------------------------------------------------------------------
procedure TfmIzbUch.TBItemDomClick(Sender: TObject);
begin
  if (cbPunkts.ItemIndex>-1) and cbPunkts.Checked[cbPunkts.ItemIndex] then begin

  end;
end;

//------------------------------------------------------------------
procedure TfmIzbUch.TBItem3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
