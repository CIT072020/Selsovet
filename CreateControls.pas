unit CreateControls;

interface

uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh,
      Db, Math, FuncPr, ToolCtrlsEh, AddEvents, fEditMemo, vchDBCtrls, uProject, uTypes,
      MetaTask, OpisEdit, RXCtrls;

type

  TTypeProp = ( tpString, tpNumber, tpBoolean, tpDate, tpMemo,
                tpCaption, tpConst, tpOpisEdit );

  TPropControl = class(TObject)
  private
    FFontSize : Integer;
    FFontBold      : Boolean;
    FFontItalic    : Boolean;
    FFontUnderline : Boolean;

    FEof: Boolean;
    FVisible: Boolean;
    FEnabled: Boolean;
    FNameOpisEdit: String;
    FPropType: TTypeProp;
    FCaption: String;
    FPropWidth: Integer;
    FDataField: String;
    FDataSource: TDataSource;
    FPropWidthSpr: Integer;
    FEditMask: String;
    FCaptionShort: String;
    FAsLabel: Boolean;
    procedure SetEnabled(const Value: Boolean);
    procedure SetEof(const Value: Boolean);
    procedure SetNameOpisEdit(const Value: String);
    procedure SetPropType(const Value: TTypeProp);
    procedure SetVisible(const Value: Boolean);
    procedure SetCaption(const Value: String);
    procedure SetPropWidth(const Value: Integer);
    procedure SetDataField(const Value: String);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetPropWidthSpr(const Value: Integer);
    procedure SetEditMask(const Value: String);
    procedure SetCaptionShort(const Value: String);
    procedure SetAsLabel(const Value: Boolean);
  public
    MinValue : Integer;
    MaxValue : Integer;
    DisplayFormat : String;
    property Eof      : Boolean read FEof write SetEof;
    property Caption  : String read FCaption write SetCaption;
    property CaptionShort : String read FCaptionShort write SetCaptionShort;
    property Visible  : Boolean read FVisible write SetVisible;
    property Enabled  : Boolean read FEnabled write SetEnabled;
    property PropType : TTypeProp read FPropType write SetPropType;
    property PropWidth: Integer read FPropWidth write SetPropWidth;
    property PropWidthSpr: Integer read FPropWidthSpr write SetPropWidthSpr;
    property EditMask : String read FEditMask write SetEditMask;
    property FontSize : Integer read FFontSize write FFontSize;
    property FontBold : Boolean read FFontBold write FFontBold;
    property FontItalic : Boolean  read FFontItalic write FFontItalic;
    property FontUnderline : Boolean  read FFontUnderline write FFontUnderline;
    property DataSource : TDataSource read FDataSource write SetDataSource;
    property DataField  : String read FDataField write SetDataField;
    property NameOpisEdit : String read FNameOpisEdit write SetNameOpisEdit;
    property AsLabel:Boolean read FAsLabel write SetAsLabel;
    procedure Clear;
  end;

  TEventGetProperty = procedure( prop : TPropControl; lNext : Boolean ) of object;
  TEventCreateControl = procedure( c : TWinControl; prop : TPropControl ) of object;

  TCreateControls = class(TObject)
  private
    //---------------------------
    FTop  : Integer;
    FLeft : Integer;
    FMaxWidth : Integer;
    FCreateBevel : Boolean;
    FDop : String;
    //---------------------------
    FPixelsPerInch:Integer;
    FProp : TPropControl;
    FOnGetProperty: TEventGetProperty;
    FFlat : Boolean;
    FStepY: Integer;
    FAdd  : Boolean;
    FParent: TWinControl;
    FOwner: TForm;
    FLabelColor: TColor;
    FOnCreateControl: TEventCreateControl;
    procedure SetParent(const Value: TWinControl);
    procedure SetOwner(const Value: TForm);
    procedure FontFromProp( fn : TFont );
    procedure CreateBevel( n : Integer);
    procedure SetLabelColor(const Value: TColor);
    procedure SetOnCreateControl(const Value: TEventCreateControl);
  public
    property  Owner : TForm read FOwner write SetOwner;
    property  Parent : TWinControl read FParent write SetParent;
    property  LabelColor : TColor read FLabelColor write SetLabelColor;
    constructor Create;
    destructor Destroy; override;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    procedure CreateControls;
    procedure CreateOneControl( n : Integer; var lTopPlus:Boolean );
    property  OnGetProperty : TEventGetProperty read FOnGetProperty write FOnGetProperty;
    property  OnCreateControl : TEventCreateControl read FOnCreateControl write SetOnCreateControl;
  end;

