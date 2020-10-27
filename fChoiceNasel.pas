unit fChoiceNasel;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fLookUp, ImgList, TB2Item, Menus, Db, TB2Dock, TB2Toolbar, ComCtrls, uProject,
  ExtCtrls, Grids, DBGridEh, SasaDBGrid, dBase, StdCtrls, Mask, DBCtrlsEh,
  TB2ToolWindow, dbFunc, MetaTask, FuncPr, adsdata, adsfunc, adstable
  {$IFDEF VER150} ,Variants, Buttons, kbmMemTable {$ENDIF}  ;

type

  TParamsChoiceMen=class
  public
    lFilterTemp:Boolean;
    lEnabledAddMen:Boolean;
    lEnabledCopyMen:Boolean;
    lDestroy:Boolean;
    sSQL:String;
    sSect:String;
    constructor Create;
  end;

  TfmChoiceNasel = class(TfmLookUp)
    Panel1: TPanel;
    Label2: TLabel;
    edFam: TDBEditEh;
    tb: TAdsTable;
    btNewMen: TBitBtn;
    TBItemCopyMen: TTBItem;
    TBSaveDvig: TTBToolWindow;
    TBControlItem1: TTBControlItem;
    cbMigr: TDBCheckBoxEh;
    qChMens: TAdsQuery;
    procedure FormResize(Sender: TObject);
    procedure edFamChange(Sender: TObject);
    procedure btClrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btNewMenClick(Sender: TObject);
    procedure tbAfterScroll(DataSet: TDataSet);
    procedure TBItemCopyMenClick(Sender: TObject);
  private
    FActiceOnCahnge : Boolean;
    FAddNewMen:Boolean;
    FCopyMen:Boolean;
    FSectionPar:String;
    ds:TDataSet;
  public
    function SetAutoFilter( ParamFlt : TParamFieldFlt; var lExit : Boolean) : Boolean; override;
    function SetFilterMens : Boolean;
    procedure CreateNameSection( DataSet : TDataSet; strDop : String); override;
  end;

  function ChoiceMenEx( Control : TControl; strSeek : String; strFilter : String;
           var arrRec : TCurrentRecord; Params:TParamsChoiceMen) : Boolean;

  function ChoiceMen( Control : TControl; strSeek : String; strFilter : String;
           var arrRec : TCurrentRecord; lFilterTemp:Boolean=false) : Boolean;

var
  fmChoiceNasel: TfmChoiceNasel;

implementation

uses fMain;

{$R *.DFM}

function ChoiceMenEx( Control : TControl; strSeek : String; strFilter : String;
         var arrRec : TCurrentRecord; Params:TParamsChoiceMen) : Boolean;
var
  v,old : Variant;
  lChoice : Boolean;
  f : TfmChoiceNasel;
  kb: LongWord;
begin

  kb:=GetTypeKeyBoard;
  ActivateRUSKeyboard;

  f := TfmChoiceNasel.Create(nil);
  f.FAddNewMen:=false;
  f.FCopyMen:=false;
  if params.sSect=''
    then f.FSectionPar:=''
    else f.FSectionPar:=params.sSect;
  if Params.sSQL<>'' then begin
    f.qChMens.SQL.Text:=params.sSQL;
    f.ds:=f.qChMens;
    f.qChMens.Open;
  end else begin
    f.ds:=f.tb;
    f.tb.Open;
    f.tb.IndexName := 'FAMILIA_KEY';
    f.tb.SetRange( [fmMain.DateFiks], [fmMain.DateFiks] );
