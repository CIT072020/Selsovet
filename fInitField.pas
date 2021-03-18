unit fInitField;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,uProjectAll,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, adstable, adsdata, uTypes,
  DB, DBCtrlsEh, Mask, DBLookupEh, dbFunc, FuncPr, fWarning;

type

  TOper = (opWrite, opClear, opPlus, opMinus, opDefault);
  TEnabledOper = set of TOper;

  TWriteAddField = procedure( SourceField,DectField : TField; Oper:TOper) of object;


  TOpisInit = record
    FieldName : String;
    OpisEdit  : String;
    Tip       : String;
    Value     : Variant;
    tbUpdate  : TAdsTAble;
    IndexFields : String;
    AddFieldName : String;
    EventAddField: TWriteAddField;
    AddBigHouse: Boolean;
    EnabledAll: Boolean;       // доступна инициализация для всей базы
    EnabledOper: TEnabledOper; // доступные опереции
    CheckGISRN : Boolean;
    WriteObrab : Boolean;
  end;
  TArrOpisInit = array of TOpisInit;

  TfmInitField = class(TfmSimpleDialog)
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    gbRekv: TGroupBox;
    edRekv: TComboBox;
    edSpr: TDBLookupComboboxEh;
    edList: TDBComboBoxEh;
    edNumeric: TDBNumberEditEh;
    DataSource: TDataSource;
    edOper: TComboBox;
    edDate: TDBDateTimeEditEh;
    edString: TDBEditEh;
    Button1: TButton;
    procedure edRekvChange(Sender: TObject);
    procedure edOperChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
    FTypeObj:Integer;
    FControl : TCustomDbEditEh;
    FstrFldSeek : String;
    FindexInit : Integer;
    FOper : TOper;
    FTypeInit:String;
    FArrOpisInit : TArrOpisInit;
    Table : TAdsTable;
    Query : TAdsQuery;
    function InitArrOpis(nCount:Integer): Boolean;
    function GetOper : TOper;
    function LoadOpisInit : Boolean;
    procedure CheckEditControl(op:TOpisInit; lSpr,lList,lNomer,lString,lDate,lBoolean:Boolean);
    function CheckOk : Boolean; override;
    procedure WritePrivateSect(SourceField,DestField : TField; Oper:TOper);
    procedure WriteNDELO(SourceField,DestField : TField; Oper:TOper);
    procedure WriteUSLUG(SourceField,DestField : TField; Oper:TOper);
    procedure WriteWORK_SPR(SourceField,DestField : TField; Oper:TOper);

  end;

  function RunInitRekvisit(fGurn : TForm; Q : TAdsQuery; tb : TAdsTable; strFldSeek : String; lFilter : Boolean; sTypeInit:String='') : Boolean;

implementation

uses fMain, dBase,  {$IFDEF GISUN} uGisun, {$ENDIF}
     MetaTask, OpisEdit, fGurnal;

const
  OP_WRITE='записать';
  OP_CLEAR='очистить';
  OP_MINUS='уменьшить';
  OP_PLUS ='увеличить';

{$R *.dfm}

function RunInitRekvisit(fGurn : TForm; Q : TAdsQuery; tb : TAdsTable; strFldSeek : String; lFilter : Boolean; sTypeInit:String) : Boolean;
var
  fmInitField: TfmInitField;
  lOkGrn,lOk,l,lSeek,lErr, lBookmark : Boolean;
  fld1,fld2, fldW,fldAdd : TField;
  fldW_BH,fldAdd_BH : TField;
  sOper,sKomm, oldInd,s,ss,sss : String;
  arrFld : TArrStrings;
  OpisInit : TOpisInit;
  tbSeek : TAdsTable;
  Oper : TOper;
  nGrn, i, m, n, nPlus, nSkip : Integer;
  {$IFDEF ADD_MENS_PU}
  adr:TAdres;
  {$ENDIF}
  sAddOper,sAddRun:String;
  slBookmark:TStringList;
  fldGRN:TField;
