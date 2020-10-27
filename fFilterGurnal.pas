unit fFilterGurnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SasaDbGrid, fRecordGrid, Grids, ImgList, TB2Item, TB2Dock, TB2Toolbar,
  OpisEdit, fmStringSeek, db, FuncPr, fGurnal
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type

  TOpisFlt = record
    OpisEdit : TOpisEdit;
    Field    : TField;
    Value    : TValuesFlt;
  end;
  TArrOpisFlt = array of TOpisFlt;

  TfmFilterGurnal = class(TForm)
    TBDock: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemSetFlt: TTBItem;
    TBItemClearFlt: TTBItem;
    TBItemExit: TTBItem;
    ImageList: TImageList;
    GridFlt: TStringGrid;
    TBItemCurClear: TTBItem;
    procedure TBItemExitClick(Sender: TObject);
    procedure GridFltKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridFltDblClick(Sender: TObject);
    procedure TBItemSetFltClick(Sender: TObject);
    procedure TBItemClearFltClick(Sender: TObject);
    procedure TBItemCurClearClick(Sender: TObject);
    procedure GridFltDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    FGrid : TSasaDbGrid;
    FKodGurnal : String;
    FArrOpisFlt : TArrOpisFlt;
    FResult : String;
    FFilterJurnal : TFilterJurnal;
  public
    procedure CreateView;
    function GetStrForView( i : integer) : String;
  end;

function SetFilterJurnal( FilterJurnal : TFilterJurnal) : TModalResult;

implementation

//var
//  fmFilterGurnal: TfmFilterGurnal;

{$R *.DFM}

function SetFilterJurnal( FilterJurnal : TFilterJurnal) : TModalResult;
var
  fmFilter : TfmFilterGurnal;
begin
  fmFilter := TfmFilterGurnal.Create(nil);
  fmFilter.FGrid := FilterJurnal.Jurnal.Grid;
  fmFilter.FKodGurnal := FilterJurnal.Jurnal.KodGurnal;
  fmFilter.FFilterJurnal:=FilterJurnal;
  fmFilter.CreateView;
  Result := fmFilter.ShowModal;
  FilterJurnal.Where := fmFilter.FResult;
end;

{ TfmFilterGurnal }

procedure TfmFilterGurnal.CreateView;
var
  i,j,iRowCount,m : Integer;
begin
  iRowCount:=1;
  for i:=0 to FGrid.Columns.Count-1 do begin
    if FGrid.Columns[i].Visible then begin
      Inc(iRowCount,1);
    end;
  end;
  GridFlt.RowCount:=iRowCount;
  SetLength(FArrOpisFlt, iRowCount-1);
  GridFlt.DefaultRowHeight:=22;
  GridFlt.Cols[0].Strings[0] := 'Реквизит';
  GridFlt.Cols[1].Strings[0] := 'Значение';
  j:=0;
  for i:=0 to FGrid.Columns.Count-1 do begin
    if FGrid.Columns[i].Visible then begin
      Inc(j,1);
      GridFlt.Cols[0].Strings[j] := StringReplace( FGrid.Columns[i].Title.Caption, '|', ' ', [rfReplaceAll]);
      FArrOpisFlt[j-1].Value.Empty := true;
      FArrOpisFlt[j-1].Field := FGrid.Columns[i].Field;
      FArrOpisFlt[j-1].Value.Value1:=null;
      FArrOpisFlt[j-1].Value.Value2:=null;
      FArrOpisFlt[j-1].Value.TypeSr:=tsRavno;
      FArrOpisFlt[j-1].Value.Registr:=false;
      if (FGrid.Columns[i].Tag>0) and (TObject(FGrid.Columns[i].Tag) is TOpisEdit) then begin
        FArrOpisFlt[j-1].OpisEdit := TOpisEdit(FGrid.Columns[i].Tag);
      end;
      // заполним значения из фильтра формы
      for m:=Low(FFilterJurnal.ArrFlt) to High(FFilterJurnal.ArrFlt) do begin
        if ANSICompareText(FFilterJurnal.ArrFlt[m].FieldName,FArrOpisFlt[j-1].Field.FieldName)=0 then begin
          FArrOpisFlt[j-1].Value.Empty :=FFilterJurnal.ArrFlt[m].Empty;
          if FArrOpisFlt[j-1].Value.Empty
            then FArrOpisFlt[j-1].Value.Where := ''
            else FArrOpisFlt[j-1].Value.Where := FFilterJurnal.ArrFlt[m].Where;
          FArrOpisFlt[j-1].Value.Value1:=FFilterJurnal.ArrFlt[m].Value1;
          FArrOpisFlt[j-1].Value.Value2:=FFilterJurnal.ArrFlt[m].Value2;
          FArrOpisFlt[j-1].Value.TypeSr:=FFilterJurnal.ArrFlt[m].TypeSr;
          FArrOpisFlt[j-1].Value.Registr:=FFilterJurnal.ArrFlt[m].Registr;
          GridFlt.Cols[1].Strings[j] := GetStrForView(j-1);
          break;
        end;
      end;
    end;
  end;
  j:=50;
  for i:=0 to GridFlt.RowCount-1 do begin
    j:=j+GridFlt.RowHeights[i];
  end;
  ClientHeight:=j;
