unit SasaDBGrid;

{IMPLICITBUILD ON}

interface
Uses Classes,Windows,DbGridEh,IniFiles,Graphics,Grids,Messages,
     Controls, FuncPr, db;
Type

  TEnterMoveDirection = (mdNone,mdNextGraph,mdNextLine);

  TDBGridSOption = (dgsAutoFitRows,dgsSelectCurrentColor,dgsSelectCurrentBold);
  TDBGridSOptions = set of TDBGridSOption;

  TRecInt = record
    iPos   : Integer;
    iCount : Integer;
  end;

  TSasaDBGrid = class(TDBGridEH)
  private
    FOptionsS: TDBGridSOptions;
//    FPopup : TPopupWindow; // Календарь Rx
    FSelRowColor : TColor;
    FNewRowColor : TColor;
    FColor1 : TColor;
    FColor2 : TColor;
    FEnterDirection : TEnterMoveDirection;
    FFixedCols : Integer;
    FTypeSave: Integer;
    procedure SetOptionsEh(const Value: TDBGridSOptions);
    procedure SetTitleFit;
    procedure PopupCloseUp(Sender: TObject; Accept: Boolean); // закрытие календаря
    procedure RestoreDopProp( FIniFile : TCustomIniFile; Section : String;
                              Iden : String);
    procedure SaveDopProp( FIniFile : TCustomIniFile; Section : String;
                              Iden : String);
    procedure RestoreDopPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile; Section : String;
                              Iden : String);
    procedure SaveDopPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile; Section : String;
                              Iden : String);
    procedure SaveSmallPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile;
                     Section : String; Iden : String);
    procedure RestoreSmallPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile;
                     Section : String; Iden : String);

    procedure SetTypeSave(const Value: Integer);
    procedure UpdateData;
//    procedure Resize;
  protected
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
              Column: TColumnEh; State: TGridDrawState); override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure ColWidthsChanged; override;
    procedure LayoutChanged; override;
    procedure InvalidateCurRow;
    procedure DoExit; override;
    procedure DoEnter; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;X, Y: Integer); override;
//    procedure EditButtonClick; override;
//    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  SaveToIni(FIniFile : TCustomIniFile;Section : string; lSmall:Boolean=false; lLayout:Boolean=true);
    procedure  LoadFromIni(FIniFile : TCustomIniFile;Section : string; lLayout:Boolean=true);
    procedure  SaveFormat(FIniFile : TCustomIniFile;Section : string);
    procedure  LoadFormat(FIniFile : TCustomIniFile;Section : string);
    procedure SumGraf;
    procedure SaveLayoutToIni(FIniFile: TCustomIniFile; Section: string);
    procedure LoadLayoutFromIni(FIniFile: TCustomIniFile; Section: string);
    procedure MyUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  published
    property EnterDirection : TEnterMoveDirection read FEnterDirection write FEnterDirection;
    property OptionsS : TDBGridSOptions read FOptionsS write SetOptionsEh
             default [dgsAutoFitRows,dgsSelectCurrentColor,dgsSelectCurrentBold];
    property SelRowColor: TColor read FSelRowColor write FSelRowColor default clHighlight;
    property NewRowColor: TColor read FNewRowColor write FNewRowColor default clLime;
    property FixedCols: Integer read FFixedCols write FFixedCols default 0;
//    property OnKeyDown; - не использовать !!!!!!!!!
//    property OnKeyUp;
    property Color1: TColor read FColor1 write FColor1 default clWindow;
    property Color2: TColor read FColor2 write FColor2 default clWindow;
    property TypeSave : Integer read FTypeSave write SetTypeSave;
  end;

  TMyColumn = class(TColumnEh);

  const
  SAVE_DEFAULT    = 0;
  SAVE_SMALL      = 1;
  SAVE_VERYSMALL1 = 2;
  SAVE_VERYSMALL2 = 3;


implementation
Uses SasaUtils, GridSetUp, DbGrids, Forms, SysUtils, FuncEh;
{
Type
  THackPopup  = class(TPopupWindow);
}