begin
  fmInitField := TfmInitField.Create(nil);
  fmInitField.FstrFldSeek := strFldSeek;
  fmInitField.FTypeObj:=0;
  slBookmark:=TStringList.Create;
  lOk:=false;
  lBookmark:=false;
  l:=false;
  fmInitField.FTypeInit:=sTypeInit;
  fmInitField.Query:=q;
  fmInitField.Table:=tb;
  tbSeek := tb;
  nPlus:=0;
  nSkip:=0;
  sAddOper:='';
  sss:='новое';
  ss:='';
  Oper:=opWrite;
  sKomm:='';
  try
    fmInitField.LoadOpisInit;
    if fmInitField.edRekv.Items.Count=1 then begin
      fmInitField.edRekv.ItemIndex:=0;
      fmInitField.edRekvChange(nil);
    end;
    if fmInitField.ShowModal=mrOk then begin
      lOk:=true;
      Oper:=fmInitField.GetOper;
      OpisInit := fmInitField.FArrOpisInit[fmInitField.FIndexInit];
    end;
    if lOk then begin
      // для записи номера страницы в книге +1
      if (Oper=opWrite) and (OpisInit.AddFieldName<>'') and (Copy(OpisInit.AddFieldName,1,1)='+') then begin
        sAddOper:=Copy(OpisInit.AddFieldName,1,1);  //'+'
        nPlus:=StrToInt(Copy(OpisInit.AddFieldName,2,30));  //'1'
        sss:='начальное';
        if not IsAllDigit(VarToStr(OpisInit.Value)) then begin
          lOk:=false;
          PutError('Ошибка начального значения:"'+VarToStr(OpisInit.Value)+'"');
        end;
      end;
    end;
    if lOk then begin
      ss:=fmInitField.edRekv.Items[fmInitField.FIndexInit];
      if fGurn<>nil then begin
        fmInitField.FTypeObj:=TfmGurnal(fGurn).TypeEditObj;
        TfmGurnal(fGurn).GetBookmark(slBookmark);
        if slBookmark.Count>0 then begin
          lBookmark:=true;
        end;
      end;
      if not lBookmark and not lFilter and (OpisInit.EnabledAll=false) then begin
        lOk:=false;
        PutError('Для реквизита "'+ss+'" изменение значения для всей базы запрещено');
      end;
    end;
    if lOk then begin
      if lBookmark then begin
        s := s + 'ВНИМАНИЕ! для '+IntToStr(slBookmark.Count)+' ОТМЕЧЕННЫХ записей '#13; // + Chr(13)+
      end else begin
        if lFilter then begin
          s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
        end else begin
          s := s + 'ВНИМАНИЕ! для ВСЕЙ базы '#13; // + Chr(13)+
        end;
      end;
      s := s + 'будет произведено изменение реквизита:'+#13;
      s := s + '"'+ss+'"'+#13;
      case Oper of
        opWrite : sOper:=sss+' значение: "'+fmInitField.FControl.Text+'"';
        opClear : sOper:='значение будет очищено';
        opPlus  : sOper:='значение будет увеличено на '+fmInitField.FControl.Text;
        opMinus : sOper:='значение будет уменьшено на '+fmInitField.FControl.Text;
      end;
      s:=s+sOper+#13+'Если Вы уверены введите слово ДА в поле ввода'#13;
      sKomm:='изменение реквизита "'+ss+'" '+sOper;
      lOk := OkWarning(s);
    end;
    if lOk then begin
      SetLength(arrFld,0);
      l:=dbDisableControls(Q);
      if not lBookmark then begin
        OpenMessage('Поиск информацмм ... ','',10);
        Q.First;
        slBookmark.Clear;
        while not Q.Eof do begin
          slBookmark.Add(Q.Bookmark);
          Q.Next;
        end;
        Q.First;
        CloseMessage();
      end;
      if OpisInit.CheckGISRN
        then fldGRN:=Q.FindField('POLE_GRN')
        else fldGRN:=nil;
      if OpisInit.tbUpdate=nil then begin
        arrFld:=StrToArr(strFldSeek,';',false);
        m := Length(arrFld);
      end else begin
        tbSeek := OpisInit.tbUpdate;
        if OpisInit.IndexFields=''
          then arrFld:=StrToArr(strFldSeek,';',false)
          else arrFld:=StrToArr(OpisInit.IndexFields,';',false);
        m := Length(arrFld);
      end;
      if m=1 then begin
        fld1 := Q.FindField(arrFld[0]);
        fld2 := nil;
      end else begin
        fld1 := Q.FindField(arrFld[0]);
        fld2 := Q.FindField(arrFld[1]);
      end;
      fldW_BH:=nil;
      fldAdd_BH:=nil;
      fldW:=tbSeek.FindField(OpisInit.FieldName);  // поле для обновления
      fldAdd:=nil;
      if (OpisInit.AddFieldName<>'') and (Copy(OpisInit.AddFieldName,1,1)<>'+') then begin
        fldAdd:=tbSeek.FindField(OpisInit.AddFieldName);
      end;
      oldInd:=tbSeek.IndexFieldNames;
      if OpisInit.tbUpdate=nil then begin
        tbSeek.IndexFieldNames:=strFldSeek;
      end else begin
        tbSeek.IndexFieldNames:=OpisInit.IndexFields;
      end;
      if lOk then begin
        GlobalTask.WriteToLogFile('Начало инициализации реквизита "'+ss+'"');
        OpenMessage('Выполнение инициализации... ','',10);
        for i:=0 to slBookmark.Count-1 do begin
          Q.Bookmark:=slBookmark.Strings[i];
          if m=1 then begin
            lSeek := tbSeek.FindKey([fld1.Value]);
          end else begin
            lSeek := tbSeek.FindKey([fld1.Value,fld2.Value]);
          end;
          nGrn:=0;
          {$IFDEF GISUN}
          if fldGRN=nil then begin
            lOkGrn:=true;
          end else begin
            nGrn:=Gisun.GetPoleGrn(fldGrn);
            if nGrn=rPost then begin  // запсиь была отправлена в ГИС РН
              lOkGrn:=false;    // пропустим зарегистрированные в ГИС РН
            end else begin
              lOkGrn:=true;
            end;
          end;
          {$ELSE}
            lOkGrn:=true;
          {$ENDIF}
          if lSeek and lOkGrn then begin
            while lSeek do begin
              tbSeek.Edit;
              try
                lErr := false;
                case Oper of
                  opWrite : begin
                              fldW.Value := OpisInit.Value;
                            end;
                  opClear : fldW.asString := '';
                  opPlus  : if fldW.AsString<>'' then fldW.Value := fldW.Value+OpisInit.Value;
                  opMinus : if fldW.AsString<>'' then fldW.Value := fldW.Value-OpisInit.Value;
                end;
                if Assigned(OpisInit.EventAddField) then begin
                  OpisInit.EventAddField(fldW,fldAdd,Oper);
                end;
                tbSeek.Post;
                if OpisInit.WriteObrab and (m=1) and (fmInitField.FTypeObj>0) then begin
                  {$IFDEF GISUN}
                  if nGrn=rPost then n:=UPDATEOBJ_OBRAB_GRN else n:=UPDATEOBJ_OBRAB;
                  {$ELSE}
                    n:=UPDATEOBJ_OBRAB;
                  {$ENDIF}
                  dmBase.WriteUpdateObj(n, fmInitField.FTypeObj, fld1.Value, nGrn, sKomm);  // fld1.Value д.б. значение поля 'ID'
                  {$IFDEF GISUN}
                  if nGrn=rPost then begin
                    // !!! запись соответствующего реквизита !!!
                  end;
                  {$ENDIF}
                end;
                //--------------------------------------
                {$IFDEF ADD_MENS_PU}
                if OpisInit.AddBigHouse then begin
                  adr:=dmBase.AdresForSeek(tbSeek);  // типа должен быть  tbAdres
                  if fldW_BH=nil then begin
                    fldW_BH:=dmBase.tbBigHouse.FindField(OpisInit.FieldName);  // поле для обновления
                    fldAdd_BH:=nil;
                    if (OpisInit.AddFieldName<>'') and (Copy(OpisInit.AddFieldName,1,1)<>'+') then begin
                      fldAdd_BH:=dmBase.tbBigHouse.FindField(OpisInit.AddFieldName);
                    end;
                  end;
                  if dmBase.FindBigHouse(adr, fmMain.DateFiks) then begin
                    dmBase.tbBigHouse.Edit;
                    case Oper of
                      opWrite : fldW_BH.Value := OpisInit.Value;
                      opClear : fldW_BH.asString := '';
                      opPlus  : if fldW_BH.AsString<>'' then fldW_BH.Value := fldW_BH.Value+OpisInit.Value;
                      opMinus : if fldW_BH.AsString<>'' then fldW_BH.Value := fldW_BH.Value-OpisInit.Value;
                    end;
                    if fldAdd<>nil then begin
                      OpisInit.EventAddField(fldW_BH,fldAdd_BH,Oper);
                    end;
                    dmBase.tbBigHouse.Post;
                  end;
                end;
                {$ENDIF}
              except
                lErr := true;
                tbSeek.Cancel;
              end;
              tbSeek.Next;
              //==== пока так, для очередников пройдемся для всех записей по ключу =======================
              if sTypeInit='OCHERED' then begin
                if not tbSeek.Eof then begin
                  if m=1 then lSeek:=tbSeek.FieldByName(fld1.FieldName).Value=fld1.Value
                         else lSeek:=(tbSeek.FieldByName(fld1.FieldName).Value=fld1.Value) and (tbSeek.FieldByName(fld2.FieldName).Value=fld2.Value);
                end else begin
                  lSeek:=false;
                end;
              end else begin
                lSeek:=false;
              end;
              //===========================
            end;
            if sAddOper='+' then begin
              if OpisInit.Tip='N'
                then OpisInit.Value:=OpisInit.Value+nPlus
                else OpisInit.Value:=InttoStr(StrToInt( VarToStr(OpisInit.Value) )+nPlus);
            end;
            if lErr then begin
              if Problem('Ошибка записи в реквизит "'+ss+'" значения: "'+VarToStr(OpisInit.Value)+'". Прервать обработку ?') then begin
                break;
              end;
            end;
          end else begin
            nSkip:=nSkip+1;
            // ошибка
          end;
        end;
      end;
    end;
  finally
    if lOk then begin
      GlobalTask.WriteToLogFile('Окончание инициализации реквизита "'+ss+'"');
      CloseMessage;
      if lBookmark
        then Q.Bookmark:=slBookmark.Strings[0]
        else Q.First;
      dbEnableControls(Q,l);
      tbSeek.IndexFieldNames:=oldInd;
      s:='Обработано записей: '+IntToStr(slBookmark.Count-nSkip);
      if nSkip>0
        then s:=s+#13#10+'Пропущено записей: '+IntToStr(nSkip);
      ShowMessage(s);
    end;
    slBookmark.Free;
    fmInitField.Free;
  end;
  Result:=lOk;
