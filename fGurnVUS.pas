unit fGurnVUS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, uProjectALL, mPermit, fParamQuest,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow, FuncPr, Variants,
  DbFunc, vchDBCtrls, PrnDbgeh, Menus, metatask, SasaIniFile, ImgList, fChoiceNasel, uTypes,
  ComCtrls, ExtCtrls;

type
  TfmGurnVUS = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    Label1: TLabel;
    lbSost: TLabel;
    edSeek: TDBEditEh;
    DBText: TvchDBText;
    TBItemEditLic: TTBItem;
    TBItemAdd: TTBItem;
    procedure edSeekChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure TBItemLgotClick(Sender: TObject);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    procedure TBItemEditLicClick(Sender: TObject);
    procedure TBItemAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    FVklMens  : Boolean;
    itVklMens : TTBItem;
    constructor Create(Owner : TComponent); override;
    function LoadQuery : Boolean; override;
    procedure LoadFromIni; override;
    function  InitFilter( var strErr : String ) : Boolean; override;
    procedure AddUpdateActions; override;
    procedure GridColumnsSostavSem(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPaspVidan(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function  getAdditiveWhere: String; override;
    function  getDefaultAddWhere: String; override;

    procedure Event_VklMens(Sender: TObject);
    procedure Event_InitFields(Sender: TObject);
    procedure Event_AddDateSv(Sender: TObject);
    procedure Event_DelDateSv(Sender: TObject);
    function IsRecordOkObrab(nType:Integer):Boolean; override;


    procedure SetListParEditForm; override;
  end;

var
  fmGurnVUS: TfmGurnVUS;

implementation

uses fMain, dBase, fLgotSeek, fInitField;

{$R *.DFM}

{ TfmGurnNasel }

constructor TfmGurnVUS.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Nasel;
  inherited;
  QuestDel := '  Удалить человека с учета ВУС ?  ';
end;

procedure TfmGurnVUS.SetListParEditForm;
begin
  inherited;
  FListPar.Add('EnableVUS=1');
  FListPar.Add('PAGEINDEX=tsVUS');
end;

function TfmGurnVUS.InitFilter(var strErr: String): Boolean;
begin
  FSubType := 'Военно-учетный стол';
  Result := inherited InitFilter(strErr);
end;

procedure TfmGurnVUS.LoadFromIni;
var
  i : Integer;
//  ini : TSasainiFile;
begin
  inherited LoadFromIni;
  {---- работает форма состемного фильтра для людей ---
  FVklMens := ini.ReadBool(KodGurnal+'.Add','VKLMENS',true);
  itVklMens.Checked := FVklMens;
  if FVklMens then begin
    CreateAdditiveWhere('n.present=true');
  end else begin
    CreateAdditiveWhere('');
  end;
  }
  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='SOSTAV_SEM_PLUS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsSostavSem;
    end else if Grid.Columns[i].FieldName='PASP_VIDAN' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPaspVidan;
    end else if Grid.Columns[i].FieldName='Work_Spr' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsWorkName;
    end else if Grid.Columns[i].FieldName='Dolg_Spr' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsDolgName;
    end;
  end;
end;

function TfmGurnVUS.LoadQuery: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
 pt:TPermitType;
begin
  FVklMens := false;
  Result := inherited LoadQuery;
  lbSost.Caption := dmBase.NameSostFromDate( Query.FieldByName('DATE_FIKS').AsDateTime );
  itVklMens := TTbItem.Create(TBSubSysFlt);
  itVklMens.AutoCheck := true;
  itVklMens.Checked:=true;
  itVklMens.Caption:='Исключить умерших и убывших';
  itVklMens.OnClick:=Event_VklMens;
  TBSubSysFlt.Add(itVklMens);
   
  pt:=Role.CheckSubSystem(SS_VUS);

  if ( (Role.Status=rsAdmin) or (pt=ptFull) ) and (DateFiks=dmBase.GetDateCurrentSost) then begin
    TBSubItemRun.Visible:=true;
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Добавить дату сверки в список';
    it.OnClick:=Event_AddDateSv;
    TBSubItemRun.Add(it);

    TBSubItemRun.Visible:=true;
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Удалить дату сверки из списка';
    it.OnClick:=Event_DelDateSv;
    TBSubItemRun.Add(it);

    TBSubItemRun.Visible:=true;
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Изменить значение реквизита в базе';
    it.OnClick:=Event_InitFields;
    TBSubItemRun.Add(it);
  end;

end;

procedure TfmGurnVUS.edSeekChange(Sender: TObject);
var
  strFilter : String;
  nLen,n : Integer;
begin
  strFilter := Trim(edSeek.Text);
  nLen := Length(strFilter);
  Query.DisableControls;
  Query.Filtered := false;
  if nLen = 0 then begin
    Query.Filter := '';
  end else begin
    n:=Pos(' ',strFilter);
    if n>0 then begin
      Query.Filter := 'SUBSTR(FAMILIA,1,'+IntToStr(n-1)+')='+QStr(Copy(strFilter,1,n-1))+
                      '.and. SUBSTR(NAME,1,'+IntToStr(nLen-n)+')='+QStr(Copy(strFilter,n+1,20));
    end else begin
      Query.Filter := 'SUBSTR(FAMILIA,1,'+IntToStr(nLen)+')='+QStr(strFilter);
    end;
    Query.Filtered := true;
  end;
  Query.EnableControls;
end;

procedure TfmGurnVUS.Event_VklMens(Sender: TObject);
begin
{
  FVklMens := not FVklMens;
  if FVklMens then begin
    CreateAdditiveWhere('n.present=true');
  end else begin
    CreateAdditiveWhere('');
  end;
}
end;
//----------------------------------------------------------------
procedure TfmGurnVUS.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.tbVUS, 'DATE_FIKS;ID', lFilter) then Refresh(true);
end;
//----------------------------------------------------------------
procedure TfmGurnVUS.Event_AddDateSv(Sender: TObject);
var
 f:TfmParamQuest;
 n,i:Integer;
 d:TDateTime;
 s,sErr,sSQL,sID,sName,sFIO,sValue:String;
 sl:TStringList;
 lErr:Boolean;
begin
  f:=TfmParamQuest.Create(Self);
  f.AllREQUIRED:=true;
  f.Caption:='Добавить дату сверки';
  f.AddParamEx(dmBase.getCurDate, 'Дата сверки' , 'DATE' ,'TYPE=DATE');
  f.AddParamEx('', 'С кем или чем прводится', 'NAME' ,'TYPE=STRING~WIDTH=200');
  f.AddParamEx(GlobalTask.ParamAsString('FIO_VUS'), 'Инициалы, фамилия проводившего', 'FIO' ,'TYPE=STRING~WIDTH=200');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n=1 then begin
    d:=f.GetValue('DATE', 'D');
    sName:=f.GetValue('NAME', 'S');
    sFIO:=f.GetValue('FIO', 'S');
  end;
  f.Free;
  if n=1 then begin
    sl:=TStringList.Create;
    if GetRecordsForObrab(0,sl,sID,false) then begin
      s:='Добавить значение в список сверки';
      if Problem(' '+s+' для записей в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
        sValue:='NAME='+sName+#13#10+'FIO='+sFIO+#13#10+'DATE_SV='+DTOS(d,tdClipper);
        lErr:=false;
        GlobalTask.WriteToLogFile(s);
        for i:=0 to sl.Count-1 do begin
          sID:=sl.Strings[i];
          if dmBase.tbVUS.Locate('ID', sID, []) then begin
            dmBase.WorkQuery.SQL.Text:='select max(dates) from basetextprop where typeobj='+IntToStr(_TypeObj_Nasel)+' and id='+sID+' and pokaz=''SVERKI'' ';
            dmBase.WorkQuery.Open;
            if dmBase.WorkQuery.Fields[0].IsNull
              then d:=STOD('19000101')
              else d:=dmBase.WorkQuery.Fields[0].AsDateTime+1;
            dmBase.WorkQuery.Close;
            sSQL:=Format('INSERT INTO BaseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE) '+
               ' VALUES (%d, %s,''%s'',''SVERKI'', ''%s'')',[_TypeObj_Nasel,sID,DTOS(d,tdAds),sValue]);
            sErr:='';
            try
              dmBase.AdsConnection.Execute(sSQL);
            except
              on E:Exception do begin
                lErr:=false;
                sErr:=E.Message+'  ';
              end;
            end;
            GlobalTask.WriteToLogFile(sErr+sSQL);
          end;
          if lErr then begin
            PutError(sErr);
            break;
          end;
        end;
        if sID=''
          then FullRefresh
          else Refresh(true, sID);
      end;
    end;
    sl.Free;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnVUS.Event_DelDateSv(Sender: TObject);
var
 f:TfmParamQuest;
 n,i:Integer;
 d:TDateTime;
 s,sErr,sSQL,sID:String;
 sl:TStringList;
 lErr:Boolean;
begin
  f:=TfmParamQuest.Create(Self);
  f.AllREQUIRED:=true;
  f.Caption:='удалить дату сверки';
  f.AddParamEx(dmBase.getCurDate, 'Дата сверки' , 'DATE' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n=1 then begin
    d:=f.GetValue('DATE', 'D');
  end;
  f.Free;
  if n=1 then begin
    sl:=TStringList.Create;
    if GetRecordsForObrab(0,sl,sID,false) then begin
      s:='Удалить значение из списка сверки';
      if Problem(' '+s+' для записей в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
        lErr:=false;
        GlobalTask.WriteToLogFile(s);
        for i:=0 to sl.Count-1 do begin
          sID:=sl.Strings[i];
          if dmBase.tbVUS.Locate('ID', sID, []) then begin
            sSQL:='DELETE FROM basetextprop where typeobj='+IntToStr(_TypeObj_Nasel)+' and id='+sID+
                  ' and pokaz=''SVERKI'' and value LIKE ''%DATE_SV='+DTOS(d,tdClipper)+'%'' ';
            sErr:='';
            try
              dmBase.AdsConnection.Execute(sSQL);
            except
              on E:Exception do begin
                lErr:=false;
                sErr:=E.Message+'  ';
              end;
            end;
            GlobalTask.WriteToLogFile(sErr+sSQL);
          end;
          if lErr then begin
            PutError(sErr);
            break;
          end;
        end;
        if sID=''
          then FullRefresh
          else Refresh(true, sID);
      end;
    end;
    sl.Free;
  end;
end;
//----------------------------------------------------------------
function TfmGurnVUS.IsRecordOkObrab(nType:Integer):Boolean;
begin
  Result:=true;                                
end;
//----------------------------------------------------------------
procedure TfmGurnVUS.GridColumnsSostavSem(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i,nID : Integer;
  sFIO,s:String;
  ds:TDataSet;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    nID:=Query.FieldByName('SUPRUG_ID').AsInteger;
    if nID>0 then begin
      ds:=dmBase.getMen(d, IntToStr(nID));
      sFIO:=Trim(CreateFIO(ds,'')+' '+DatePropis(ds.FieldByName('DATER').AsDateTime,3));
//      sFIO:=dmBase.FIOMen(d, IntToStr(nID), ' ');
    end else begin
      sFIO:=getFieldFromSL(Query.FieldByName('ADD_FIELDS').AsString,'SUPRUG','C');
      s:=DatePropis(getFieldFromSL(Query.FieldByName('ADD_FIELDS').AsString,'SUPRUG_DATER','D'),3);
      sFIO:=Trim(sFIO+' '+s);
    end;
    if sFIO<>'' then begin
      if Query.FieldByName('POL').AsString='Ж'
        then s:='муж' else s:='жена';
      sFIO:=s+' '+sFIO+#13#10;
    end;
    s:=StringReplace(Query.FieldByName('SOSTAV_SEM').AsString, ', ',' '#13#10, [rfReplaceAll]);
    s:=StringReplace(s, '; ',' '#13#10, [rfReplaceAll]);
    Params.Text:=sFIO+s;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnVUS.GridColumnsGetPaspVidan(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'PASP_VIDAN', ftMemo);
  end;
end;

procedure TfmGurnVUS.GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('DOLG_SPR').AsString='' then begin
    Params.Text := Query.FieldByName('DOLG_NAME').AsString;
  end else begin
    if dmBase.SprDolg.Locate('ID', Query.FieldByName('DOLG_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprDolg.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnVUS.GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('WORK_SPR').AsString='' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'WORK_NAME', ftMemo);
  end else begin
    if dmBase.SprWork.Locate('ID', Query.FieldByName('WORK_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprWork.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnVUS.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  SetColorRowGridMen(AFont,Background,Query);
{
  if Query.Active then begin
    inherited;
    if not Query.FieldByName('CANDELETE').IsNull and Query.FieldByName('CANDELETE').AsBoolean then begin
      AFont.Color := Grid.Color1; //  clRed;
    end else begin
      if not Query.FieldByName('PROPIS').IsNull and (Query.FieldByName('PROPIS').AsBoolean=false) then begin
        AFont.Color := $00319D31; //Grid.Color1; // clMaroon; //clGreen; //Grid.NewRowColor;
      end else if not Query.FieldByName('PRESENT').IsNull and (Query.FieldByName('PRESENT').AsBoolean=false) then begin
        AFont.Color := clBlue; // Grid.Color2; ;
      end;
    end;
  end;
}
end;

procedure TfmGurnVUS.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=2000;
end;

procedure TfmGurnVUS.TBItemLgotClick(Sender: TObject);
var
  strSeek : String;
  strSQL  : String;
begin
  strSeek := RunMensSeek(tsLgot, true, FID, '');
  if Length(strSeek)>0 then begin
    strSeek := FFilterJUrnal.DefaultWhere+' and ' + strSeek;
    strSQL  := ChangeWhere( Query.SQL.Text, strSeek, false);
    FNewSQL := strSQL;
    Refresh;
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

procedure TfmGurnVUS.DBTextGetText(Sender: TObject; var Text: String);
begin
  Text := dmBase.NameSostFromDate( Query.FieldByName('DATE_FIKS').AsDateTime );
end;

procedure TfmGurnVUS.TBItemEditLicClick(Sender: TObject);
begin
  if fmMain.EditDokument(Query, dmBase.TypeObj_Lich,'LIC_ID',nil,true, KodGurnal) then begin
//    Refresh;
  end;
end;

procedure TfmGurnVUS.AddUpdateActions;
begin
  if Query.Eof and Query.Bof then begin
    TBItemEditLic.Enabled:=false;
  end else begin
    TBItemEditLic.Enabled:=true;
  end;
end;


procedure TfmGurnVUS.TBItemAddClick(Sender: TObject);
var
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  lOk,lSeek : Boolean;
begin
  if ChoiceMen( nil, '', 'VUS=false', arrRec) then begin
    old := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    v := GetValueField(arrRec, 'ID');
    lOk:=dmBase.AddMenToVUS(v,lSeek);
    Screen.Cursor := old;
    if lOk then begin
      SetListParEditForm;
      try
        if fmMain.EditDokument(dmBase.tbMens, TypeEditObj,'ID', FListPar,false, KodGurnal) then begin

        end;
      finally
        FListPar.Clear;
      end;
      Refresh(false);
    end else begin
      if lSeek then begin
        Query.Locate('ID',v,[]);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfmGurnVUS.getAdditiveWhere: String;
var
 s1:String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
//  if IsDateFiks
//    then Result:=''
//    else Result:='n.date_fiks='+QStr(CURRENT_SOST); //DateToSQL(fmMain.DateFiks);
//  AddResult('n.vus=true');
  s1:=GetStrSystemFilter(true);
  if s1<>''            then AddResult(s1);
  if FFilter_Punkt<>'' then AddResult(FFilter_Punkt);
end;
//------------------------------------------------------------------------------
function TfmGurnVUS.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
end;

end.