const
//      GridProps   = '!,DataSource,';
      GridProps   = ',SelRowColor,NewRowColor,Color1,Color2,TitleFont,Font,Height,Width,AutoFitColWidths,AllowedOperations,BorderStyle,Flat,EnterDirection,DrawMemoText,FixedColor,HorzScrollBar,Options,OptionsEh,VertScrollBar,Color,RowSizingAllowed,';
//      ColumnProps = '!,FieldName,';
      ColumnProps = ',Alignment,Color,EndEllipsis,Font,Increment,Title,WordWrap,Visible,ToolTips,Orientation,DropDownRows,DropDownWidth,';
      ColumnPropsSmall = ',Alignment,Color,EndEllipsis,Increment,Title,WordWrap,Visible,ToolTips,Orientation,';
      ColumnPropsVerySmall1 =',Alignment,Color,EndEllipsis,Increment,WordWrap,Visible,ToolTips,Orientation,';

      ColumnSect  = '.Columns.';
      LayoutSect  = '.Layout';
      sectFormat  = 'FieldFormat';


{ TSasaDBGrid }

constructor TSasaDBGrid.Create(AOwner: TComponent);
begin
   inherited;
   OnKeyDown:=MyUserKeyDown;  // Обработка нажатия ENTER в InplaceEditor возможна только так
   FEnterDirection  := mdNextGraph;
   FSelRowColor     := clAqua; //clHighlight;
   FNewRowColor     := clLime;
//   FAutoFitColWidths:= True;                          
   FUseMultiTitle   := True;
   FOptionsS        := [dgsSelectCurrentColor];
 //  FPopup           := Nil;
   EditActions      :=[geaCopyEh,geaSelectAllEh];
   ShowHint         :=True; //Для Tooltips - они отображаются только при ShowHint=True
   //OptionsEh := OptionEh + [];
   DrawMemoText     := true;
   TypeSave := SAVE_DEFAULT;
end;

destructor TSasaDBGrid.Destroy;
begin
  OnKeyDown:=Nil;
  inherited;
end;

procedure TSasaDBGrid.ColWidthsChanged;
begin
  inherited;
  SetTitleFit;
end;

procedure TSasaDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumnEh; State: TGridDrawState);
begin
  // Если выделять текущую
  if ([dgsSelectCurrentColor,dgsSelectCurrentBold] * FOptionsS <> []) and
      // запись текущая
     (Rect.Top = CellRect(Col,Row).Top) and
     ((Canvas.Brush.Color=Column.Color) or not Focused)
  then begin
      if dgsSelectCurrentBold  in FOptionsS  // Выделение жирным
      then Canvas.Font.Style:=Canvas.Font.Style+[fsBold];
      if dgsSelectCurrentColor in FOptionsS  // Выделение цветом
      then begin
        Canvas.Brush.Color:=FSelRowColor;
        {
        if Focused or EditorMode
        then Canvas.Brush.Color:=FSelRowColor
        else Canvas.Brush.Color:=clSilver; //clGray;
        }
      end;
      // Выделим новую запись
      if Assigned(DataLink) and (DataLink.DataSet.State=dsInsert)
      then Canvas.Brush.Color:=FNewRowColor;
  end;
//  DefaultDrawColumnCell(Rect,DataCol,Column,State);
  inherited;
end;

const
  NameDopProp = 'DopProp';
  Arr : array[0..1] of TRecInt = ( (iPos:1;iCount:2),
                                   (iPos:3;iCount:2) );

//------------------------------------------------------------------------
procedure TSasaDBGrid.SaveDopProp( FIniFile : TCustomIniFile; Section : String;
                          Iden : String);
var
  s : String;
begin
  s := IntToStr(FrozenCols)+','+IntToStr(FooterRowCount);
  FIniFile.WriteString(Section,Iden, s);
end;

//------------------------------------------------------------------------
procedure TSasaDBGrid.RestoreDopProp( FIniFile : TCustomIniFile; Section : String;
                          Iden : String);
var
  s,ss : String;
  a : TArrStrings;
  i : Integer;