end;
//----------------------------------------------------------
function TfmInitField.InitArrOpis(nCount:Integer): Boolean;
var
  i:Integer;
begin
  Result:=true;
  SetLength(FArrOpisInit,nCount);
  for i:=0 to Length(FArrOpisInit)-1 do begin
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].AddBigHouse:=False;
    FArrOpisInit[i].EventAddField:=nil;
    FArrOpisInit[i].EnabledAll:=true;
    FArrOpisInit[i].CheckGISRN:=false;
    FArrOpisInit[i].WriteObrab:=false;
    FArrOpisInit[i].EnabledOper:=[opDefault];
  end;
end;
//--------------------------------------------------------
function TfmInitField.LoadOpisInit: Boolean;
var
  sName : String;
  i:Integer;
  lWriteObrab:Boolean;
begin
  lWriteObrab:=GlobalTask.ParamAsBoolean('WRITE_OBRAB');    // параметр пока заведен только для ZAH
  FIndexInit := -1;
  Result:=false;
  if FTypeInit=''
    then sName:=ANSIUpperCase(Table.TableName)
    else sName:=FTypeInit;
  if sName='НАСЕЛЕНИЕ' then begin
    Result:=true;
    InitArrOpis(5);

    i:=0;
    edRekv.Items.Add('Гражданство');
    FArrOpisInit[i].FieldName:='CITIZEN';
    FArrOpisInit[i].OpisEdit:='LOOKUP_STRAN';
    FArrOpisInit[i].Tip:='N';

    inc(i);
    edRekv.Items.Add('Класс/курс учебного заведения');
    FArrOpisInit[i].FieldName:='KURS';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='N';

    inc(i);
    edRekv.Items.Add('Место работы,должность');
    FArrOpisInit[i].FieldName:='WORK_SPR';
    FArrOpisInit[i].OpisEdit:='LOOKUP_WORK';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].EventAddField:=WriteWORK_SPR;
    FArrOpisInit[i].EnabledOper:=[opClear];

    inc(i);
    edRekv.Items.Add('Национальность');
    FArrOpisInit[i].FieldName:='NATION';
    FArrOpisInit[i].OpisEdit:='LOOKUP_NATION';
    FArrOpisInit[i].Tip:='N';

    inc(i);
    edRekv.Items.Add('Не включать в списки избирателей');
    FArrOpisInit[i].FieldName:='NOTSELECT';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='L';

  end else if sName='OCHERED' then begin
    {$IFDEF ADD_OCH}
    Result:=true;
    InitArrOpis(2);
    i:=0;
    edRekv.Items.Add('Дата сверки');
    FArrOpisInit[i].FieldName:='PER_DATE';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='D';
    FArrOpisInit[i].tbUpdate:=dmBase.tbOchered;
    FArrOpisInit[i].IndexFields:='ID';
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].AddBigHouse:=False;
    Inc(i,1);

    edRekv.Items.Add('Номер дела (+1)');
    FArrOpisInit[i].FieldName:='N_DELO';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=dmBase.tbOchered;
    FArrOpisInit[i].IndexFields:='ID';
    FArrOpisInit[i].AddFieldName:='+1';
    FArrOpisInit[i].EventAddField:=WriteNDELO;
    FArrOpisInit[i].AddBigHouse:=False;

    {$ENDIF}
  end else if sName='ZAH' then begin
    {$IFDEF ADD_ZAH}
    Result:=true;
    InitArrOpis(5);
    i:=0;
    edRekv.Items.Add('Номер книги');
    FArrOpisInit[i].FieldName:='BOOK';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].CheckGISRN:=true;
    FArrOpisInit[i].WriteObrab:=lWriteObrab;

    Inc(i,1);
    edRekv.Items.Add('Вид захоронения');
    FArrOpisInit[i].FieldName:='ZH_VID';
    FArrOpisInit[i].OpisEdit:='KEY_ZH_VID';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].WriteObrab:=lWriteObrab;

    Inc(i,1);
    edRekv.Items.Add('Номер могилы');
    FArrOpisInit[i].FieldName:='ZH_MOG';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='C';
    FArrOpisInit[i].CheckGISRN:=true;
    FArrOpisInit[i].WriteObrab:=lWriteObrab;

    Inc(i,1);
    edRekv.Items.Add('Кладбище');
    FArrOpisInit[i].FieldName:='ZH_KLAD';
    FArrOpisInit[i].OpisEdit:='LOOKUP_ZAH';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].EnabledAll:=false;
    FArrOpisInit[i].CheckGISRN:=true;
    FArrOpisInit[i].WriteObrab:=lWriteObrab;

    Inc(i,1);
    edRekv.Items.Add('Организация по услугам');
    FArrOpisInit[i].FieldName:='USLUG_SPR';
    FArrOpisInit[i].OpisEdit:='LOOKUP_WORK';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].EventAddField:=WriteUSLUG;
    FArrOpisInit[i].EnabledAll:=false;
    FArrOpisInit[i].CheckGISRN:=false;
    FArrOpisInit[i].WriteObrab:=lWriteObrab;

    {$ENDIF}
  end else if sName='VUS' then begin
    {$IFDEF ADD_MENS_PU}
    Result:=true;
    InitArrOpis(2);
     {
    edRekv.Items.Add('Дата сверки с ВК');
    FArrOpisInit[0].FieldName:='DATESV_VK';
    FArrOpisInit[0].OpisEdit:='';
    FArrOpisInit[0].Tip:='D';
    FArrOpisInit[0].tbUpdate:=dmBase.tbVUS;
    FArrOpisInit[0].IndexFields:='ID';
    FArrOpisInit[0].AddFieldName:='';
    FArrOpisInit[0].AddBigHouse:=False;

    edRekv.Items.Add('Дата сверки с карточкой регистрации');
    FArrOpisInit[1].FieldName:='DATESV_LIC';
    FArrOpisInit[1].OpisEdit:='';
    FArrOpisInit[1].Tip:='D';
    FArrOpisInit[1].tbUpdate:=dmBase.tbVUS;
    FArrOpisInit[1].IndexFields:='ID';
    FArrOpisInit[1].AddFieldName:='';
    FArrOpisInit[1].AddBigHouse:=False;

    edRekv.Items.Add('Дата сверки с формой 2');
    FArrOpisInit[2].FieldName:='DATESV_F2';
    FArrOpisInit[2].OpisEdit:='';
    FArrOpisInit[2].Tip:='D';
    FArrOpisInit[2].tbUpdate:=dmBase.tbVUS;
    FArrOpisInit[2].IndexFields:='ID';
    FArrOpisInit[2].AddFieldName:='';
    FArrOpisInit[2].AddBigHouse:=False;
     }
    edRekv.Items.Add('Призывник');
    FArrOpisInit[0].FieldName:='PRIZ';
    FArrOpisInit[0].OpisEdit:='';
    FArrOpisInit[0].Tip:='L';
    FArrOpisInit[0].tbUpdate:=dmBase.tbVUS;
    FArrOpisInit[0].IndexFields:='ID';
    FArrOpisInit[0].AddFieldName:='';
    FArrOpisInit[0].AddBigHouse:=False;

    edRekv.Items.Add('Звание-дополнение');
    FArrOpisInit[1].FieldName:='ZVAN2';
    FArrOpisInit[1].OpisEdit:='KEY_VUS_ZVANI2';
    FArrOpisInit[1].Tip:='N';
    FArrOpisInit[1].tbUpdate:=dmBase.tbVUS;
    FArrOpisInit[1].IndexFields:='ID';
    FArrOpisInit[1].AddFieldName:='';
    FArrOpisInit[1].EventAddField:=nil;
    FArrOpisInit[1].AddBigHouse:=false;

    {$ENDIF}
  end else if sName='БАЗАДОМОВ' then begin
    Result:=true;
    InitArrOpis(5);

    edRekv.Items.Add('Находится в ведении');
    i:=0;
    FArrOpisInit[i].FieldName:='CONTROL';
    FArrOpisInit[i].OpisEdit:='KEY_CONTROL_HOUSE';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='PRIVATE_SECT';
    FArrOpisInit[i].EventAddField:=WritePrivateSect;
    FArrOpisInit[i].AddBigHouse:=True;

    edRekv.Items.Add('Осуществляет эксплуатацию');
    i:=1;
    FArrOpisInit[i].FieldName:='USE_GILFOND';
    FArrOpisInit[i].OpisEdit:='KEY_USE_GILFOND';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].EventAddField:=nil;
    FArrOpisInit[i].AddBigHouse:=True;

    edRekv.Items.Add('Представляет собой');
    i:=2;
    FArrOpisInit[i].FieldName:='PREDST';
    FArrOpisInit[i].OpisEdit:='LOOKUP_PREDST';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].AddBigHouse:=False;

    edRekv.Items.Add('Включать в жилфонд');
    i:=3;
    FArrOpisInit[i].FieldName:='GILFOND';
    FArrOpisInit[i].OpisEdit:='KEY_VKL_GILFOND';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].AddBigHouse:=False;

    edRekv.Items.Add('Улица');
    i:=4;
    FArrOpisInit[i].FieldName:='UL';
    FArrOpisInit[i].OpisEdit:='LOOKUP_UL';
    FArrOpisInit[i].Tip:='N';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].AddFieldName:='';
    FArrOpisInit[i].AddBigHouse:=False;

  end else if sName='ЛИЦЕВЫЕСЧЕТА' then begin
    Result:=true;
    i:=7;