implementation

const
  FIRST_LEFT=10;

{ TPropControl }

procedure TPropControl.Clear;
begin
  FEof        := true;
  FVisible    := true;
  FEnabled    := true;
  FDataSource := nil;
  FDataField  := '';
  FFontSize := 0;
  FFontBold := false;
  FFontItalic := false;
  FFontUnderline := false;
end;

procedure TPropControl.SetAsLabel(const Value: Boolean);
begin
  FAsLabel := Value;
end;

procedure TPropControl.SetCaption(const Value: String);
begin
  FCaption := Value;
end;

procedure TPropControl.SetCaptionShort(const Value: String);
begin
  FCaptionShort := Value;
end;

procedure TPropControl.SetDataField(const Value: String);
begin
  FDataField := Value;
end;

procedure TPropControl.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TPropControl.SetEditMask(const Value: String);
begin
  FEditMask := Value;
end;

procedure TPropControl.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TPropControl.SetEof(const Value: Boolean);
begin
  FEof := Value;
end;

procedure TPropControl.SetNameOpisEdit(const Value: String);
begin
  FNameOpisEdit := Value;
end;

procedure TPropControl.SetPropType(const Value: TTypeProp);
begin
  FPropType := Value;
end;

procedure TPropControl.SetPropWidth(const Value: Integer);
begin
  FPropWidth := Value;
end;

procedure TPropControl.SetPropWidthSpr(const Value: Integer);
begin
  FPropWidthSpr := Value;
end;

procedure TPropControl.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

constructor TCreateControls.Create;
begin
  inherited;
  FProp := TPropControl.Create;
  FProp.Eof := true;
  FFlat  := GlobalFlat;
  FStepY := GlobalStepY;
//  FCreateBevel := true;
  FCreateBevel := false;
  FAdd   := false;
  FLabelColor:=0;
end;

destructor TCreateControls.Destroy;
begin
  FProp.Free;
  inherited;
end;

{ TCreateControls }

{$DEFINE STATIC_TEXT}
//{$DEFINE RX_LABEL}

procedure TCreateControls.CreateControls;
var
  s:String;
  i,j : Integer;
  lTopPlus:Boolean;
  nCurWidth, nTopStep : Integer;
  ed : TDbEditEh;
//  lFirst : Boolean;
  Contr : TWinControl;
//  nLastPos : Integer;
  {$IFDEF STATIC_TEXT}
    Lb : TStaticText;
  {$ELSE}
    {$IFDEF RX_LABEL}
      Lb : TRxLabel;
    {$ELSE}
      Lb : TLabel;
    {$ENDIF}
  {$ENDIF}
begin
//  FClearKey:=false;
  Contr := nil;
  FLeft:=FIRST_LEFT;
  FMaxWidth:=0;
//  nLastPos:=200;
  FTop:=10;
  nTopStep:=GlobalStepY;
  OnGetProperty(nil,false);
  FDop := Self.Parent.Name;
//  Showmessage(inttostr(Win32MajorVersion));
  // определим максимальную длину подписи
  {$IFDEF STATIC_TEXT}
    Lb := TStaticText.Create(Self.Parent); //Self.Owner);
