unit fParamQuest;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, Db, Math, FuncPr,
  ToolCtrlsEh, AddEvents, OpisEdit,MetaTask, DbFunc, vchDBCtrls, DBLookupEh
//  {$IFDEF DATASET_AS_ADS} ,adsdata, adsfunc, adstable {$ENDIF}
  ,Variants;

type

//  TTypeColumnEh = ( tcString, tcNumber, tcBoolean, tcDate, tcPickList, tcSpr);

  TTypeParamQ = (tpString, tpDate, tpNumber, tpBoolean, tpList, tpSpr, tpLookUp,
                 tpDir, tpFile,
                 tpMonth, tpKvartal, tpYear, tpRemoteDisk );

  TParamQ = class(TObject)
  public
    Control : TCustomDBEditEh;
    Kod     : String;
    Value   : Variant;
    Caption : String;
    EditMask: String;
    TypeQ   : TTypeParamQ;
    Required:Boolean;
    ArrParams : TArrStrings;
    function ParamAsString(strName : String) : String;
    function ParamAsInteger(strName : String) : Integer;
  end;

  TfmParamQuest = class(TForm)
    pn: TPanel;
    sb: TScrollBox;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
//    FAdd  : Boolean;
    FOkClik:Boolean;
    FClearKey : Boolean;
    FFlat: Boolean;
    FListParam : TList;
    FStepY: Integer;
    FListOpis: TListOpisEdit;
    FFontSize: Integer;
    FListLabel : TList;
    FResult : Integer;
    FResultEvent : Integer;
    FCreateControls : Boolean;
    FListCheckOpis:TStringList;
    FCheckLang: Boolean;
    FAllRequired: Boolean;
    procedure SetFlat(const Value: Boolean);
    procedure SetStepY(const Value: Integer);
    procedure SetListOpis(const Value: TListOpisEdit);
    procedure SetFontSize(const Value: Integer);
    procedure OnChangeSpr( Sender : TObject);
    procedure SetCheckLang(const Value: Boolean);
    function  CheckValue(var sErr:String): Boolean;
    procedure SetAllRequired(const Value: Boolean);
  public
    EventUpdateActions: TNotifyEvent;
    EventOkClick: TNotifyEvent;

    arrBt   : array of TButton;
    arrCont : array of TWinControl;
    arrST   : array of TStaticText;

    function getControl(n:Integer):TWinControl;
    function getST(n:Integer):TStaticText;
    function getButtom(n:Integer):TButton;

    procedure CreateControls;
    function IsEnableEditing( nCol : Integer) : Boolean;
    constructor Create( Owner : TComponent ); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure AddParamEx(Value : Variant; strCaption : String; strKod : String;  strParam : String);
    procedure AddParam(strKod : String; strCaption : String; strParam : String);
    function  ParamCount : Integer;
    function  GetParam( n : Integer) : TParamQ;
    procedure SetValues( arrValues : TArrVariant );
    procedure SetValue( strKod : String; Value : Variant );
    function  GetValue( strKod : String; strType : String='') : Variant;
    function  GetValueAsText( strKod : String) : String;
    procedure SetValueN( n : Integer; Value : Variant );
    function  GetValueN( n : Integer) : Variant;
    procedure AddButtons(strButtons : String; nEsc : Integer);
    procedure CreateListDisk(ed:TDbComboBoxEh);
    function ShowQuest : Integer;
    procedure SetResultEvent(n:Integer);
    property ListOpis : TListOpisEdit read FListOpis write SetListOpis;
  published
    property AllRequired : Boolean read FAllRequired write SetAllRequired;
    property Flat : Boolean read FFlat write SetFlat;
    property StepY : Integer read FStepY write SetStepY default 25;
    property FontSize : Integer read FFontSize write SetFontSize default 0;
    property CheckLang: Boolean read FCheckLang write SetCheckLang default false ;
  end;

procedure SetFontParamQuest(nFontSize:Integer; lFlat:Boolean);

implementation

//var
//  fmRecordGrid: TfmRecordGrid;

var
  FontSize_Form:Integer;
  Flat_Form:Boolean;
  StepY_Form:Integer;
  Bold_Form:Boolean;


{$R *.DFM}

//----------------------------------------------------------------------------
procedure SetFontParamQuest(nFontSize:Integer; lFlat:Boolean);
var
  n1,n2:Integer;
begin
  FontSize_Form:=nFontSize;
  ParamsFromFontSize(nFontSize,StepY_Form,n1,n2);
end;