//    if GlobalTask.ParamAsBoolean('OTM_MNS_LPX') then Inc(i,1);

    InitArrOpis(i);
    i:=0;

    edRekv.Items.Add('Основание заселения');
    FArrOpisInit[i].FieldName:='OSNOV_ID';
    FArrOpisInit[i].OpisEdit:='KEY_OSNOV_ZASEL';
    FArrOpisInit[i].Tip:='N';
    Inc(i,1);

    edRekv.Items.Add('Не включать в формы статистики');
    FArrOpisInit[i].FieldName:='NOT_STAT';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='L';
    Inc(i,1);

    edRekv.Items.Add('Номер лиц. счета (с шагом +1)');
    FArrOpisInit[i].FieldName:='NOMER';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='C';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='+1';
    FArrOpisInit[i].EventAddField:=nil;
    FArrOpisInit[i].AddBigHouse:=False;
    Inc(i,1);

    edRekv.Items.Add('Номер книги');
    FArrOpisInit[i].FieldName:='KNIGA_NOMER';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='C';
    Inc(i,1);

    edRekv.Items.Add('Номер страницы (с шагом +1)');
    FArrOpisInit[i].FieldName:='KNIGA_STR';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='C';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='+1';
    FArrOpisInit[i].EventAddField:=nil;
    FArrOpisInit[i].AddBigHouse:=False;
    Inc(i,1);

    edRekv.Items.Add('Номер страницы (с шагом +2)');
    FArrOpisInit[i].FieldName:='KNIGA_STR';
    FArrOpisInit[i].OpisEdit:='';
    FArrOpisInit[i].Tip:='C';
    FArrOpisInit[i].tbUpdate:=nil;
    FArrOpisInit[i].IndexFields:='';
    FArrOpisInit[i].AddFieldName:='+2';
    FArrOpisInit[i].EventAddField:=nil;
    FArrOpisInit[i].AddBigHouse:=False;
    Inc(i,1);