//  f.tb.SetRange( [dmBase.GetDateCurrentSost], [dmBase.GetDateCurrentSost] );
  end;
  f.FilterIsTemp:=Params.lFilterTemp;
  f.btNewMen.Visible:=Params.lEnabledAddMen;
  f.TBItemCopyMen.Visible:=Params.lEnabledCopyMen;
  f.TBSaveDvig.Visible:=false;

  Result := false;
  v := null;
  old := v;
  f.FActiceOnCahnge := false;
  if strFilter<>'' then begin
    f.ds.Filter:=strFilter;
    f.ds.Filtered:=true;
  end;
  f.edFam.Text      := strSeek;
  f.Flat := GlobalFlat;
  f.EnableDetail :=false;
  f.OpisEdit     := nil; //Self;
  f.EnableEdit   := false;
  SetLength(arrRec,1);
  if strSeek<>'' then f.ActiveControl:=f.Grid;
  lChoice:=f.Execute(Control, f.ds, 'ID', v, arrRec, '', nil);
  if lChoice then begin
    if f.FAddNewMen then begin
      SetLength(arrRec,1);
      arrRec[0].FieldName:='ID';
      arrRec[0].Value:=0;
      Result := true;
    end;
    if f.FCopyMen then begin
      SetLength(arrRec,Length(arrRec)+1);
      arrRec[Length(arrRec)-1].FieldName:='_COPYMEN';
      arrRec[Length(arrRec)-1].Value:=true;
      Result := true;
    end;
    if GlobalTask.ParamAsBoolean('SAVE_DVIG_COPY') then begin // f.TBSaveDvig.Visible then begin
      SetLength(arrRec,Length(arrRec)+1);
      arrRec[Length(arrRec)-1].FieldName:='_LOADMIGR';
      arrRec[Length(arrRec)-1].Value:=true;
      Result := true;
    end;
    if (v<>null) then begin   // выбрали человека
      Result := true;
    end;
  end;
  f.ds.Close;
  f.Free;
  if Params.lDestroy then begin
    FreeAndNil(Params);
  end;

  if (kb>0) then
    ActivateKeyboardLayout(kb,KLF_ACTIVATE);
end;

function ChoiceMen( Control : TControl; strSeek : String; strFilter : String; var arrRec : TCurrentRecord; lFilterTemp:Boolean) : Boolean;
var
  v,old : Variant;
  lChoice,lAdd : Boolean;
  f : TfmChoiceNasel;
  n:Integer;
  kb: LongWord;
begin

  kb:=GetTypeKeyBoard;
  ActivateRUSKeyboard;

  f := TfmChoiceNasel.Create(nil);
  f.FSectionPar:='';
  f.FAddNewMen:=false;
  f.FCopyMen:=false;
  f.ds:=f.tb;
  f.tb.Open;
  f.tb.IndexName := 'FAMILIA_KEY';
  f.tb.SetRange( [fmMain.DateFiks], [fmMain.DateFiks] );
//  f.tb.SetRange( [dmBase.GetDateCurrentSost], [dmBase.GetDateCurrentSost] );
  f.FilterIsTemp:=lFilterTemp;
  f.btNewMen.Visible:=false;
  f.TBItemCopyMen.Visible:=false;
  f.TBSaveDvig.Visible:=false;

  Result := false;
  v := null;
  old := v;
  f.FActiceOnCahnge := false;
  if strFilter<>'' then begin
    n:=Pos('@',strFilter);
    if n>0 then begin
      f.strConstFilter:=Copy(strFilter,n+1,Length(strFilter));
      f.tb.Filter:=Copy(strFilter,1,n-1);
      f.tb.Filtered:=true;
    end else begin
      f.tb.Filter:=strFilter;
      f.tb.Filtered:=true;
    end;
  end;
  f.edFam.Text:=strSeek;
  f.Flat:=GlobalFlat;
  f.EnableDetail:=false;
  f.OpisEdit:= nil; //Self;
  f.EnableEdit:=false;
  SetLength(arrRec,1);
  arrRec[0].FieldName:='FIO';  // !!! объединить FAMILIA NAME OTCH в одно поле FIO !!!
  if strSeek<>'' then f.ActiveControl:=f.Grid;
  lChoice:=f.Execute(Control, f.tb, 'ID', v, arrRec, '', nil);
  lAdd:=f.FAddNewMen;
  f.tb.Close;
  f.Free;
  if lChoice then begin
    if lAdd then begin
      arrRec[0].FieldName:='ID';
      arrRec[0].Value:=0;
      Result:=true;
    end else begin
      if (v<>null) then begin   // выбрали человека
        Result := true;
      end;
    end;
  end;

  if (kb>0) then
    ActivateKeyboardLayout(kb,KLF_ACTIVATE);