begin
  s := FIniFile.ReadString(Section,Iden,'');
  if Length(s) > 0 then begin
    SetLength(a,0);
    a := StrToArr(s,',');
    for i:=0 to Length(a)-1 do begin
      ss := Trim(a[i]);
      case i of
        0 : begin
              if (Length(ss) > 0) and IsAllDigit(ss) then begin
                FrozenCols := StrToInt( ss );
              end;
            end;
        1 : begin
              if (Length(ss) > 0) and IsAllDigit(ss)  then begin
                FooterRowCount := StrToInt( ss );
                if FooterRowCount > 0 then begin
                  SumList.Active := true;
                end else begin
                  SumList.Active := false;
                end;
              end
            end;
      end;
    end;
  end;
end;

procedure TSasaDBGrid.SaveSmallPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile;
                     Section : String; Iden : String);
var
  s  : String;
begin
  if Column.Visible
    then s := '1,'
    else s:='0,';
  s := s + Column.Title.Caption+',';
  if Column.Title.TitleButton
    then s := s + '1,'
    else s := s + '0,';

  if Length(Column.Footer.Value)>0
    then s := s + Column.Footer.Value+','
    else s := s + ',';
  s := s + IntToStr(Integer(Column.Footer.ValueType));
  s := s + ',' + IntToStr(Column.DropDownWidth);
  s := s + ',' + IntToStr(Column.DropDownRows);
  if Column.ReadOnly
    then s := s+',1'
    else s := s+',0';
  FIniFile.WriteString(Section,Iden, s);
end;

procedure TSasaDBGrid.RestoreSmallPropColumn(Column: TColumnEh;
  FIniFile: TCustomIniFile; Section, Iden: String);
var
  s,ss : String;
  a : TArrStrings;
  i : Integer;
begin
  s := FIniFile.ReadString(Section,Iden,'');
  if Length(s) > 0 then begin
//    SetLength(a,0);
    StrToArr(s,a,',',false);
    for i:=0 to Length(a)-1 do begin
      ss := Trim(a[i]);
      try
        case i of
          0 : if ss='1' then Column.Visible:=true else Column.Visible:=false;
          1 : Column.Title.Caption := ss;
          2 : if ss='1' then Column.Title.TitleButton:=true else Column.Title.TitleButton:=false;
          3 : if ss<>'' then Column.Footer.Value:=ss;
          4 : if ss<>'' then Column.Footer.ValueType:=TFooterValueType(StrToInt(ss));
          5 : if ss<>'' then Column.DropDownWidth:=StrToInt(ss);
          6 : if ss<>'' then Column.DropDownRows:=StrToInt(ss);
          7 : if ss='1' then Column.ReadOnly:=true else Column.ReadOnly:=false;
        end;
      except
      end;
    end;
  end;
end;

procedure TSasaDBGrid.SaveDopPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile;
                     Section : String; Iden : String);
var
  s  : String;
begin
  if Length(Column.Footer.Value)>0 then begin
    s := Column.Footer.Value+',';
  end else begin
    s := ',';
  end;
  s := s + IntToStr(Integer(Column.Footer.ValueType));
  s := s + ',' + IntToStr(Column.DropDownWidth);
  s := s + ',' + IntToStr(Column.DropDownRows);
  if Column.ReadOnly
    then s := s+',1'
    else s := s+',0';
  FIniFile.WriteString(Section,Iden, s);
end;

procedure TSasaDBGrid.RestoreDopPropColumn(Column: TColumnEh; FIniFile : TCustomIniFile;
                     Section : String; Iden : String);
var
  s,ss : String;
  a : TArrStrings;
  i : Integer;
begin
  s := FIniFile.ReadString(Section,Iden,'');
  if Length(s) > 0 then begin
    SetLength(a,0);
    a := StrToArr(s,',');
    for i:=0 to Length(a)-1 do begin
      ss := Trim(a[i]);
      case i of
        0 : Column.Footer.Value := ss;
        1 : if (Length(ss) > 0) and IsAllDigit(ss) then
              Column.Footer.ValueType := TFooterValueType(StrToInt(ss));
        2 : if (Length(ss) > 0) then Column.DropDownWidth := StrToInt(ss);
        3 : if (Length(ss) > 0) then Column.DropDownRows := StrToInt(ss);
        4 : if (Length(ss) > 0) then Column.ReadOnly := ss='1';
      end;
    end;
  end;
end;

procedure TSasaDBGrid.LoadFromIni(FIniFile: TCustomIniFile; Section: string; lLayout:Boolean);
Var i : integer;
    S,Fmt : string;