//    if GlobalTask.ParamAsBoolean('OTM_MNS_LPX') then begin
      edRekv.Items.Add('Выгрузка в Минтруда');
      FArrOpisInit[i].FieldName:='MNS_LPX';
      FArrOpisInit[i].OpisEdit:='';
      FArrOpisInit[i].Tip:='L';
      Inc(i,1);
//    end;

  end;
end;

procedure TfmInitField.WritePrivateSect(SourceField,DestField : TField; Oper:TOper);
begin
  if (SourceField<>nil) and (DestField<>nil) then begin
    if SourceField.IsNull then begin
      DestField.AsString:='';
    end else if SourceField.AsInteger=CONTROL_PRIVATE then begin
      DestField.AsBoolean:=true;
    end else begin
      DestField.AsBoolean:=false;
    end;
  end;
end;

procedure TfmInitField.WriteNDELO(SourceField,DestField : TField; Oper:TOper);
begin
  if (SourceField<>nil) then begin
    if SourceField.IsNull then begin
      SourceField.DataSet.FieldByName('DELO').AsString:='';
    end else begin
      SourceField.DataSet.FieldByName('DELO').AsString:=SourceField.AsString;
    end;
  end;
end;
procedure TfmInitField.WriteUSLUG(SourceField,DestField : TField; Oper:TOper);
begin
  if (SourceField<>nil) then begin
    if SourceField.IsNull or (Oper=opClear) then begin
      SourceField.DataSet.FieldByName('USLUG').AsString:='';
    end else begin
      if dmBase.SprWork.Locate('ID', SourceField.AsString, []) then begin
        if dmBase.SprWork.FieldByName('NAME').AsString=''
          then SourceField.DataSet.FieldByName('USLUG').AsString:=dmBase.SprWork.FieldByName('FNAME').AsString
          else SourceField.DataSet.FieldByName('USLUG').AsString:=dmBase.SprWork.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