//----------------------------------------------------------------------------
function TfmParamQuest.IsEnableEditing( nCol : Integer) : Boolean;
begin
  Result := true;
  {
  if FGrid.Columns[nCol].Visible and (FGrid.Columns[nCol].Field.FieldKind=fkdata) and
    (FGrid.Columns[nCol].Field.DataType<>ftAutoinc) then begin
    Result := true;
  end else begin
    Result := false;
  end;
  }
end;

function TfmParamQuest.getControl(n:Integer):TWinControl;
begin
  Result:=arrCont[n];
end;
function TfmParamQuest.getST(n:Integer):TStaticText;
begin
  Result:=arrSt[n];
end;
function TfmParamQuest.getButtom(n:Integer):TButton;
begin
  Result:=arrBt[n];
end;
procedure TfmParamQuest.UpdateActions;
begin
  inherited;
  if Assigned(EventUpdateActions)
    then EventUpdateActions(Self);
end;


procedure TfmParamQuest.CreateControls;
var
  i,n,m,j : Integer;
  nTop,nLeft, nMaxWidth : Integer;
  ed : TDbEditEh;
  cb : TDBComboBoxEh;
  bt : TEditButtonEh;
  lFirst : Boolean;
  Contr,cc : TWinControl;
  nCount,nLastPos,nSm : Integer;
  p : TParamQ;
  OpisEdit : TOpisEdit;
  s,sAdd : String;
  ds : TDataSource;
//  lb : TLabel;
  lb: TStaticText;
  c:TColumnEh;
  arr:TArrStrings;
  st:TStaticText;