begin
   BeginUpdate;              
   try
//     RestoreGridLayoutProducer(FIniFile,Section+LayoutSect,[grpColIndexEh,grpColWidthsEh,grpSortMarkerEh,grpRowHeightEh]);
     RestoreDopProp(FIniFile,Section,NameDopProp);
     CompFromIni(Self,FIniFile,Section,GridProps);
     if TypeSave = SAVE_DEFAULT then begin
       for i:=0 to  Columns.Count-1 do begin
           TMyColumn(Columns[i]).IsStored := true;   // vadim для сохранения настроек грида после установки фильтра
           S:=Section+ColumnSect+Columns[i].FieldName;
           CompFromIni(Columns[i],FIniFile,S,ColumnProps);    
           RestoreDopPropColumn(Columns[i],FIniFile,S,NameDopProp);
           if (Columns[i].Field<>Nil) then begin
              if Columns[i].Field.FieldKind = fkLookUp then begin
                Columns[i].DropDownSizing := true;
                if Columns[i].DropDownBox.Columns.Count>1 then begin
                  Columns[i].DropDownShowTitles := true;
                end else begin
                  Columns[i].DropDownShowTitles := false;
                end;
              end;
              Fmt:=FIniFile.ReadString(S,sectFormat,'');
              if Columns[i].Field is TNumericField then TNumericField(Columns[i].Field).DisplayFormat:=Fmt;
              if Columns[i].Field is TDateTimeField then TDateTimeField(Columns[i].Field).DisplayFormat:=Fmt;
           end;
       end;
     end else if TypeSave = SAVE_VERYSMALL1 then begin
       for i:=0 to  Columns.Count-1 do begin
         TMyColumn(Columns[i]).IsStored := true;   // vadim для сохранения настроек грида после установки фильтра
         S:=Section+ColumnSect+Columns[i].FieldName;
         CompFromIni(Columns[i],FIniFile,S,ColumnPropsVerySmall1);
         Columns[i].Title.Caption := FIniFile.ReadString(S,'Title_Caption', Columns[i].Title.Caption);
         Columns[i].Title.TitleButton := FIniFile.ReadBool(S,'Title_TitleButton', Columns[i].Title.TitleButton);
       end;
     end else if TypeSave = SAVE_VERYSMALL2 then begin
       for i:=0 to  Columns.Count-1 do begin
         TMyColumn(Columns[i]).IsStored := true;   // vadim для сохранения настроек грида после установки фильтра
         RestoreSmallPropColumn(Columns[i],FIniFile,Section,'Grid.'+Columns[i].FieldName);
       end;
     end;
     if lLayout then
       RestoreGridLayoutProducer(FIniFile,Section+LayoutSect,[grpColIndexEh,grpColWidthsEh,grpSortMarkerEh,grpRowHeightEh]);
   finally
     EndUpdate;
   end;
   LayoutChanged;
end;

procedure TSasaDBGrid.SaveLayoutToIni(FIniFile: TCustomIniFile; Section: string);
begin
  SaveGridLayoutProducer(FIniFile,Section+LayoutSect,True);
end;

procedure TSasaDBGrid.LoadLayoutFromIni(FIniFile: TCustomIniFile; Section: string);
begin
  BeginUpdate;
  try
    RestoreGridLayoutProducer(FIniFile,Section+LayoutSect,[grpColIndexEh,grpColWidthsEh,grpSortMarkerEh,grpRowHeightEh]);
  finally
    EndUpdate;
  end;
  LayoutChanged;
end;

procedure TSasaDBGrid.SaveToIni(FIniFile: TCustomIniFile; Section: string; lSmall : Boolean; lLayout:Boolean);
Var i : integer;
    S,Fmt : string;
begin
  if (DataSource=nil) or (DataSource.DataSet=nil) or
     not DataSource.DataSet.Active then begin
     exit;
  end;
  if lLayout then
    SaveGridLayoutProducer(FIniFile,Section+LayoutSect,True);
  SaveDopProp( FIniFile, Section, NameDopProp);
  CompToIni(Self,FIniFile,Section,GridProps);