procedure TfmInitField.WriteWORK_SPR(SourceField,DestField : TField; Oper:TOper);
var
  ds:TDataSet;
begin
  if (SourceField<>nil) then begin
    ds:=SourceField.DataSet;
    if Oper=opClear then begin
      ds.FieldByName('WORK_SPR').AsString:='';
      ds.FieldByName('DOLG_SPR').AsString:='';
      ds.FieldByName('DOLG_NAME').AsString:='';
      dmBase.DeleteProp(ds.FieldByName('DATE_FIKS').AsDateTime, ds.FieldByName('ID').AsInteger, 'WORK_NAME', ftMemo);
    end;
  end;
end;

procedure TfmInitField.edRekvChange(Sender: TObject);
var
  i : Integer;
  Opis : TOpisEdit;
begin
  if edRekv.ItemIndex>-1 then begin
    i:=edRekv.ItemIndex;
    if FArrOpisInit[i].OpisEdit<>'' then begin
      if Copy(FArrOpisInit[i].OpisEdit,1,4)='KEY_' then begin
        GlobalTask.CurrentOpisEdit.GetListOpis(FArrOpisInit[i].OpisEdit,edList.Items,edList.KeyItems);
        CheckEditControl(FArrOpisInit[i],false,true,false,false,false,false);
      end else begin
        Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(FArrOpisInit[i].OpisEdit);
        if Opis<>nil then begin
          DataSource.DataSet:=Opis.DataSet;
          edSpr.KeyField:=Opis.ResultField;
          edSpr.ListField:=Opis.FieldForNaim;
          CheckEditControl(FArrOpisInit[i],true,false,false,false,false,false);
        end else begin

        end;
      end;
    end else begin
      if FArrOpisInit[i].Tip='N' then begin
        CheckEditControl(FArrOpisInit[i],false,false,true,false,false,false);
      end else if FArrOpisInit[i].Tip='D' then begin
        CheckEditControl(FArrOpisInit[i],false,false,false,false,true,false);
      end else if FArrOpisInit[i].Tip='C' then begin
        CheckEditControl(FArrOpisInit[i],false,false,false,true,false,false);
      end else if FArrOpisInit[i].Tip='L' then begin
        CheckEditControl(FArrOpisInit[i],false,false,false,false,false,true);
      end;
    end;
    if (FArrOpisInit[i].AddFieldName<>'') and (Copy(FArrOpisInit[i].AddFieldName,1,1)='+') then begin
      GroupBox2.Caption:=' Начальное значение ';
    end else begin
      GroupBox2.Caption:=' Новое значение ';
    end;

  end else begin
  end;