begin
  if FCreateControls then exit;
  FCreateControls:=true;
  FClearKey:=false;
  Contr := nil;
  nLeft:=10;
  nMaxWidth:=50;
  nLastPos:=200;
  nTop:=10;
  nCount:=0;
  for i:=0 to ParamCount-1 do begin
    if IsEnableEditing(i) then begin
      nCount:=nCount+1;
    end;
  end;
  SetLength(arrST,nCount);
  SetLength(arrCont,nCount);
  j:=0;
  for i:=0 to ParamCount-1 do begin
    if IsEnableEditing(i) then begin
      p:=getParam(i);
      st:=TStaticText.Create(sb);
      st.Parent  := sb;
      st.Caption := StringReplace( p.Caption, '|', ' ', [rfReplaceAll]);
      if FontSize > 0 then st.Font.Size := FontSize;
      st.Name := 'Label' + IntToStr(i);
      if FFlat then begin
        st.Top := nTop+2;
      end else begin
        st.Top := nTop+3;
      end;
      st.Left:=nLeft;
      nMaxWidth:=Max(nMaxWidth,st.Width);
      nTop:=nTop+StepY;
      arrST[j]:=st;
      j:=j+1;
    end;
  end;
  nTop:=10;
  nSm:=30;
  lFirst := false;
  j:=0;
  for i:=0 to ParamCount-1 do begin
    if IsEnableEditing(i) then begin
      p := GetParam(i);
      if CheckLang then begin
        s := p.ParamAsString('LANG');
        if Copy(s,1,1)='B' then sAdd:='BLR_' else if Copy(s,1,1)='E' then sAdd:='ENG_' else sAdd:='RUS_';
      end else begin
        sAdd:='';
      end;
      //  LIST=TYPE_DOK~WIDTH=300
      case p.TypeQ of
       tpList:begin
                p.Control := TDbComboBoxEh.Create(sb);
                with TDbComboBoxEh(p.Control) do begin
                  ListOpis.GetListOpis(p.ParamAsString('DESC'),Items,KeyItems);
                  Parent  := sb;
                  Name := sAdd+'Edit' + IntToStr(i);
                  if FontSize > 0 then Font.Size := FontSize;
                  Top := nTop;
                  Left := nLeft+nSm+nMaxWidth;
                  n := p.ParamAsInteger('WIDTH');
                  if n<=0 then begin
                    n:=Canvas.TextWidth(VarToStr(p.Value))+50;
                  end;
                  Width := n;
                  Flat := FFlat;
                end;
              end;
       tpString : begin
                    ed := TDbEditEh.Create(sb);
                    p.Control := ed;
                    with ed do begin
                      if p.EditMask<>''
                        then ed.EditMask:=p.EditMask;
                      Parent  := sb;
                      Name := sAdd+'Edit' + IntToStr(i);
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=Canvas.TextWidth(VarToStr(p.Value))+50;
                      end;
                      Width := n;
                      Flat := FFlat;
                    end;
                  end;
        tpDate  :  begin
                    p.Control := TDBDateTimeEditEh.Create(sb);
                    with TDBDateTimeEditEh(p.Control) do begin
                      if p.EditMask<>''
                        then EditMask:=p.EditMask;
                      Parent  := sb;
                      Name := 'Edit' + IntToStr(i);
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=120;
                      end;
                      Width := n;
                      Flat := FFlat;
                    end;
                  end;
        tpNumber,tpYear:  begin
                    p.Control := TDBNumberEditEh.Create(sb);
                    with TDBNumberEditEh(p.Control) do begin
                      if p.EditMask<>''
                        then EditMask:=p.EditMask;
                      Parent  := sb;
                      Name := 'Edit' + IntToStr(i);
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      s := p.ParamAsString('MIN');
                      if s <> '' then begin
                        MinValue:=StrToInt(s);
                      end;
                      s := p.ParamAsString('MAX');
                      if s <> '' then begin
                        MaxValue:=StrToInt(s);
                      end;
                      if p.TypeQ=tpYear then begin
                        EditButton.Style:=ebsUpDownEh;
                        EditButton.Visible:=true;
                      end;
                      s := p.ParamAsString('FORMAT');
                      if s <> '' then begin
                        DisplayFormat := s;
                        m := Pos('.',s);
                        if m > 0 then begin
                          DecimalPlaces := Length(s)-m;
                        end else begin
                          DecimalPlaces := 0;
                        end;
                      end else begin
                        DisplayFormat:='';
                      end;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        if p.TypeQ=tpYear then begin
                          n:=Canvas.TextWidth('9999')+20;
                        end else if DisplayFormat='' then begin
                          n:=Canvas.TextWidth('999999999999999')+20;
                        end else begin
                          n:=Canvas.TextWidth(DisplayFormat)+20;
                        end;
                      end;
                      Width:=n;
                      Flat:=FFlat;
                    end;
                  end;
        tpBoolean: begin
                     cb := TDbComboBoxEh.Create(sb);
                     p.Control := cb;
                     cb.Items.Add('Да');
                     cb.Items.Add('Нет');
                     cb.KeyItems.Add('1');
                     cb.KeyItems.Add('0');
                     if p.Value
                       then cb.Value := 1
                       else cb.Value := 0;

                     cb.Parent  := sb;
                     cb.Name := 'Edit' + IntToStr(i);
                     if FontSize > 0 then cb.Font.Size := FontSize;
                     cb.Top := nTop;
                     cb.Left := nLeft+nSm+nMaxWidth;
                     n:=p.ParamAsInteger('WIDTH');
                     if n<=0 then n:=50;
                     cb.Width := n;
                     cb.Flat := FFlat;
                   end;
        tpMonth  : begin
                     p.Control := TDbComboBoxEh.Create(sb);
                     with TDbComboBoxEh(p.Control) do begin
                        DropDownBox.Rows:=12;
                        Items.Add('Январь');
                        Items.Add('Февраль');
                        Items.Add('Март');
                        Items.Add('Апрель');
                        Items.Add('Май');
                        Items.Add('Июнь');
                        Items.Add('Июль');
                        Items.Add('Август');
                        Items.Add('Сентябрь');
                        Items.Add('Октябрь');
                        Items.Add('Ноябрь');
                        Items.Add('Декабрь');
                        KeyItems.Add('1');
                        KeyItems.Add('2');
                        KeyItems.Add('3');
                        KeyItems.Add('4');
                        KeyItems.Add('5');
                        KeyItems.Add('6');
                        KeyItems.Add('7');
                        KeyItems.Add('8');
                        KeyItems.Add('9');
                        KeyItems.Add('10');
                        KeyItems.Add('11');
                        KeyItems.Add('12');
                        Parent  := sb;
                        Name := 'Edit' + IntToStr(i);
                        if FontSize > 0 then Font.Size := FontSize;
                        Top := nTop;
                        Left := nLeft+nSm+nMaxWidth;
                        n := p.ParamAsInteger('WIDTH');
                        if n<=0 then begin
                          n:=100;
                        end;
                        Width := n;
                        Flat := FFlat;
                     end;
                   end;
        tpKvartal: begin
                     p.Control := TDbComboBoxEh.Create(sb);
                     with TDbComboBoxEh(p.Control) do begin
                        Items.Add('I квартал');
                        Items.Add('II квартал');
                        Items.Add('III квартал');
                        Items.Add('IV квартал');
                        KeyItems.Add('1');
                        KeyItems.Add('2');
                        KeyItems.Add('3');
                        KeyItems.Add('4');
                        Parent  := sb;
                        Name := 'Edit' + IntToStr(i);
                        if FontSize > 0 then Font.Size := FontSize;
                        Top := nTop;
                        Left := nLeft+nSm+nMaxWidth;
                        n := p.ParamAsInteger('WIDTH');
                        if n<=0 then begin
                          n:=100;
                        end;
                        Width := n;
                        Flat := FFlat;
                     end;
                   end;
        tpLookUp:  begin
                    p.Control := TDBLookUpComboBoxEh.Create(sb);
                    with TDBLookUpComboBoxEh(p.Control) do begin
                      Parent  := sb;
                      Name := sAdd+'Edit' + IntToStr(i);
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=200;
                      end;
                      Width:=n;
                      OpisEdit := ListOpis.GetSprOpisA(p.ParamAsString('DESC'));
                      if OpisEdit <> nil then begin
                        ds := TDataSource.Create(sb);
                        ds.DataSet := OpisEdit.DataSet; // Table;
                        ListSource := ds;
                        ListField := StringReplace(OpisEdit.DisplayField,',',';',[rfReplaceAll]);
                        s:=p.ParamAsString('BOX');
                        if (s<>'') and (Pos(s,',')=0) then begin
                          DropDownBox.Width:=StrToIntDef(s,Width);
                        end;
                        if Pos(';',ListField)>0 then begin
                          if s<>'' then begin
                            StrToArr(s,arr,',',true);
                            m:=0;
                            for n:=0 to Length(OpisEdit.ArrDisplayFld)-1 do begin
                              c:=DropDownBox.Columns.Add;
                              c.Width:=StrToIntDef(arr[n],0);
                              m:=m+c.Width;
                              c.FieldName:=OpisEdit.ArrDisplayFld[n];
                            end;
                            DropDownBox.Width:=m;
                          end;
                        end;
                        ListFieldIndex:=0;
                        KeyField:=OpisEdit.ResultField;
                        if FListCheckOpis.IndexOf(p.ParamAsString('DESC'))=-1
                          then FListCheckOpis.AddObject(p.ParamAsString('DESC'), OpisEdit);
                      end;
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      Flat  := FFlat;
                    end;
                  end;
        tpSpr   : begin
                    ed := TDbEditEh.Create(sb);
                    p.Control := ed;
                    bt := ed.EditButtons.Add;
                    bt.Visible:=true;
                    OpisEdit := ListOpis.GetSprOpisA(p.ParamAsString('DESC'));
                    if OpisEdit<>nil then begin
                      ed.Tag := Integer(OpisEdit);
                      bt.OnClick := TEvents.EditButtons_OnClick;
                      bt.OnDown  := TEvents.EditButtons_OnDown;
                      bt.Visible := true;
                      if FListCheckOpis.IndexOf(p.ParamAsString('DESC'))=-1
                        then FListCheckOpis.AddObject(p.ParamAsString('DESC'), OpisEdit);
                    end;
                    with ed do begin
                      Parent  := sb;
                      Name := 'Edit' + IntToStr(i);