end;

procedure TfmFilterGurnal.TBItemExitClick(Sender: TObject);
begin
  ModalResult:=mrRetry;
end;

procedure TfmFilterGurnal.GridFltKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : GridFltDblClick(nil);
  end;
end;

procedure TfmFilterGurnal.GridFltDblClick(Sender: TObject);
var
  i : Integer;
  strSeek : String;
begin
  i:=GridFlt.Row-1;
  strSeek := VvodForFilter(GridFlt.Cols[0].Strings[i+1],
                 FArrOpisFlt[i].Field.FieldName,FArrOpisFlt[i].Field,
                 FArrOpisFlt[i].OpisEdit,FArrOpisFlt[i].Value);
  if strSeek<>'' then begin
    FArrOpisFlt[i].Value.Where:=strSeek;
    FArrOpisFlt[i].Value.Empty:=false;
    GridFlt.Cols[1].Strings[i+1]:=GetStrForView(i);
  end;
end;

function TfmFilterGurnal.GetStrForView( i : integer) : String;
var
  t  : TTypeSr;
  s,s1,s2 : String;
  arr : TArrStrings;
  j : Integer;
begin
  if FArrOpisFlt[i].Value.Empty then begin
    Result:='';
    exit;
  end;
  t  := FArrOpisFlt[i].Value.TypeSr;
  if (FArrOpisFlt[i].OpisEdit<>nil) then begin
    if (t=tsIN) or (t=tsNotIN) then begin
      s2:='';
      s := VarToStr(FArrOpisFlt[i].Value.Value1);
      StrToArr(s,arr,';',true);
      s1 := '"';
      for j:=Low(arr) to High(arr) do begin
        s1 := s1 + FArrOpisFlt[i].OpisEdit.Naim(arr[j],true);
        if j<>High(arr) then begin
          s1:=s1+',';
        end;
      end;
      s1:=s1+'"';
    end else begin
      s1 := '"'+FArrOpisFlt[i].OpisEdit.Naim(FArrOpisFlt[i].Value.Value1,true)+'"';
      s2 := '"'+FArrOpisFlt[i].OpisEdit.Naim(FArrOpisFlt[i].Value.Value2,true)+'"';
    end;
  end else begin
    if VarType(FArrOpisFlt[i].Value.Value1)=varBoolean then begin
      if FArrOpisFlt[i].Value.Value1 then s1:='Да' else s1:='Нет';
      s1:='"'+s1+'"';
      s2:='';
    end else begin
      s1 := '"' + VarToStr(FArrOpisFlt[i].Value.Value1) + '"';
      s2 := '"' + VarToStr(FArrOpisFlt[i].Value.Value2) + '"';
    end;
  end;
  case t of
    tsRavno    : Result := 'Значение равно '+s1;
    tsNotRavno : Result := 'Значение не равно '+s1;
    tsMenshe   : Result := 'Значение меньше или равно чем '+s1;
    tsBolshe   : Result := 'Значение больше или равно чем '+s1;
    tsDiap     : Result := 'Значение находится в диапазоне '+s1+' ... '+s2;
    tsEmpty    : Result := 'Любое значение не введено';
    tsNotEmpty : Result := 'Введено любое значение';
    tsIN       : Result := 'Значение равно хотя бы одному из: ('+s1+')';
    tsNotIN    : Result := 'Значение не равно ни одному из: ('+s1+')';
    tsAt       : Result := 'Значение содержит '+s1;
    tsBegin    : Result := 'Значение начинается с '+s1;
  end;