end;

procedure TfmInitField.CheckEditControl(op:TOpisInit; lSpr,lList,lNomer,lString,lDate,lBoolean: Boolean);
var
  nLeft,nWidth : Integer;
begin
  edSpr.Visible:=lSpr;
  edList.Visible:=lList or lBoolean;
  edNumeric.Visible:=lNomer;
  edDate.Visible:=lDate;
  edString.Visible:=lString;
  edOper.Visible:=true;
  edOper.Items.Clear;
  if  (opWrite in op.EnabledOper) or (op.EnabledOper=[opDefault])
    then edOper.Items.Add(OP_WRITE);
  if (op.EnabledAll and (op.EnabledOper=[opDefault])) or (opClear in op.EnabledOper)
    then edOper.Items.Add(OP_CLEAR);
  nLeft  := edOper.Left+edOper.Width+10;
  nWidth := edRekv.Width-(nLeft-edRekv.Left);
  if lSpr then begin
    edSpr.Left  := nLeft;
    edSpr.Width := nWidth;
    FControl := edSpr;
  end;
  if lDate then begin
    edDate.Left  := nLeft;
//    edDate.Width := nWidth;
    FControl := edDate;
  end;
  if lString then begin
    edString.Left  := nLeft;
    edString.Width := 150;
    edString.Top   := edOper.Top;
    FControl := edString;
  end;
  if lList or lBoolean then begin
    edList.Left  := nLeft;
    edList.Width := nWidth;
    FControl := edList;
  end;
  if lBoolean then begin
    edList.KeyItems.Clear;
    edList.KeyItems.Add('1');
    edList.KeyItems.Add('0');
    edList.Items.Clear;
    edList.Items.Add('Да');
    edList.Items.Add('Нет');
    edList.Width := nWidth;
    FControl := edList;
  end;
  if lNomer then begin
    edNumeric.Left  := nLeft;
    edNumeric.Width := 80;
    if (op.EnabledAll and (op.EnabledOper=[opDefault])) or (opPlus in op.EnabledOper)
      then edOper.Items.Add(OP_PLUS);
    if (op.EnabledAll and (op.EnabledOper=[opDefault])) or (opMinus in op.EnabledOper)
      then edOper.Items.Add(OP_MINUS);
    FControl := edNumeric;
  end;
  edOper.ItemIndex:=0;
  edOperChange(edOper);