//   CompFromIni(DbGridEh1,FIniFile,'Grid',GridProp);
  if (TypeSave = SAVE_DEFAULT) then begin
    for i:=0 to  Columns.Count-1 do begin
       S:=Section+ColumnSect+Columns[i].FieldName;
       if lSmall then begin
         CompToIni(Columns[i],FIniFile,S,ColumnPropsSmall,true);
       end else begin
         CompToIni(Columns[i],FIniFile,S,ColumnProps,false);
       end;
       SaveDopPropColumn(Columns[i],FIniFile,S,NameDopProp);
       if (Columns[i].Field<>Nil) then begin
          Fmt:='';
          if Columns[i].Field is TNumericField then Fmt:=TNumericField(Columns[i].Field).DisplayFormat;
          if Columns[i].Field is TDateTimeField then Fmt:=TDateTimeField(Columns[i].Field).DisplayFormat;
          FIniFile.WriteString(S,sectFormat,Fmt);
       end;
    end;
  end else if TypeSave = SAVE_VERYSMALL1 then begin
    for i:=0 to  Columns.Count-1 do begin
       S:=Section+ColumnSect+Columns[i].FieldName;
       CompToIni(Columns[i],FIniFile,S,ColumnPropsVerySmall1,true);
       FIniFile.WriteString(S,'Title_Caption', Columns[i].Title.Caption);
       FIniFile.WriteBool(S,'Title_TitleButton', Columns[i].Title.TitleButton);
    end;
  end else if TypeSave = SAVE_VERYSMALL2 then begin
    for i:=0 to  Columns.Count-1 do begin
       SaveSmallPropColumn(Columns[i],FIniFile,Section,'Grid.'+Columns[i].FieldName);
    end;
  end;
end;

procedure TSasaDBGrid.MyUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var NewKey,i : Integer ;
    s : string;
    nSumma : Extended;
    arr,arrRec : TArrStrings;
    c:TColumnEh;
    ColCellParamsEh:TColCellParamsEh;
    cur:TCursor;
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
     UpdateData;
     if EditorMode then begin
      //  if Assigned(FPopup) then PopupCloseUp(Self,True);
        case FEnterDirection of
          mdNextGraph : NewKey:=VK_RIGHT;
          mdNextLine  : NewKey:=VK_DOWN;
          else          NewKey:=0;
        end;
        if NewKey<>0 then begin
          s := VisibleColumns.Items[VisibleColumns.Count-1].FieldName;
          if (SelectedField.FieldName = s) and
             (NewKey = VK_RIGHT) then begin // стоим на последней колонке
            SelectedIndex := VisibleColumns.Items[0].Index;
            NewKey := VK_DOWN;
          end;
          PostMessage(Handle,WM_KEYDOWN,NewKey,0);
        end;
        Key:=0;
     end;
  end else if (Key=VK_DOWN) and (Shift=[ssAlt]) then begin
    if Assigned(OnEditButtonClick) then begin
      OnEditButtonClick(Self);
      Key:=0;
    end;
//    if Columns[SelectedIndex].OnEditButtonClick <> nil then begin
//      Columns[SelectedIndex].OnEditButtonClick;
//    end;
  end else if (Key=VK_F3) and (Shift=[]) then begin
    if Selection.DataCellSelected(Columns[0].Index,DataSource.Dataset.Bookmark) then begin
      Selection.Rows.CurrentRowSelected:=false;
      Selection.Refresh;
    end else begin
      Selection.Rows.CurrentRowSelected:=true;
      Selection.Refresh;
    end;
    Key:=VK_DOWN;
  end else if (Key=VK_F3) and (Shift=[ssCtrl]) then begin
    Selection.Clear;
//    Selection.Rows.Clear;
    Selection.Refresh;
    Key:=0;
  end else if ((Key=VK_ADD) or (Key=187)) and (Shift=[ssCtrl]) then begin
    SumGraf;
//    Application.MessageBox('Ctrl Plus','',0);
  end else begin
  {
     if Assigned(FPopup) then begin
        if Key=VK_ESCAPE
        then PopupCloseUp(Self,False)
        else begin  THackPopup(FPopup).KeyDown(Key, Shift); Key := 0;  end;
     end;
     }
  end;
end;