//                      DataSource := FGrid.DataSource;
//                      DataField  := FGrid.Columns[i].FieldName;
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=200;
                      end;
                      Width := n;
                      Flat := FFlat;
                      OnChange := OnChangeSpr;
                    end;
                    if (OpisEdit<>nil) then begin //and (p.ParamAsString('DOPSHOW')<>'') then begin
//                      ds := TDataSource.Create(sb);
//                      ds.DataSet:=OpisEdit.Table;
//                      lb := TLabel.Create(sb);
                      lb := TStaticText.Create(sb);
                      with lb do begin
                        Parent := sb;
                        Name := 'SprLabel' + IntToStr(i);
                        Top   := nTop+2;
                        Left  := ed.Left+ed.Width+10;
                        Width := 200;
                        FocusControl := ed;
                        //LayOut := tlCenter;
                        Caption:='';
                      end;
                      FListLabel.Add(lb);
                    end;
                  end;
        tpFile   : begin
                    ed := TDbEditEh.Create(sb);
                    p.Control := ed;
                    bt := ed.EditButtons.Add;
                    bt.Visible:=true;
                    bt.OnClick := TEvents.EditButtonsFile_OnClick;
                    bt.Visible := true;
                    bt.Style:=ebsEllipsisEh;
                    with ed do begin
                      Parent  := sb;