//  Result := Result + '_____'+ FArrOpisFlt[i].Where;
end;

procedure TfmFilterGurnal.TBItemSetFltClick(Sender: TObject);
var
  i,m : Integer;
  strWhere : String;
  lFind : Boolean;
begin
  strWhere := '';
  for i:=Low(FArrOpisFlt) to High(FArrOpisFlt) do begin
    if FArrOpisFlt[i].Value.Where<>'' then begin
      strWhere := strWhere + '('+FArrOpisFlt[i].Value.Where+')' + ' AND '
    end;
  end;
  FResult:='';
  if Length(strWhere)>0 then begin
    strWhere := Copy(strWhere,1,Length(strWhere)-5);
    FResult  := strWhere;

    //-------------- запишем значения в фильтр формы ----------------
    for i:=Low(FArrOpisFlt) to High(FArrOpisFlt) do begin
      lFind:=false;
      for m:=Low(FFilterJurnal.ArrFlt) to High(FFilterJurnal.ArrFlt) do begin
        if ANSICompareText(FFilterJurnal.ArrFlt[m].FieldName,FArrOpisFlt[i].Field.FieldName)=0 then begin
//        if FFilterJurnal.ArrFlt[m].FieldName=FArrOpisFlt[i].Field.FieldName then begin
          lFind:=true;
          FFilterJurnal.ArrFlt[m].Empty:=FArrOpisFlt[i].Value.Empty;
          FFilterJurnal.ArrFlt[m].Where := FArrOpisFlt[i].Value.Where;
          FFilterJurnal.ArrFlt[m].Value1:=FArrOpisFlt[i].Value.Value1;
          FFilterJurnal.ArrFlt[m].Value2:=FArrOpisFlt[i].Value.Value2;
          FFilterJurnal.ArrFlt[m].TypeSr:=FArrOpisFlt[i].Value.TypeSr;
          FFilterJurnal.ArrFlt[m].Registr:=FArrOpisFlt[i].Value.Registr;
          FFilterJurnal.ArrFlt[m].FieldName:=FArrOpisFlt[i].Field.FieldName;
          break;
        end;
      end;
      if not lFind then begin
        FFilterJurnal.AddEl;
        m:=Length(FFilterJurnal.ArrFlt)-1;
        FFilterJurnal.ArrFlt[m].Empty:=FArrOpisFlt[i].Value.Empty;
        FFilterJurnal.ArrFlt[m].Where := FArrOpisFlt[i].Value.Where;
        FFilterJurnal.ArrFlt[m].Value1:=FArrOpisFlt[i].Value.Value1;
        FFilterJurnal.ArrFlt[m].Value2:=FArrOpisFlt[i].Value.Value2;
        FFilterJurnal.ArrFlt[m].TypeSr:=FArrOpisFlt[i].Value.TypeSr;
        FFilterJurnal.ArrFlt[m].Registr:=FArrOpisFlt[i].Value.Registr;
        FFilterJurnal.ArrFlt[m].FieldName:=FArrOpisFlt[i].Field.FieldName;
      end;
    end;
    //---------------------------------------------------------------
    ModalResult:=mrOk;
  end else begin
    Beep;
    ShowMessage(' Не введено ни одного значения для отбора ! ');
  end;
end;

procedure TfmFilterGurnal.TBItemClearFltClick(Sender: TObject);
begin
  FResult:='';
  Modalresult:=mrCancel;
end;

procedure TfmFilterGurnal.TBItemCurClearClick(Sender: TObject);
begin
  FArrOpisFlt[GridFlt.Row-1].Value.Where:='';
  FArrOpisFlt[GridFlt.Row-1].Value.Empty:=true;
  GridFlt.Cols[1].Strings[GridFlt.Row]:='';
end;

procedure TfmFilterGurnal.GridFltDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ARow=0 then begin
    with GridFlt.Canvas do begin
      Font.Size:=12;
      Font.Style:=Font.Style+[fsBold];
      TextOut(Rect.Left+1, Rect.Top+1, GridFlt.Cols[ACol].Strings[0]);
    end;
  end;
end;

end.