end;

procedure TfmChoiceNasel.FormResize(Sender: TObject);
begin
//  TBToolWindow1.DockPos := 1300;
end;

function TfmChoiceNasel.SetFilterMens : Boolean;
var
  s : String;
  n : Integer;
//  ParamFlt : TParamFieldFlt;
begin
  Result := false;
  if FActiceOnCahnge then begin
    if Trim(edFam.Text)<>'' then begin
      s := Trim(edFam.Text);
      n:=Pos(' ',s);
      if strFirstFilter<>'' then begin
        if n>0 then begin
          ds.Filter   := '('+strFirstFilter+') and FAMILIA='+QStr(Copy(s,1,n-1)+'*')+
                                              'and NAME='+QStr(Copy(s,n+1,20)+'*');
        end else begin
          ds.Filter   := '('+strFirstFilter+') and FAMILIA='+QStr(s+'*');
        end;
      end else begin
        if n>0 then begin
          ds.Filter   := 'FAMILIA='+QStr(Copy(s,1,n-1)+'*')+
                         'and NAME='+QStr(Copy(s,n+1,20)+'*');
        end else begin
          ds.Filter   := 'FAMILIA='+QStr(s+'*');
        end;
      end;
      {
      if strFirstFilter<>'' then begin
        tb.Filter   := '('+strFirstFilter+') and '+'familia='+QStr(s+'*');
      end else begin
        tb.Filter   := 'familia='+QStr(s+'*');
      end;
      }
      ds.Filtered := true;
      strNameFilter:='‘»Ћ№“–';
      SetCaptionForm;
      tbClr.Visible := true;
      Result := true;
    end else begin
      if strFirstFilter<>'' then begin
        ds.Filter   := strFirstFilter;
        ds.Filtered := true;
      end else begin
        ds.Filter   := '';
        ds.Filtered := false;
      end;
      strNameFilter:='';
      SetCaptionForm;
      if FilterIsTemp
        then tbClr.Visible:=true
        else tbClr.Visible:=false;
    end;
  end;
end;

procedure TfmChoiceNasel.edFamChange(Sender: TObject);
begin
  SetFilterMens;
end;

procedure TfmChoiceNasel.btClrClick(Sender: TObject);
begin
  if FilterIsTemp then begin
    if strConstFilter=''
      then strFirstFilter:=''
      else strFirstFilter:=strConstFilter;
    FilterIsTemp:=false;
  end;

//  if FilterIsTemp then begin
//    strFirstFilter:='';
//    FilterIsTemp:=false;
//  end;
  strNameFilter:='';
  edFam.Text:='';
  tbClr.Visible := false;
  SetFilterMens;
end;

procedure TfmChoiceNasel.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) and (Shift=[]) then begin
     if not Grid.EditorMode then begin
       TBItemChoiceClick(Sender);
       Key := 0;
     end;
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    SpeedButton2Click(Sender);
    Key := 0;
  end else if (Key=VK_F4) and (Shift=[]) then begin
    if Grid.SelectedIndex>-1 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex,
        Grid.Columns[Grid.SelectedIndex]);
      Key := 0;
    end;
  end;
  Grid.MyUserKeyDown(Sender,Key,Shift);
end;