//                      DataSource := FGrid.DataSource;
//                      DataField  := FGrid.Columns[i].FieldName;
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=200;
                      end;
                      Width := n;
                      Flat := FFlat;
                    end;
                  end;
        tpRemoteDisk: begin
                     p.Control := TDbComboBoxEh.Create(sb);
                     CreateListDisk(TDbComboBoxEh(p.Control));
                     with TDbComboBoxEh(p.Control) do begin
                        Parent  := sb;
                        Name := 'Edit' + IntToStr(i);
                        if FontSize > 0 then Font.Size := FontSize;
                        Top := nTop;
                        Left := nLeft+nSm+nMaxWidth;
                        n := p.ParamAsInteger('WIDTH');
                        if n<=0 then begin
                          n:=100;
                        end;
                        Width := n;
                        Flat := FFlat;
                     end;
                   end;
        tpDir  : begin
                    ed := TDbEditEh.Create(sb);
                    p.Control := ed;
                    bt := ed.EditButtons.Add;
                    bt.Visible:=true;
                    bt.OnClick := TEvents.EditButtonsDir_OnClick;
                    bt.Visible := true;
                    bt.Style:=ebsEllipsisEh;
                    with ed do begin
                      Parent  := sb;
                      if FontSize > 0 then Font.Size := FontSize;
                      Top := nTop;
                      Left := nLeft+nSm+nMaxWidth;
                      n := p.ParamAsInteger('WIDTH');
                      if n<=0 then begin
                        n:=200;
                      end;
                      Width := n;
                      Flat := FFlat;
                    end;
                  end;
      end;
      if p.Control <> nil then begin
        if (p.Value<>null) and (p.TypeQ<>tpBoolean) then begin
          p.Control.Value := p.Value;
        end;
      end;
      cc:=TWinControl(sb.Controls[sb.ControlCount-1]);
      if ((cc.Left+cc.Width)>nLastPos) then begin
        nLastPos:=cc.Left+cc.Width;
      end;
      arrCont[j]:=cc;
      j:=j+1;
      if not lFirst then begin
        lFirst:=true;
        Contr:=cc;
      end;
      nTop:=nTop+StepY;
    end;
  end;
  if Contr<>nil then begin
    ActiveControl:=Contr;
    ActiveControl.HelpContext:=888;
    TWinControl(sb.Controls[sb.ControlCount-1]).HelpContext:=999;
  end;
  ClientHeight := nTop + pn.Height + 10; // nTop+200;
  ClientWidth  := nLastPos+5;
  if Owner<>nil then begin // FCont<>nil then begin
    Position:=poOwnerFormCenter;
  end;
end;

procedure TfmParamQuest.CreateListDisk(ed:TDbComboBoxEh);
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
  d := GetLogicalDrives;
  ed.Items.Clear;
  ed.KeyItems.Clear;
  i:=1;
  for c:='A' to 'Z' do begin
    if (d and 1)<>0 then begin
      n := GetDriveType(PChar(c + ':/'));
      if n=DRIVE_REMOVABLE then begin
        ed.Items.Add(c);
        ed.KeyItems.Add(IntToStr(i));
      end;
    end;
    d := d shr 1;
    Inc(i,1);
  end;
  if ed.Items.Count > 0 then begin
    s := GlobalTask.GetLastValueAsString('DISK_VIGR');
    ed.ItemIndex := 0;
    n := ed.Items.IndexOf(s);
    if n > -1 then begin
      ed.ItemIndex := n;
    end;
  end else begin
    ed.ItemIndex := -1;
    ed.Enabled := false;
  end;
end;

procedure TfmParamQuest.SetFontSize(const Value: Integer);
begin
  FFontSize := Value;
  if FFontSize>0 then begin
    if FFontSize=8 then begin
      FStepY:=25;
    end else if FFontSize=10 then begin
      FStepY:=27;
    end else if FFontSize=11 then begin
      FStepY:=29;
    end else if FFontSize=12 then begin
      FStepY:=30;
    end else begin
      FStepY:=30;
    end;
  end else begin
    FStepY:=GlobalStepY;
  end;
end;

procedure TfmParamQuest.SetListOpis(const Value: TListOpisEdit);
begin
  FListOpis := Value;
end;

procedure TfmParamQuest.btCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmParamQuest.btOkClick(Sender: TObject);
var
  lErr : Boolean;
begin
  lErr := false;
  if not lErr then begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmParamQuest.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmParamQuest.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

constructor TfmParamQuest.Create(Owner: TComponent);
begin
  if Owner<>nil then begin
    Position:=poOwnerFormCenter;
  end;
  inherited Create(Owner);
  EventUpdateActions:=nil;
  EventOkClick:=nil;
  FOkClik:=false;
  FAllRequired:=false;
  FListParam := TList.Create;
  FListCheckOpis := TStringList.Create;
  FListOpis := GlobalTask.CurrentOpisEdit;
  FStepY:=GlobalStepY;
  FFlat:=GlobalFlat;
  if FontSize_Form>0 then begin
    FFontSize:=FontSize_Form;
    FStepY:=StepY_Form;
    FFlat:=Flat_Form;
  end;
  FListLabel := TList.Create;
  FCreateControls:=false;
end;

destructor TfmParamQuest.Destroy;
var
  i : Integer;
