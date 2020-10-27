unit fUlPunkt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, uFunc, FuncPr, adsdata, adstable, kbmMemTable,
  TB2Item, TB2Dock, TB2Toolbar, fMain;

type
  TfmULPunkt = class(TForm)
    cbUl: TCheckListBox;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    FArrKodUL : TArrStrings;
    FPunkt    : String;
    FQuery    : TAdsQuery;
    FTbDom    : TkbmMemTable;
  end;

var
  fmULPunkt: TfmULPunkt;

implementation

uses fDomUlPunkt, dBase;

{$R *.DFM}

procedure TfmULPunkt.FormCreate(Sender: TObject);
begin
  LoadPosForm(Self);
end;

procedure TfmULPunkt.FormDestroy(Sender: TObject);
begin
  SavePosForm(Self);
end;

procedure TfmULPunkt.TBItem1Click(Sender: TObject);
var
  slDomKorp:TStringList;
  s, ss, strDom, strKorp : String;
  arrDom, arrKorp : TArrStrings;
  i,j : Integer;                               
begin
  if (cbUL.ItemIndex > -1) and cbUL.Checked[cbUL.ItemIndex] then begin
    FQuery.Filter := 'punkt='+FPunkt+' .and. '+'ul='+FArrKodUL[cbUL.ItemIndex];
    FQuery.Filtered := true;
    if not FQuery.Eof then begin
      fmDomUlPunkt := TfmdomUlPunkt.Create(nil);
      fmDomUlPunkt.Top:=Self.Top;
      fmDomUlPunkt.Left:=Self.Left+Self.Width;
      slDomKorp:=TStringList.Create;
      SetLength(arrDom,0);
      SetLength(arrKorp,0);
      if FTbDom.FindKey([FPunkt,FArrKodUL[cbUL.ItemIndex]]) then begin
        StrToArr(FTbDom.FieldByName('DOM').AsString, arrDom,  ',', true);
        SetLength(arrKorp,Length(arrDom));
        for i:=Low(arrDom) to High(arrDom) do begin
          j:=Pos('~',arrDom[i]);
          if j=0 then begin
            arrKorp[i]:='';
            arrDom[i]:=Trim(arrDom[i]);
          end else begin
            arrKorp[i]:=Trim(Copy(arrDom[i],j+1,Length(arrDom[i])));
            arrDom[i]:=Trim(Copy(arrDom[i],1,j-1));
          end;
        end;
      end;
//      for i:=0 to Length(arrDom)-1 do arrDom[i]:=dmBase.GetNomerDom(arrDom[i]);
//      for i:=0 to Length(arrKorp)-1 do arrKorp[i]:=dmBase.GetNomerDom(arrKorp[i]);
      while not FQuery.Eof do begin
        strDom:=Trim(FQuery.FieldByName('DOM').AsString);
        strKorp:=Trim(FQuery.FieldByName('KORP').AsString);

        fmDomUlPunkt.cbDomKorp.Items.Add(dmBase.getDom(FQuery,true));
        slDomKorp.Add(strDom+'~'+strKorp);
        j:=fmDomUlPunkt.cbDomKorp.Items.Count-1;
        for i:=Low(arrDom) to High(arrDom) do begin
          if (arrDom[i]=strDom) and (arrKorp[i]=strKorp) then begin
            fmDomUlPunkt.cbDomKorp.Checked[j]:=true;
            break;
          end;
        end;
        FQuery.Next;
      end;
      FQuery.Filtered := false;
      fmDomUlPunkt.ShowModal;
      strDom:='';
      for i:=0 to fmDomUlPunkt.cbDomKorp.Items.Count-1 do begin
        if fmDomUlPunkt.cbDomKorp.Checked[i] then begin
          strDom:=strDom+slDomKorp.Strings[i]+',';
        end;
      end;
      if strDom<>'' then strDom:=Copy(strDom,1,Length(strDom)-1);
      if FTbDom.FindKey([FPunkt,FArrKodUL[cbUL.ItemIndex]]) then begin
        if (strDom='') then begin
          FTbDom.Delete;
        end else begin
          FTbDom.Edit;
          FTbDom.FieldByName('DOM').AsString  := strDom;
          FTbDom.Post;
        end;
      end else begin
        if (strDom<>'') then begin
          FTbDom.Append;
          FTbDom.FieldByName('PUNKT').AsString := FPunkt;
          FTbDom.FieldByName('UL').AsString    := FArrKodUL[cbUL.ItemIndex];
          FTbDom.FieldByName('DOM').AsString   := strDom;
          FTbDom.Post;
        end;
      end;
      fmDomUlPunkt.Free;
      slDomKorp.Free;
    end else begin
      FQuery.Filtered := false;
      Beep;
    end;
  end;
end;

procedure TfmULPunkt.TBItem2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