procedure TfmChoiceNasel.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
//var
//  fld:TField;
begin
  {$IFDEF OCHERED}
  {
    if not DataSource.DataSet.FieldByName('OCHERED').IsNull and DataSource.DataSet.FieldByName('OCHERED').AsBoolean then begin
      AFont.Style := AFont.Style + [fsBold];
    end;
    fld:=ds.FindField('ISKL');
    if fld<>nil then begin
      if not fld.IsNull and fld.AsBoolean then begin
        AFont.Color := clRed;
      end;
    end;     }
  {$ELSE}
    SetColorRowGridMen(AFont,Background,DataSource.DataSet);
    //if not DataSource.DataSet.FieldByName('SPEC_UCH').IsNull and DataSource.DataSet.FieldByName('SPEC_UCH').AsBoolean then begin
    //  AFont.Style := AFont.Style + [fsBold];
    //end;
  {$ENDIF}
{
  with DataSource.DataSet do begin
    if not FieldByName('CANDELETE').IsNull and FieldByName('CANDELETE').AsBoolean then begin
      if ds.FieldByName('NEW_ID').AsInteger>0
        then AFont.Color := ColorMenCopy
        else AFont.Color := ColorMenContantUbil; //  clRed;
    end else begin
      if not FieldByName('PROPIS').IsNull and (FieldByName('PROPIS').AsBoolean=false) then begin
        AFont.Color := $00319D31; //Grid.Color1; // clMaroon; //clGreen; //Grid.NewRowColor;
      end else if not lPresent and not lPropis then begin   // не зарегистрирован и отсутствует
//        AFont.Color:=ColorMenTempPrib; //$00319D31;
        Background:=clInfoBk;

      end else if not FieldByName('PRESENT').IsNull and (FieldByName('PRESENT').AsBoolean=false) then begin
        AFont.Color := clBlue; // Grid.Color2;
      end;
    end;
    $IFDEF OCHERED
      if not FieldByName('OCHERED').IsNull and FieldByName('OCHERED').AsBoolean then begin
        AFont.Style := AFont.Style + [fsBold];
      end;
    $ELSE
      if not FieldByName('SPEC_UCH').IsNull and FieldByName('SPEC_UCH').AsBoolean then begin
        AFont.Style := AFont.Style + [fsBold];
      end;
    $ENDIF
  end;
}
end;

function TfmChoiceNasel.SetAutoFilter(ParamFlt: TParamFieldFlt; var lExit: Boolean): Boolean;
begin
  FActiceOnCahnge := true;
  Result := SetFilterMens;
end;

procedure TfmChoiceNasel.CreateNameSection(DataSet: TDataSet; strDop: String);
var
  s : String;
begin          
  if (OpisEdit<>nil) and (OpisEdit.ConfSection<>'') then begin
    s := OpisEdit.ConfSection;
  end else begin
    if FSectionPar=''
      then s := 'tbMens'
      else s := FSectionPar;
  end;
  FSection := s+strDop;
  FSectionDop :='Dop_'+s+strDop;
end;

procedure TfmChoiceNasel.btNewMenClick(Sender: TObject);
begin
  FAddNewMen:=true;
  ModalResult:=mrOk;
  Close;
end;

{ TParamsChoiceMen }

constructor TParamsChoiceMen.Create;
begin
  lFilterTemp:=false;
  lEnabledAddMen:=false;
  lEnabledCopyMen:=false;
  lDestroy:=true;
  sSQL:='';
end;

procedure TfmChoiceNasel.TBItemCopyMenClick(Sender: TObject);
begin
  FCopyMen:=true;
  ModalResult:=mrOk;
  Close;
end;

procedure TfmChoiceNasel.tbAfterScroll(DataSet: TDataSet);
begin
  if TBItemCopyMen.Visible then begin
    if (ds.FieldByName('CANDELETE').AsBoolean=true) and (ds.FieldByName('DATES').IsNull) then begin
      TBItemCopyMen.Enabled:=true;
//      TBSaveDvig.Visible:=true;
    end else begin
      TBItemCopyMen.Enabled:=false;
//      TBSaveDvig.Visible:=false;
    end;
  end;
end;

end.