begin
  for i:=0 to FListParam.Count-1 do begin
    TParamQ(FListParam.Items[i]).Free;
  end;
  for i:=0 to FListCheckOpis.Count-1 do begin
    TOpisEdit(FListCheckOpis.Objects[i]).Cancel;
  end;
  FListParam.Free;
  FListLabel.Free;
  FListCheckOpis.Free;
  inherited Destroy;
end;

procedure TfmParamQuest.SetFlat(const Value: Boolean);
begin
  FFlat := Value;
end;

procedure TfmParamQuest.AddParam(strKod : String; strCaption : String; strParam : String);
begin
  AddParamEx( null, strCaption, strKod, strParam);
end;

procedure TfmParamQuest.AddParamEx(Value: Variant; strCaption, strKod, strParam: String);
var
 p : TParamQ;
 i,j : Integer;
 strType,s : String;
 d:TDateTime;
begin
//  if Value=null then exit;
  p := TParamQ.Create;
  p.Control:=nil;
  strKod := ANSIUpperCase(Trim(strKod));
  p.Kod := strKod;
  p.Caption := strCaption;
  p.Value := null;
  if (VarType(Value)=varString) and (Value='EMPTY') then begin
 //   p.Value := Value;
  end else begin
    p.Value := Value;
  end;
  p.ArrParams := StrToArr(strParam,'~',true);
  for i:=0 to Length(p.ArrParams)-1 do begin
    j:=Pos('=', p.ArrParams[i]);
    if j>0 then begin
      p.ArrParams[i] := ANSIUpperCase(Trim(Copy(p.ArrParams[i],1,j-1)))+
                         '='+Copy(p.ArrParams[i],j+1,Length(p.ArrParams[i]));
    end;
  end;
  FListParam.Add(p);

  s:=Trim(p.ParamAsString('EDITMASK'));
  if s<>'' then begin
    p.EditMask:=s;
  end;

  if p.ParamAsString('REQ')='1'
    then p.Required:=true
    else p.Required:=false;

  if p.Required
    then FOkClik:=true;

  strType := ANSIUpperCase(Trim(p.ParamAsString('TYPE')));
  if strType = 'LIST' then begin
    p.TypeQ:=tpList;
  end else if strType = 'SPR' then begin
    p.TypeQ:=tpSpr;
  end else if strType = 'LOOKUP' then begin
    p.TypeQ:=tpLookUp;
  end else if strType = 'FILE' then begin
    p.TypeQ:=tpFile;
  end else if strType = 'DIR' then begin
    p.TypeQ:=tpDir;
  end else if strType = 'REMOTEDISK' then begin
    p.TypeQ:=tpRemoteDisk;
  end else if strType = 'MONTH' then begin
    p.TypeQ:=tpMonth;
  end else if strType = 'KVARTAL' then begin
    p.TypeQ:=tpKvartal;
  end else if strType = 'YEAR' then begin
    p.TypeQ:=tpYear;
  end else if strType = 'STRING' then begin
    p.TypeQ:=tpString;
  end else if strType = 'BOOLEAN' then begin
    p.TypeQ:=tpBoolean;
    if (Value <> null) and (VarToStr(Value)<>'')
      then p.Value := VarAsType(Value, varBoolean);
  end else if strType = 'DATE' then begin
    p.TypeQ:=tpDate;
    try
      d:=VarToDateTime(Value);
    except
      d:=0;
    end;
    if d>0
      then p.Value:=d
      else p.Value:=null;
//    if (Value <> null) and (VarToStr(Value)<>'') and (VarToStr(Value)<>'EMPTY')
//      then p.Value := VarAsType(Value, varDate);
  end else if (Copy(strType,1,3) = 'NUM') or (Copy(strType,1,3) = 'INT') then begin
    p.TypeQ:=tpNumber;
  end else begin
    if (Value <> null) and (VarToStr(Value)<>'') then begin
      case VarType(p.Value) of
        varString : begin
                      p.TypeQ:=tpString;
                    end;
        varDate   : begin
                      p.TypeQ:=tpDate;
                    end;
        varBoolean: begin
                      p.TypeQ:=tpBoolean;
                    end;
        varByte,
        varInteger,
        varWord,
        varSmallint,
        varSingle,
        varDouble,
        varCurrency : begin
                        p.TypeQ:=tpNumber;
                      end;
      end;
    end else begin
      p.TypeQ:=tpString;
    end;
  end;
end;

function TfmParamQuest.CheckValue(var sErr:String): Boolean;
var
  i : Integer;
  p : TParamQ;
  v:Variant;