//    Lb := TRxLabel.Create(Self.Owner);
    Lb.ParentColor:=true;
    Lb.ParentFont:=false;
    Lb.Transparent:=false;
  {$ELSE}
    {$IFDEF RX_LABEL}
      Lb := TRxLabel.Create(Self.Parent);
    {$ELSE}
      Lb := TLabel.Create(Self.Owner);
    {$ENDIF}
  {$ENDIF}
  Lb.Parent := Self.Parent;
  Lb.Name := 'Label_Tmp';
  Lb.Width:=100;
  FProp.Clear;
  OnGetProperty( FProp, false );
  while not FProp.Eof do begin
    lb.Font.Size  := 10;
    lb.Font.Style := [];
    FontFromProp(lb.Font);
    if FProp.Visible then begin
      if FProp.PropType = tpCaption then begin
        nCurWidth := FProp.PropWidth;
      end else begin
        if FProp.Caption='' then begin
          nCurWidth:=0;
        end else begin
          Lb.Caption := StringReplace( FProp.Caption, 'CRLF', #13#10, [rfReplaceAll]);
//          nCurWidth := Lb.Width;
          nCurWidth :=GetTextWidth(Lb.Caption, lb.Font.Height, lb.Font.Name, false);

        end;
      end;
      FMaxWidth := Max(FMaxWidth,nCurWidth);
    end;
    FProp.Clear;
    OnGetProperty(FProp,true);
  end;

  FMaxWidth:=FMaxWidth+10;
  FMaxWidth:=Ceil(FMaxWidth*(FPixelsPerInch/Default_PixelsPerInch));
  if (Win32MajorVersion>=6)
    then FMaxWidth:=FMaxWidth+20;

  Lb.Free;
  OnGetProperty(nil,false);
  i:=0;
  j:=0;
  FProp.Clear;
  OnGetProperty(FProp,false);
  while not FProp.Eof do begin
    if FProp.Visible then begin
      if FProp.PropType = tpCaption then begin
        Inc(j,1);
        ed := TDbEditEh.Create(Self.Owner);
        with ed do begin
          Text:='';
          Parent  := Self.Parent;
          FontFromProp(Font);
          DataSource := FProp.DataSource;
          DataField  := FProp.DataField;
          Name  := FDop+'_RT_Edit' + IntToStr(j);
          Top   := FTop+1;
          Left  := FLeft;
          Width := FProp.PropWidth;
          Flat := FFlat;
        end;
      end else if FProp.PropType = tpConst then begin
        Inc(i,1);
        {$IFDEF STATIC_TEXT}
          Lb := TStaticText.Create(Self.Parent);  // было Self.Owner
//          Lb := TRxLabel.Create(Self.Owner);
          Lb.Parent := Self.Parent;
//          Lb.ParentFont:=false;
          Lb.ParentColor:=true;
          Lb.Transparent:=true;

//          Lb.Parent := Self.Parent;
//          Lb.ParentFont:=false;
//          Lb.ParentColor:=true;
//          Lb.Transparent:=true;

//          lb.AutoSize:=false;
//          lb.Width:=FMaxWidth;
//          lb.BevelKind:=bkFlat;
        {$ELSE}
          {$IFDEF RX_LABEL}
            Lb := TRxLabel.Create(Self.Parent);
            Lb.Parent := Self.Parent;
            Lb.ParentFont:=false;
            Lb.ParentColor:=true;
            Lb.Transparent:=true;
          {$ELSE}
            Lb := TLabel.Create(Self.Owner);
            Lb.Parent := Self.Parent;
          {$ENDIF}
        {$ENDIF}
        Lb.Name := FDop+'_RT_Label' + IntToStr(i);
        FontFromProp(Lb.Font);
        if LabelColor<>0
          then Lb.Color:=LabelColor;
        Lb.Caption:=StringReplace( FProp.Caption, 'CRLF', #13#10, [rfReplaceAll]);
        if (FPixelsPerInch>Default_PixelsPerInch) and (Win32MajorVersion>=6) then begin
          Lb.Caption:=Lb.Caption+StringOfChar(' ',100)+'.';
        end;
//        Lb.Width:=GetTextWidth(Lb.Caption, lb.Font.Height, lb.Font.Name, false);
        if FFlat then Lb.Top:=FTop+2 else Lb.Top:=FTop+3;
        Lb.Left := FLeft;
        FTop:=FTop+nTopStep;
      end else begin
        Inc(i,1);
        Lb:=nil;
        if (FProp.Caption<>'') and (Copy(FProp.Caption,1,1)<>'!') then begin
          {$IFDEF STATIC_TEXT}
          Lb := TStaticText.Create(Self.Parent);    // было Self.Owner
          Lb.Parent := Self.Parent;
//          Lb.ParentFont:=false;
          Lb.ParentColor:=true;
          Lb.Transparent:=true;

//            Lb.Parent := Self.Parent;
//            Lb.ParentColor:=true;
//            Lb.ParentFont:=false;
//            Lb.Transparent:=true;

//            lb.AutoSize:=false;
//            lb.BevelKind:=bkFlat;
//            lb.Width:=FMaxWidth;
          {$ELSE}
            {$IFDEF RX_LABEL}
              Lb := TRxLabel.Create(Self.Parent);
              Lb.Parent := Self.Parent;
              Lb.ParentFont:=false;
              Lb.ParentColor:=true;
              Lb.Transparent:=true;
            {$ELSE}
              Lb := TLabel.Create(Self.Owner);
              Lb.Parent := Self.Parent;
            {$ENDIF}
          {$ENDIF}
          Lb.Name := FDop+'_RT_Label' + IntToStr(i);
          FontFromProp(Lb.Font);
          if LabelColor<>0
            then Lb.Color:=LabelColor;
          Lb.Caption := StringReplace( FProp.Caption, 'CRLF', #13#10, [rfReplaceAll]);
          if (FPixelsPerInch>Default_PixelsPerInch) and (Win32MajorVersion>=6) then begin
//            s:=Lb.Caption;
            Lb.Caption:=Lb.Caption+StringOfChar(' ',100)+'.';
//            Lb.Caption:=s;
          end;
          if FFlat then Lb.Top:=FTop+2 else Lb.Top:=FTop+3;
          Lb.Left := FLeft;
        end;
        Inc(j,1);
        CreateOneControl(j,lTopPlus);
        if lTopPlus then
          FTop:=FTop+nTopStep;
        if Lb<>nil then begin
          CreateBevel(j);
        end;
      end;
    end;
    FProp.Clear;
    OnGetProperty(FProp,true);
  end;
  if Contr <> nil then begin
    Owner.ActiveControl:=Contr;
    Owner.ActiveControl.HelpContext:=888;
    TWinControl(Parent.Controls[Parent.ControlCount-1]).HelpContext:=999;
  end;
//  OwnerClientHeight := Min(550,nTop+60);
//  ClientWidth  := nLastPos+5;
//  if FAdd then begin
//    FGrid.DataSource.DataSet.Append;
//  end else begin
//    FGrid.DataSource.DataSet.Edit;
//  end;
end;

procedure TCreateControls.CreateOneControl( n : Integer; var lTopPlus:Boolean );
var
  ed  : TDbEditEh;
  edL : TDbLookupComboBoxEh;
  edC : TDbComboBoxEh;
  edD : TDBDateTimeEditEh;
  edN : TDBNumberEditEh;
  bt  : TEditButtonEh;
  Opis : TOpisEdit;
  tt   : TvchDbText;
  nLeft, i : Integer;
  c : TWinControl;
begin
//FMaxWidth:=200;
  if FMaxWidth=0 then begin
    nLeft := 10;
  end else begin
//    nLeft := FLeft+20+FMaxWidth;
    nLeft := FLeft+FMaxWidth;
  end;
  c:=nil;
  lTopPlus:=true;
  if FProp.AsLabel then begin  //создаем контрол на месте Label
    nLeft:=FIRST_LEFT;
    lTopPlus:=false;
  end;
  case FProp.PropType of
    tpOpisEdit : begin
           if GetTypeOpisFromName(FProp.NameOpisEdit) = teList then begin
             edC:=TDbComboBoxEh.Create(Self.Owner);
             c:=edC;
             with edC do begin
               if GlobalTask.CurrentOpisEdit.GetListOpis(FProp.NameOpisEdit, Items, KeyItems) then begin
                 EditButton.Style   := ebsDropDownEh;
                 EditButton.Visible := true;
               end else begin
                 EditButton.Visible := false;
               end;
               Name := FDop+'_Edit' + IntToStr(n);
               Parent  := Self.Parent;
               FontFromProp(Font);
               DataSource := FProp.DataSource;
               DataField  := FProp.DataField;
               Top := FTop;
               if not lTopPlus then Top:=Top+1;
               Left := nLeft;
               Width := FProp.PropWidth;
               Flat := FFlat;
             end;
           end else begin
             edL  := nil;
             Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(FProp.NameOpisEdit);
             if Opis<>nil then begin
               if (Opis.TypeEditSpr=tesLookup) or (Opis.TypeEditSpr=tesLookupPlusEdit) then begin
                 edL := TDbLookupComboboxEh.Create(Self.Owner);
                 c:=edL;
                 edL.Tag := Integer(Opis);
                 with edL do begin
                   Name := FDop+'_Edit' + IntToStr(n);
                   Parent  := Self.Parent;
                   FontFromProp(Font);
                   DataSource := FProp.DataSource;
                   DataField  := FProp.DataField;
                   Top := FTop;
                   Left := nLeft;
                   Width := FProp.PropWidth;
                   Flat := FFlat;
                   Opis.ListSource.DataSet := Opis.DataSet;
                   ListSource := Opis.ListSource;
                   ListField  := Opis.DisplayField;
                   ListFieldIndex := 0;
                   KeyField := Opis.ResultField;
                 end;
                 if Opis.TypeEditSpr=tesLookupPlusEdit then begin
                   bt := edL.EditButtons.Add;
                   bt.Visible:=true;
                   bt.Style := ebsEllipsisEh;
                   edL.Tag := Integer(Opis);
                   bt.OnClick := TEvents.EditButtons_OnClick;
                   bt.OnDown  := TEvents.EditButtons_OnDown;
                   bt.Visible := true;
                 end;
               end;
             end;
             if edL=nil then begin
               ed := TDbEditEh.Create(Self.Owner);
               c:=ed;
               bt := ed.EditButtons.Add;
               bt.Visible:=true;
               if Opis<>nil then begin
                 ed.Tag := Integer(Opis);
                 bt.OnClick := TEvents.EditButtons_OnClick;
                 bt.OnDown  := TEvents.EditButtons_OnDown;
                 bt.Visible := true;
                 bt.Style := ebsEllipsisEh;
               end;
               with ed do begin
                 Name := FDop+'_Edit' + IntToStr(n);
                 Parent  := Self.Parent;
                 FontFromProp(Font);
                 DataSource := FProp.DataSource;
                 DataField  := FProp.DataField;
                 Top := FTop;
                 Left := nLeft;
                 Width := FProp.PropWidth;
                 Flat := FFlat;
               end;
               if (Opis<>nil) and not Opis.MultiSelect and not Opis.ValuePlus then begin
                 tt := TvchDbText.Create(Self.Owner);
                 tt.Parent := Self.Parent;
                 tt.Name := FDop+'_dbText' + IntToStr(n);
                 FontFromProp(tt.Font);
                 tt.Tag := Integer(Opis);
                 tt.OnGetText := DBTextGetText;
                 tt.DataField := FProp.DataField;
                 tt.DataSource:= FProp.DataSource;
                 if FFlat then tt.Top:=FTop+2 else tt.Top:=FTop+3;
                 tt.Width := FProp.PropWidthSpr;
                 tt.Left  := ed.Left + ed.Width + 5;
               end;
             end;
           end;
           end;
    tpString : begin
                ed := TDbEditEh.Create(Self.Owner);
                c:=ed;
                with ed do begin
                  Text:='';
                  Name := FDop+'_Edit' + IntToStr(n);
                  Parent  := Self.Parent;
                  FontFromProp(Font);
                  DataSource := FProp.DataSource;
                  DataField  := FProp.DataField;
                  Top  := FTop;
                  Left := nLeft;
                  Width := FProp.PropWidth;
                  Flat := FFlat;
                end;
               end;
    tpMemo  : begin
                ed := TDbEditEh.Create(Self.Owner);
                c:=ed;
                bt := ed.EditButtons.Add;
                bt.Visible:=true;
                bt.OnClick := OnEditMemo;
                with ed do begin
                  Parent  := Self.Parent;
                  DataSource := FProp.DataSource;
                  DataField  := FProp.DataField;
                  Name  := FDop+'_Edit' + IntToStr(n);
                  FontFromProp(Font);
                  Top   := FTop;
                  Left  := nLeft;
                  Width := FProp.PropWidth;
                  Flat  := FFlat;
                end;
              end;
    tpDate   : begin
                edD:=TDBDateTimeEditEh.Create(Self.Owner);
                c:=edD;
                with edD do begin
                  Name := FDop+'_Edit' + IntToStr(n);
                  Parent  := Self.Parent;
                  FontFromProp(Font);
                  DataSource := FProp.DataSource;
                  DataField  := FProp.DataField;
                  Top := FTop;
                  Left := nLeft;
                  Width := FProp.PropWidth;
                  Flat := FFlat;
                end;
               end;
   tpNumber  : begin
                 edN:=TDBNumberEditEh.Create(Self.Owner);
                 c:=edN;
                 with edN do begin
                   Name := FDop+'_Edit' + IntToStr(n);
                   Parent  := Self.Parent;
                   FontFromProp(Font);
                   if FProp.MinValue<>-1 then MinValue:=FProp.MinValue;
                   if FProp.MaxValue<>-1 then MaxValue:=FProp.MaxValue;
                   if FProp.DisplayFormat<>'' then DisplayFormat:=FProp.DisplayFormat;
                   if FProp.EditMask<>'' then begin
//                     if Pos(FProp.EditMask,';')=0 then begin
//                       EditMask := FProp.EditMask+';0; ';
                       i := Pos('.',FProp.EditMask);
                       if i>0
                         then DecimalPlaces := Length(FProp.EditMask)-i
                         else DecimalPlaces := 0;
//                     end else begin
//                       EditMask := FProp.EditMask;
//                     end;
                   end;
                   DataSource := FProp.DataSource;
                   DataField  := FProp.DataField;
                   Top := FTop;
                   Left := nLeft;
                   Width := FProp.PropWidth;
                   Flat := FFlat;
                 end;
               end;
   tpBoolean: begin
                edC:=TDbComboBoxEh.Create(Self.Owner);
                c:=edC;
                with edC do begin
                  Parent  := Self.Parent;
                  Name  := FDop+'_Edit' + IntToStr(n);
                  FontFromProp(Font);
                  Items.Add('Да');
                  Items.Add('Нет');
                  KeyItems.Add('1');
                  KeyItems.Add('0');
                  DataSource := FProp.DataSource;
                  DataField  := FProp.DataField;
                  Top   := FTop;
                  Left  := nLeft;
                  Width := 70;
                  Flat  := FFlat;
                end;
                end;
  end;
  if c<>nil then begin
    if Assigned(FOnCreateControl) then begin
      FOnCreateControl(c,FProp);
    end;
  end;
end;

procedure TCreateControls.SetParent(const Value: TWinControl);
begin
  FParent := Value;
end;

procedure TCreateControls.SetOwner(const Value: TForm);
begin
  FOwner := Value;
  try
    if FOwner<>nil
      then FPixelsPerInch:=Owner.PixelsPerInch
      else FPixelsPerInch:=Application.MainForm.PixelsPerInch
  except
    FPixelsPerInch:=Default_PixelsPerInch;
  end;
end;

procedure TCreateControls.OnEditMemo(Sender: TObject; var Handled: Boolean);
var
  ds : TDataSet;
//  strField : String;
  ed : TDbEditEh;
  sValue : String;
begin
  if Sender is TDbEditEh then begin
    ed := TDbEditEh(Sender);
  end else begin
    ed := TDbEditEh(TComponent(Sender).Owner);
  end;
  {
  s:='Label'+Trim(Copy(ed.Name,5,20));
  c := sb.FindComponent(s);
  s:='';
  if c<>nil then begin
    s :=TLabel(c).Caption;
  end;
  }
  sValue := ed.Text;
  if EditMemo(sValue, 'Значение') then begin
    ed.Text := sValue;
    if (ed.DataSource<>nil) and (ed.DataSource.DataSet<>nil) and
        (ed.DataField<>'') then begin
      ds := ed.DataSource.DataSet;
      if (ds.State<>dsEdit) and (ds.State<>dsInsert) then begin
        ds.Edit;
      end;
      ds.FieldByName(ed.DataField).AsString := sValue;
    end;
    Handled := true;
  end;
  {
  ds := ed.DataSource.DataSet;
  strField := ed.Field.FieldName;
  if EditMemo(ds, strField, 'Значение') then begin
    Handled := true;
  end;
  }
end;

procedure TCreateControls.DBTextGetText(Sender: TObject; var Text: String);
var
  Opis : TOpisEdit;
  ds   : TDataSet;
  ss   : String;
begin
  if TObject(TComponent(Sender).Tag) is TOpisEdit then begin
    Opis := TOpisEdit(TComponent(Sender).Tag);
    if (Opis.DataSet<>nil) and not Opis.MultiSelect then begin
      ds := TvchDBText(Sender).DataSource.DataSet;
      ss := TvchDBText(Sender).DataField;
      if ds.FieldByName(ss).IsNull or (ds.FieldByName(ss).AsString='') then begin
        Text := '';
      end else begin
        if Opis.FieldForNaim<>'' then begin
          if Opis.DataSet.Locate(Opis.ResultField,ds.FieldByName(ss).AsString,[]) then begin
            Text := Opis.DataSet.FieldByName(Opis.FieldForNaim).AsString;
          end else begin
            Text := '';
          end;
        end else begin
          Text := ''
        end;
      end;
    end;
  end;
end;

procedure TCreateControls.FontFromProp(fn: TFont);
begin
  if FProp.FontSize > 0
    then fn.Size := FProp.FontSize
    else fn.Size := 10;  // vadim
  fn.Height:=-13;  // vadim
  if FProp.FontBold
    then fn.Style := fn.Style + [fsBold];
  if FProp.FontItalic
    then fn.Style := fn.Style + [fsItalic];
  if FProp.FontUnderline
    then fn.Style := fn.Style + [fsUnderline];
end;

procedure TCreateControls.CreateBevel( n : Integer );
var
  Lb : TBevel;
begin
  if FCreateBevel then begin
    Lb := TBevel.Create(Self.Owner);
    Lb.Name := FDop+'_RT_Bevel' + IntToStr(n);
    Lb.Parent := Self.Parent;
    Lb.Style := bsLowered;  //    bsLowered, bsRaised
    LB.Shape := bsTopLine;
    Lb.Left := FLeft;
    Lb.Height := 1;
    Lb.Top := FTop - 1;
    Lb.Width := FMaxWidth-10;
  end;
end;

procedure TCreateControls.SetLabelColor(const Value: TColor);
begin
  FLabelColor := Value;
end;

procedure TCreateControls.SetOnCreateControl( const Value: TEventCreateControl);
begin
  FOnCreateControl := Value;
end;

end.
