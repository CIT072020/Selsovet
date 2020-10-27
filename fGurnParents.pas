unit fGurnParents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uProjectAll,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, MetaTask, dbFunc, uTypes,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, vchDBCtrls, TB2ToolWindow,
  dBase, ImgList, Mask, DBCtrlsEh, DBLookupEh, Buttons, PrnDbgeh, FuncPr
 {$IFDEF VER150} ,Variants, Menus, ComCtrls, ExtCtrls {$ENDIF}  ;

type
  TfmGurnParents = class(TfmGurnal)
    HImageList: TImageList;
    TBToolWindow2: TTBToolWindow;
    edPunkt: TDBLookupComboboxEh;
    dsPunkt: TDataSource; 
    edUL: TDBLookupComboboxEh;
    dsUL: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edTip: TDBComboBoxEh;
    QueryUL: TAdsQuery;
    dsUlAll: TDataSource;
    QueryULAll: TAdsQuery;
    TBItemEditAdres: TTBItem;
    Label5: TLabel;
    edTipAdr: TDBComboBoxEh;
    TBToolWindow1: TTBToolWindow;
    Label3: TLabel;
    edFamilia: TDBEditEh;
    TBSubmenuItemOrder: TTBSubmenuItem;
    TBItemOrder_name: TTBItem;
    TBItemOrder_adres: TTBItem;
    procedure edPunktChange(Sender: TObject);
    procedure edULChange(Sender: TObject);
    procedure edPunktEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edULEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edFamiliaChange(Sender: TObject);
    procedure edFamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edTipChange(Sender: TObject);
    procedure edTipEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure TBItemEditClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemEditAdresClick(Sender: TObject);
    procedure edTipAdrEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure edFamiliaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTipAdrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBItemOrder_adresClick(Sender: TObject);
    procedure TBItemOrder_nameClick(Sender: TObject);
  private
    FSQLAll   : String;
    FSQLPunkt : String;
    FstrTemp  : String;
    procedure SetFilter;
  public
    procedure GridColumnsTypeKod(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetOpisLich(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPassport(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsNameDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsKorp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    function  LoadQuery : Boolean; override;
    constructor Create( Owner : TComponent); override;
  end;

var
  fmGurnParents: TfmGurnParents;

implementation

uses fMain;

{$R *.DFM}

constructor TfmGurnParents.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Adres;
  inherited;
//  QuestDel := '  ”далить текущий дом ?  ';
end;

function TfmGurnParents.LoadQuery: Boolean;
var
  i : Integer;
begin
  Result := inherited LoadQuery;
  TBItemOrder_name.Checked:=true;
  if Result then begin
    for i:=0 to Grid.Columns.Count-1 do begin
      // псевдополе дл€ вывода домика
      if Grid.Columns[i].FieldName='ADRES' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsGetAdres;
      // псевдополе дл€ вывода лицевых счетов в доме
      end else if Grid.Columns[i].FieldName='LICH' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsGetOpisLich;
      end else if UpperCase(Grid.Columns[i].FieldName)='PASSPORT' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsGetPassport;
      end else if UpperCase(Grid.Columns[i].FieldName)='TYPEKOD' then begin
        Grid.Columns[i].ImageList := HImageList;
        Grid.Columns[i].OnGetCellParams := GridColumnsTypeKod;
      end else if UpperCase(Grid.Columns[i].FieldName)='DOM_NAME' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsNameDom;
      end else if UpperCase(Grid.Columns[i].FieldName)='DOM' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsDom;
      end else if UpperCase(Grid.Columns[i].FieldName)='KORP' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsKorp;
      end;
    end;
  end;
end;

procedure TfmGurnParents.GridColumnsDom(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if Query.FieldByName('NOT_DOM').AsBoolean then Params.Text:='';
end;

procedure TfmGurnParents.GridColumnsKorp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('NOT_DOM').AsBoolean then Params.Text:='';
end;

procedure TfmGurnParents.GridColumnsNameDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  adr:TAdres;
  s:String;
begin
  Params.Text := Query.FieldByName('DOM').AsString;
  if Query.FieldByName('NOT_DOM').AsBoolean then begin
    Params.Text := 'нет';
  end;
  if Query.FieldByName('ID').AsString<>'' then begin
    adr:=dmBase.AdresForSeek(Query);
    s:=dmBase.NameBigHouse(adr,DateFiks);
    if s<>'' then begin
      Params.Text := s;
    end;
  end;
end;

procedure TfmGurnParents.GridColumnsTypeKod(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('TYPEKOD').IsNull then begin
    Params.ImageIndex := -1;
  end else if Query.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL then begin
    if not Query.FieldByName('PROPIS').IsNull and (Query.FieldByName('PROPIS').AsBoolean=false)
      then Params.ImageIndex := 4     // незарегистрированное население
      else Params.ImageIndex := 3;    // зарегистрированное население
  end else begin
    Params.ImageIndex := 2;           // организации
  end;
end;

procedure TfmGurnParents.GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  strName:String;
  lPropis:Boolean;
begin
  Params.Text:=dmBase.AdresOwner(Query.FieldByName('date_fiks').AsDateTime,
                                 Query.FieldByName('KOD').AsString,
                                 Query.FieldByName('TYPEKOD').AsInteger, strName, lPropis);
{
  if Query.FieldByName('TYPEKOD').IsNull or (Query.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) then begin
    FstrTemp:=Query.FieldByNAme('ADRES_PROP').AsString;
    if Query.FieldByName('PROPIS').AsBoolean then begin
      FstrTemp:=Query.FieldByName('NAME_PUNKT').AsString;
      if Query.FieldByName('NAME_UL').AsString<>'' then begin
        FstrTemp:=FstrTemp+', '+Query.FieldByName('NAME_UL').AsString;
      end;
      Params.Text :=dmBase.getDom(Query,true); //.FieldByName('DOM').AsString, Query.FieldByName('KORP').AsString, Query.FieldByName('KV').AsString);
      if Params.Text='' then Params.Text:=FstrTemp
                        else Params.Text:=FstrTemp+', '+Params.Text;
    end else begin
      Params.Text := FstrTemp;
    end;
  end else begin
    Params.Text := Query.FieldByNAme('ADRES').AsString;
  end;
}
end;

procedure TfmGurnParents.GridColumnsGetPassport(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  p : TPassport;
begin
  if Query.FieldByName('TYPEKOD').IsNull or (Query.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) then begin
    p := dmBase.PasportMen(Query.FieldByName('date_fiks').AsDateTime,
                           Query.FieldByName('kod').AsString);
    Params.Text := dmBase.PasportToText(p, 0);
  end else begin
    Params.Text := ''; // Query.FieldByName('PASSPORT').AsString   у организации нет паспорта
  end;
end;

procedure TfmGurnParents.GridColumnsGetOpisLich(Sender: TObject;
             EditMode: Boolean; Params: TColCellParamsEh);
var
  vKeyValues : Variant;
  d : TDateTime;
  i : Integer;
  s,ss : String;
begin
//  if not EditMode then begin
    if Params.Text<>'' then begin
      d := Query.FieldByName('date_fiks').AsDateTime;
      i := Query.FieldByName('id').AsInteger;
      dmBase.tbLich.CancelRange;
      try
        dmBase.tbLich.IndexFieldNames := 'DATE_FIKS;ADRES_ID';
        dmBase.tbLich.SetRange([d,i],[d,i]);
        if not dmBase.tbLich.Eof then begin
          Params.Text := '';
          while not dmBase.tbLich.Eof do begin
            Params.Text := Params.Text + dmBase.tbLich.FieldByName('NOMER').AsString;
            if dmBase.tbLich.FieldByName('FIRST').AsString<>'' then begin
              vKeyValues := VarArrayCreate( [0, 1], varOleStr );
              vKeyValues[0] := d;
              vKeyValues[1] := dmBase.tbLich.FieldByName('FIRST').AsInteger;
              s := '';
              if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
                s := Trim(dmBase.tbMens.FieldByName('FAMILIA').AsString);
                ss := Trim(dmBase.tbMens.FieldByName('NAME').AsString);
                if ss<>'' then s := s + ' ' + ss;
//                if ss<>'' then s := s + Copy(ss,1,1)+'.';
                ss := Trim(dmBase.tbMens.FieldByName('OTCH').AsString);
                if ss<>'' then s := s + ' ' + ss;
//                if ss<>'' then s := s + Copy(ss,1,1)+'.';
              end;
              if s<>'' then Params.Text := Params.Text+' ( '+s+' )    ';
            end;
            dmBase.tbLich.Next;
          end;
        end else begin
          Params.Text := '';
        end;
      finally
        dmBase.tbLich.CancelRange;
      end;
    end;
//  end;
end;

procedure TfmGurnParents.SetFilter;
var
  s, strFilter : String;
  nLen : Integer;
begin
  if (edTipAdr.ItemIndex = -1) and (edTip.ItemIndex = -1) and (edFamilia.Text = '') and (edPunkt.Text = '') and  (edUL.Text = '') then begin
    Query.Filtered := false;
  end else begin
    strFilter := '';
    //--------------------------------------------------------
    if (edTip.ItemIndex > -1) then begin
      case edTip.ItemIndex of
        0 : s := 'typekod='+OWNER_NASEL_STR;
        1 : s := 'typekod='+OWNER_NASEL_STR+' .and. propis=.t.';
        2 : s := 'typekod='+OWNER_NASEL_STR+' .and. propis=.f.';
        3 : s := 'typekod='+OWNER_ORG_STR;
      end;
//      if edTip.ItemIndex=0
//        then  s := 'typekod=1'
//        else  s := 'typekod=2 .or. propis=false';
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' .and. ' + s;
    end;
    //--------------------------------------------------------
    if (edTipAdr.ItemIndex > -1) then begin
      s := 'type_house='+edTipAdr.KeyItems[edTipAdr.ItemIndex];
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' .and. ' + s;
    end;
    //--------------------------------------------------------
    if (edFamilia.Text <> '') then begin
      nLen := Length(Trim(edFamilia.Text));
      s := 'substr(name,1,'+IntToStr(nLen)+')='+QStr(Trim(edFamilia.Text));
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' .and. ' + s;
    end;
    //--------------------------------------------------------
    if (edPunkt.Text <> '') then begin
      s := 'punkt = '+ VarToStr(edPunkt.Value);
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' .and. ' + s;
    end;
    //--------------------------------------------------------
    if (edUL.Text <> '') then begin
      s := 'ul = '+ VarToStr(edUL.Value);
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' .and. ' + s;
    end;
    //--------------------------------------------------------
    if strFilter='' then begin
      Query.Filtered := false
    end else begin
      Query.Filter   := strFilter;
      Query.Filtered := true;
    end;
  end;
end;

procedure TfmGurnParents.edFamiliaChange(Sender: TObject);
begin SetFilter; end;

procedure TfmGurnParents.edPunktChange(Sender: TObject);
begin
  if (edPunkt.Text = '') then begin
    QueryUL.Filter   := '';
    QueryUL.Filtered := false;
    edUL.ListSource  := dsUlAll;
  end else begin
    edUL.Value:=null;
    QueryUL.Filter   := 'punkt='+VarToStr(edPunkt.Value);
    QueryUL.Filtered := true;
    edUL.ListSource  := dsUl;
  end;
  SetFilter;
end;

procedure TfmGurnParents.edULChange(Sender: TObject);
begin SetFilter; end;

procedure TfmGurnParents.edTipChange(Sender: TObject);
begin SetFilter; end;

procedure TfmGurnParents.edPunktEditButtons0Click(Sender: TObject;
          var Handled: Boolean);
begin
  Handled := true;
  edPunkt.Value:=null;
end;

procedure TfmGurnParents.edULEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled := true;
  edUL.Value:=null;
end;

procedure TfmGurnParents.edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edFamilia.Text:='';
end;


procedure TfmGurnParents.edTipEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edTip.ItemIndex:=-1;
end;

procedure TfmGurnParents.edTipAdrEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edTipAdr.ItemIndex:=-1;
end;


procedure TfmGurnParents.TBItemEditClick(Sender: TObject);
//var
//  fmEditRecSprOwners: TfmEditRecSprOwners;
begin
  if Query.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL then begin
    if fmMain.EditDokument(Query, dmBase.TypeObj_Nasel,'KOD',FListPar,true, KodGurnal) then begin
    end;
  end else begin
    ShowMessage('ѕросмотр и корректировка доступен через справочник организаций.')
    {
    dmBase.SprOwners.IndexName := 'PR_KEY';
    if dmBase.SprOwners.FindKey([DateFiks,Query.FieldByName('KOD').AsString]) then begin
      fmEditRecSprOwners:=TfmEditRecSprOwners.Create(nil);
      try
        fmEditRecSprOwners.EditModal(dmBase.SprOwners, false);
      except
        fmEditRecSprOwners.Free;
      end;
    end;
    }
  end;
end;

procedure TfmGurnParents.TBItemEditAdresClick(Sender: TObject);
begin
  fmMain.EditDokument(Query, dmBase.TypeObj_Adres,'ID',FListPar,true, KodGurnal);
end;

procedure TfmGurnParents.GridDblClick(Sender: TObject);
begin
  TBItemEditClick(nil);
end;

procedure TfmGurnParents.FormCreate(Sender: TObject);
var
  lErr : Boolean;
//  s : String;
begin
  inherited;
  lErr := false;
  if not dmBase.LoadSQL('—пр”лицƒл€∆урнала',FSQLAll) then begin
    FSQLAll := 'select 1 punkt, ul id, name name_ul from —пр”лиц';
    PutError('ќшибка загрузки запроса: "—пр”лицƒл€∆урнала"');
    lErr := true;
  end;
  if dmBase.LoadSQL('”лицыЌасѕунктов',FSQLPunkt) then begin
    StringReplace(FSQLPunkt, '1899-12-30', DTOS(DateFiks,tdAds), [rfReplaceAll, rfIgnoreCase]);
    StringReplace(FSQLPunkt, '&DATE_FIKS&', QStr(DTOS(DateFiks,tdAds)), [rfReplaceAll, rfIgnoreCase]);
  end else begin
    QueryUL.SQL.Text := 'select 1 punkt, ul id, name name_ul from —пр”лиц';
    PutError('ќшибка загрузки запроса: "”лицыЌасѕунктов"');
    lErr := true;
  end;
  if not lErr then begin
    QueryULAll.SQL.Text := FSQLAll;
    QueryUL.SQL.Text    := FSQLPunkt;
  end;
  QueryUL.Open;
  QueryULAll.Open;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_TYPE_HOUSE_CONST', edTipAdr.Items,edTipAdr.KeyItems);
  TBToolWindow1.DockPos:=2000;
end;

procedure TfmGurnParents.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=2000;
end;

procedure TfmGurnParents.edFamiliaKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;
  if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
    Key:=0;
  end;
end;

procedure TfmGurnParents.GridKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;
  if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := edFamilia;
    Key:=0;
  end;
end;

procedure TfmGurnParents.edTipAdrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := edFamilia;
    Key:=0;
  end;
end;

//--------------------------------------------------------------------
procedure TfmGurnParents.TBItemOrder_nameClick(Sender: TObject);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'name');
    FFilterJurnal.DefaultOrderBy := 'name';
    Query.Open;
    TBItemOrder_name.Checked:=true;
    TBItemOrder_adres.Checked:=false;
  finally
    Query.EnableControls;
  end;
end;

//--------------------------------------------------------------------
procedure TfmGurnParents.TBItemOrder_adresClick(Sender: TObject);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'punkt,name_ul,dom1,dom2,korp,kv');
    FFilterJurnal.DefaultOrderBy := 'punkt,name_ul,dom1,dom2,korp,kv';
    Query.Open;
    TBItemOrder_name.Checked:=false;
    TBItemOrder_adres.Checked:=true;
  finally
    Query.EnableControls;
  end;
end;


initialization
  fmGurnParents := nil;
end.