begin
  Result:=true;
  sErr:='';
  for i:=0 to FListParam.Count-1 do  begin
    p:=TParamQ(FListParam.Items[i]);
    if p.Required or FAllRequired then begin
      v:=GetValueN(i);
      if (v=null) or (VarToStr(v)='')
        then sErr:=sErr+p.Caption+#13#10;
    end;
  end;
  if sErr<>''
    then Result:=false;
  if Result and Assigned(EventOkClick) then begin
    Self.FResultEvent:=0;
    EventOkClick(Self);
    Result:=(Self.FResultEvent=1);
  end;
end;

function TfmParamQuest.GetValue(strKod: String; strType : String): Variant;
var
  i : Integer;
begin
  Result:=null;
  strKod := ANSIUpperCase(Trim(strKod));
  for i:=0 to FListParam.Count-1 do  begin
    if strKod = TParamQ(FListParam.Items[i]).Kod then begin
      Result := GetValueN(i);
      if strType <> '' then begin
        if (VarType(Result)=varEmpty) or (VarType(Result)=varNull) or
           (VarType(Result)=varUnknown) or (VarToStr(Result)='') then begin
          if strType='D' then begin
            Result := STOD('1899-12-30',tdAds);
          end else if (strType='N') or (strType='I') then begin
            Result := -1;
          end else if (strType='S') or (strType='C') then begin
            Result := '';
          end else if (strType='L') or (strType='B') then begin
            Result := false;
          end;
        end;
      end;
      exit;
    end;
  end;
end;

function TfmParamQuest.GetValueAsText(strKod: String): String;
var
  i : Integer;
begin
  Result:='';
  strKod := ANSIUpperCase(Trim(strKod));
  for i:=0 to FListParam.Count-1 do  begin
    if strKod = TParamQ(FListParam.Items[i]).Kod then begin
      Result:=TParamQ(FListParam.Items[i]).Control.Text;
      exit;
    end;
  end;
end;

function TfmParamQuest.GetValueN(n: Integer): Variant;
var
  p : TParamQ;
begin
  if n < FListParam.Count then begin
    p := TParamQ(FListParam.Items[n]);
    if p.Control<>nil then begin
      if p.TypeQ=tpBoolean then begin
        if VarToStr(p.Control.Value)='1'
          then Result := true else Result:=false;
      end else begin
        Result := p.Control.Value;
      end;
    end else begin
      Result:=p.Value;
    end;
  end else begin
    Result:=null;
  end;
end;

procedure TfmParamQuest.SetValue(strKod: String; Value: Variant);
var
  i : Integer;
begin
  strKod := ANSIUpperCase(Trim(strKod));
  for i:=0 to FListParam.Count-1 do  begin
    if strKod = TParamQ(FListParam.Items[i]).Kod then begin
      SetValueN(i, Value);
    end;
  end;
end;

procedure TfmParamQuest.SetValueN(n: Integer; Value: Variant);
var
  p : TParamQ;
begin
  if n < FListParam.Count then begin
    p := TParamQ(FListParam.Items[n]);
    if p.Control<>nil then begin
      if p.TypeQ=tpBoolean then begin
        if Value = true then begin
          p.Control.Value:=1;
        end else begin
          p.Control.Value:=0;
        end;
      end else if p.TypeQ=tpDate then begin
        if VarToStr(Value)<>''
          then p.Control.Value := Value;
      end else begin
        p.Control.Value := Value;
      end;
    end else begin
      p.Value := Value;
    end;
  end;
end;

procedure TfmParamQuest.SetValues(arrValues: TArrVariant);
var
  i : Integer;
begin
  for i:=Low(ArrValues) to High(ArrValues) do begin
    SetValueN(i, ArrValues[i]);
  end;
end;

function TfmParamQuest.ParamCount: Integer;
begin
  Result := FListParam.Count;
end;

function TfmParamQuest.GetParam(n: Integer): TParamQ;
begin
  Result := TParamQ(FListParam.Items[n]);
end;

procedure TfmParamQuest.SetStepY(const Value: Integer);
begin
  FStepY := Value;
end;

{ TParamQ }

function TParamQ.ParamAsInteger(strName: String): Integer;
var
  s : String;
begin
  Result := -1;
  try
    s := ParamAsString(strName);
    if s<>'' then begin
      Result := StrToInt(s);
    end;
  except
    Result := -1;
  end;
end;

function TParamQ.ParamAsString(strName: String): String;
var
  i,j : Integer;
begin
  Result:='';
  for i:=Low(ArrParams) to High(ArrParams) do begin
    j:=Pos('=',ArrParams[i]);
    if j>0 then begin
      if strName = Copy(ArrParams[i],1,j-1) then begin
        Result:= Copy(ArrParams[i],j+1,Length(ArrParams[i]));
        exit;
      end;
    end;
  end;