end;

function TfmInitField.GetOper : TOper;
var
  s:String;
begin
  Result:=opWrite;
  if edOper.ItemIndex>=0 then begin
    s:=edOper.Items[edOper.ItemIndex];
    if s=OP_WRITE then
      Result:=opWrite
    else if s=OP_CLEAR then
      Result:=opClear
    else if s=OP_MINUS then
      Result:=opMinus
    else if s=OP_PLUS then
      Result:=opPlus;
  end;
end;

procedure TfmInitField.edOperChange(Sender: TObject);
begin
  if edRekv.ItemIndex>-1 then begin
    if GetOper=opClear then begin
      FControl.Enabled:=false;
      FControl.Value:=null;
    end else begin
      FControl.Enabled:=true;
    end;
  end;
end;

function TfmInitField.CheckOk : Boolean;
begin
  Result:=false;
  if edRekv.ItemIndex>-1 then begin
    if (GetOper<>opClear) and (FControl.Text='') then begin
      Result:=false;
    end else begin
      FIndexInit := edRekv.ItemIndex;
      FArrOpisInit[FIndexInit].Value := FControl.Value;
      Result:=true;
    end;
  end;
{
    i:=edRekv.ItemIndex
    if FArrOpisInit[i].OpisEdit<>'' then begin
      if Copy(FArrOpisInit[i].OpisEdit,1,10)='LOOKUP_' then begin

      end;
    end else begin

    end;
  end;
 }
end;


procedure TfmInitField.Button1Click(Sender: TObject);
var
  op:TOper;
  s:String;
begin
  op:=GetOper;
  case op of
    opWrite: s:=OP_WRITE;
    opClear: s:=OP_CLEAR;
    opPlus:  s:=OP_PLUS;
    opMinus: s:=OP_MINUS;
  end;
  ShowMessage(s);
end;

end.