{
procedure TSasaDBGrid.Resize;
begin
  inherited;
  SetTitleFit;
end;
}
//----------------------------------------------------------------------
procedure TSasaDBGrid.SumGraf;
Var NewKey,i : Integer ;
    s : string;
    nSumma : Extended;
    arr,arrRec : TArrStrings;
    c:TColumnEh;
    ColCellParamsEh:TColCellParamsEh;
    cur:TCursor;
    //----------------------------
    function GetValueFld:Double;
    begin
      if Assigned(C.OnGetCellParams) then begin
        ColCellParamsEh.Text:=c.Field.AsString;
        C.OnGetCellParams(C, False, ColCellParamsEh);
        if Trim(ColCellParamsEh.Text)='' then begin
          Result:=0;
        end else begin
          try
            Result:=StrToFloat(ColCellParamsEh.Text);
          except
            Result:=0;
          end;
        end;
        {
      end else if (C<>nil) and (Column.PickList.Count>0) then begin
         Ind:=Column.KeyList.IndexOf(Field.AsString);
         if Ind<>-1 then begin
            Result:=StrToFloat(Column.PickList[Ind]);
         end
         else begin
            Result:=Field.AsFloat;
         end;
         }
      end else begin
         Result:=c.Field.AsFloat;
      end;
   end;
begin       
    if (SelectedField<>nil) and (SelectedIndex>-1) then begin
      if (SelectedField.DataType=ftFloat) or (SelectedField.DataType=ftCurrency) or
         (SelectedField.DataType=ftSmallInt) or (SelectedField.DataType=ftInteger) or
         (SelectedField.DataType=ftLargeInt) or (SelectedField.DataType=ftWord) or
         (SelectedField.DataType=ftBCD) or (SelectedField.DataType=ftFMTBcd) then begin
        c:=Columns[SelectedIndex];
        s:=DataSource.DataSet.Bookmark;
        cur:=Screen.Cursor;
        Screen.Cursor:=crHourGlass;
        DataSource.DataSet.DisableControls;
        try
          ColCellParamsEh:=TColCellParamsEh.Create;
          SelectionToArr(Self,arrRec);
          nSumma:=0;
          if Length(arrRec)>0 then begin
            for i:=0 to Length(arrRec)-1 do begin
              DataSource.DataSet.Bookmark:=arrRec[i];
              nSumma:=nSumma+GetValueFld;
            end;
          end else begin
            with DataSource.DataSet do begin
              First;
              while not Eof do begin
                nSumma:=nSumma+GetValueFld;
                Next;
              end;
            end;
          end;
        finally
         Screen.Cursor:=cur;
          ColCellParamsEh.Free;
          DataSource.DataSet.Bookmark:=s;
          DataSource.DataSet.EnableControls;
        end;
        Application.MessageBox(PChar(FloatToStr(nSumma)),'Сумма равна',0);
      end else begin
        Beep;
      end;
    end;
end;

procedure TSasaDBGrid.SetOptionsEh(const Value: TDBGridSOptions);
begin
  FOptionsS := Value;
  if (dgsAutoFitRows in FOptionsS) then SetTitleFit;
end;

procedure TSasaDBGrid.SetTitleFit;
Var off,rh,h,cnt : integer;
    S : string;
begin
   if (dgsAutoFitRows in FOptionsS) and (RowCount>1) then begin
      // Кол-во уровней
      h :=1;
      for off:=0 to Columns.Count-1 do begin
          cnt:=1;
          S:=Columns[off].Title.Caption;
          for rh:=1 to Length(S) do if S[rh]='|' then Inc(cnt);
          if cnt>h then h:=cnt;
      end;
      off:=ClientHeight-GridHeight;
      if off>0 then begin
         if (dgTitles in Options) then rh := 2 else rh := 1;
         rh:=RowHeights[rh];
         if dgRowLines in Options then Inc(rh);
         Inc(off,VTitleMargin*h);
         while (off>rh) do Dec(off,rh);
         VTitleMargin:=off div h;
     end;
   end;
end;

procedure TSasaDBGrid.WMSize(var Message: TWMSize);
begin
  inherited;
  SetTitleFit;
end;


procedure TSasaDBGrid.LayoutChanged;
begin
  Ctl3D:=(OptionsEh * [dghFixed3D,dghFrozen3D,dghFooter3D,dghData3D] <> []);
  inherited;