end;

procedure TfmParamQuest.SetResultEvent(n:Integer);
begin
  FResultEvent:=n;
end;

procedure TfmParamQuest.AddButtons(strButtons: String; nEsc : Integer);
var
  arr : TArrStrings;
  i, nMaxWidth, nLeft : Integer;
//  arrBt : array of TButton;
//  Canvas : TCanvas;
  Canvas : TControlCanvas;
  s : String;
  lOkBt:Boolean;
begin
  FResult:=nESC;
  StrToArr(strButtons, arr, '~', true);
  SetLength(arrBt,Length(arr));
  nMaxWidth:=30;
  for i:=Low(arr) to High(arr) do begin
    arrBt[i] := TButton.Create(pn);
    with arrBt[i] do begin
      Top:=5;
      if Pos('<OK>', arr[i])>0 then begin
        lOkBt:=true;
        arr[i]:=StringReplace(arr[i],'<OK>','',[rfIgnoreCase]);
      end else begin
        lOkBt:=false;
      end;
      Caption:=arr[i];
      s:=arr[i];
      CharDel(s,'&');
      arr[i]:=s;
      Parent  := pn;
      Anchors := [akRight,akTop];
      Name := 'Button' + IntToStr(i+1);
      if lOkBt or FOkClik
        then OnClick:=ButtonOkClick
        else OnClick:=ButtonClick;
//      if FontSize>0 then Font.Size := FontSize;
    end;
  end;
  Canvas := TControlCanvas.Create;
  Canvas.Control:=arrBt[0];
//  Canvas := c;
  for i:=Low(arr) to High(arr) do begin
    nMaxWidth:=Max(nMaxWidth, Canvas.TextWidth(arr[i])+20);
  end;
  Canvas.Free;
  nLeft := pn.Width - nMaxWidth - 10;
  for i:=High(arr) downto Low(arr) do begin
    arrBt[i].Width := nMaxWidth;
    arrBt[i].Left := nLeft;
    nLeft := arrBt[i].Left - nMaxWidth - 10;
  end;
end;

procedure TfmParamQuest.ButtonClick(Sender: TObject);
begin
  FResult := StrToInt( Copy(TComponent(Sender).Name, 7, 3) );
  ModalResult := mrOk;
end;
procedure TfmParamQuest.ButtonOkClick(Sender: TObject);
var
  sErr:String;
begin
  FResult:=StrToInt( Copy(TComponent(Sender).Name, 7, 3) );
  if CheckValue(sErr) then begin
    ModalResult:=mrOk;
  end else begin
    if sErr<>''
      then PutError('Требуется значение: '+#13#10+sErr);
  end;
end;

function TfmParamQuest.ShowQuest: Integer;
begin
  CreateControls;
  ShowModal;
  Result:=FResult;
end;

{
procedure TfmParamQuest.OnButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Handled:=true;
//  v := tbValuesVALUE.AsString;
  v:=null;
  if GlobalTask.ListOpis. ChoiceFromSpr( v, arrRec ) then begin
//    tbValues.Edit;
//    tbValuesVALUE.AsString := v;
//    tbValues.Post;
  end;
end;
}
procedure TfmParamQuest.OnChangeSpr(Sender: TObject);
var
//  i,n,m,Code : Integer;
  i : Integer;
  strName : String;
  ds : TDataSet;
  st : TSostTable;
  v : Variant;
  OpisEdit : TOpisEdit;
  s : String;
begin
  strName := 'SprLabel'+Copy(TComponent(Sender).Name, 5, 10);
  for i:=0 to FListLabel.Count-1 do begin
    if TLabel(FListLabel.Items[i]).Name = strName then begin
      OpisEdit := TOpisEdit(TComponent(Sender).Tag);
      ds := OpisEdit.Table;
      v:=TCustomDbEditEh(Sender).Value;
      s := '';
      if (v<>null) and (VarToStr(v)<>'') then begin
        st := SaveSostDataSet(ds, true);
        if ds.Locate(OpisEdit.ResultField, v, []) then begin
          s := ds.FieldByName(OPisEdit.FieldForNaim).AsString;
        end;
        RestSostDataSet(ds, st);
      end;
      TLabel(FListLabel.Items[i]).Caption := s;
      exit;
    end;
  end;
end;

procedure TfmParamQuest.SetCheckLang(const Value: Boolean);
begin
  FCheckLang:=Value;
end;

procedure TfmParamQuest.SetAllRequired(const Value: Boolean);
begin
  FAllRequired:=Value;
  if FAllRequired
    then FOkClik:=true;
end;

initialization
  FontSize_Form:=0;
end.