end;

procedure TSasaDBGrid.InvalidateCurRow;
Var i : integer;
begin
   for I := 0 to ColCount - 1 do InvalidateCell(I,Row);
end;

procedure TSasaDBGrid.DoExit;
begin
   inherited;
//   if dgsSelectCurrentColor in OptionsS then begin
//     OptionsS := OptionsS - [dgsSelectCurrentColor];
//   end;
   PopupCloseUp(Nil,False);
   InvalidateCurRow;
end;

procedure TSasaDBGrid.DoEnter;
begin
  inherited;
//  OptionsS := OptionsS + [dgsSelectCurrentColor];
  InvalidateCurRow;
end;

procedure TSasaDBGrid.PopupCloseUp(Sender: TObject; Accept: Boolean);
//Var CurColumn : TColumnEh;
begin
{
  if Assigned(FPopup) then begin
     if Accept then begin
        CurColumn := Columns[SelectedIndex];
        CurColumn.Field.DataSet.Edit;
        CurColumn.Field.Value:=THackPopup(FPopup).GetValue;
     end;
     FPopup.Hide;
     FPopup.Free;
     FPopup:=Nil;
  end;
}
end;


procedure TSasaDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
   PopupCloseUp(Nil,False);
   inherited;
end;

{
procedure TSasaDBGrid.EditButtonClick;
Var CurColumn : TColumnEh;
    P1,P  : TPoint;
    R     : TRect;
    Value : Variant;
begin
  CurColumn := Columns[SelectedIndex];
  if (CurColumn.Field.DataType in [ftDate,ftDateTime]) and
     (CurColumn.ButtonStyle=DbGridEh.cbsEllipsis) // inherited должно вызваться
  then begin if not Assigned(FPopup) then begin   // inherited не должно вызваться
     FPopup := TPopupWindow(CreatePopupCalendar(Self,BiDiMode));
     FPopup.OnCloseUp := PopupCloseUp;
     R  := CellRect(Col,Row);
     P1 := ClientToScreen(Point(R.Right,R.Bottom));
     P  := Point(P1.X-FPopup.Width,P1.Y);
     if P.X<0 then P.X:=0;
     if P.Y+FPopup.Height > Screen.Height
     then P.Y := ClientToScreen(Point(R.Right,R.Bottom)).Y - FPopup.Height;
     if CurColumn.Field.IsNull
     then Value := Now
     else Value := CurColumn.Field.Value;
     THackPopup(FPopup).SetValue(Value);
     FPopup.Show(P);
  end end
  else inherited;
end;
}

procedure TSasaDBGrid.LoadFormat(FIniFile: TCustomIniFile;  Section: string);
Var i : integer;
    S,Fmt : string;
begin
     for i:=0 to  Columns.Count-1 do begin
         S:=Section+ColumnSect+Columns[i].FieldName;
         CompFromIni(Columns[i],FIniFile,S,ColumnProps);
         if (Columns[i].Field<>Nil) then begin
            Fmt:=FIniFile.ReadString(S,sectFormat,'');
            if Columns[i].Field is TNumericField then TNumericField(Columns[i].Field).DisplayFormat:=Fmt;
            if Columns[i].Field is TDateTimeField then TDateTimeField(Columns[i].Field).DisplayFormat:=Fmt;
         end;
     end;
end;

procedure TSasaDBGrid.SaveFormat(FIniFile: TCustomIniFile;  Section: string);
Var i : integer;
    S,Fmt : string;
begin
   for i:=0 to  Columns.Count-1 do begin
       S:=Section+ColumnSect+Columns[i].FieldName;
       if (Columns[i].Field<>Nil) then begin
          Fmt:='';
          if Columns[i].Field is TNumericField then Fmt:=TNumericField(Columns[i].Field).DisplayFormat;
          if Columns[i].Field is TDateTimeField then Fmt:=TDateTimeField(Columns[i].Field).DisplayFormat;
          FIniFile.WriteString(S,sectFormat,Fmt);
       end;
   end;
end;

procedure TSasaDBGrid.SetTypeSave(const Value: Integer);
begin
  FTypeSave := Value;
end;

procedure TSasaDBGrid.UpdateData;
begin
  inherited;
end;



end.
