unit fNewNomerAktZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject,
  FuncPr, AddEvents, dbFunc, uTypes,
  Dialogs, StdCtrls, Buttons, DBLookupEh, DBCtrlsEh, Mask, dBase, DB;

type
  TfmNewNomerAktZ = class(TForm)
    lbNomer: TLabel;
    Label2: TLabel;
    lbOrgan: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edNomer: TDBNumberEditEh;
    edDate: TDBDateTimeEditEh;
    edOrgan: TDBLookupComboboxEh;
    dsOrgan: TDataSource;
    dsSeria: TDataSource;
    lbNomer2: TLabel;
    edNomer2: TDBNumberEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FError:String;
    FVosstan:Boolean;
    FOnlySvid:Boolean;
    FAddNomer:Boolean;
    FTypeObj:Integer;
    FClearKey:Boolean;
    FMainTable:TDataSet;
    FSeekID:Integer;
    function Check:Boolean;
    procedure UpdateActions; override;
  end;

  // obj: TfmSimpleD
  //      TDataSet
  function CreateNewAkt(lOnlySvid:Boolean; obj:TObject; nTypeObj:Integer; var nNomer:Integer; var dDate:TDateTime; var nOrgan:Integer;
                        var sSeria:String; var sNomer:String; var nAddNomer:Integer ) : Integer;


implementation

uses MetaTask,OpisEdit,fSimpleD;

{$R *.dfm}

function CreateNewAkt(lOnlySvid:Boolean; obj:TObject; nTypeObj:Integer; var nNomer:Integer; var dDate:TDateTime; var nOrgan:Integer;
                                   var sSeria:String; var sNomer:String; var nAddNomer:Integer ) : Integer;
var
  f:TfmNewNomerAkt;
  Opis : TOpisEdit;
  lSvid:Boolean;
  tb:TDataSet;
  fDok:TfmSimpleD;
begin       
  Result:=0;
  fDok:=nil;
  if obj is TDataSet then begin
    tb:=TDataSet(obj);
    if lOnlySvid then begin
      exit;
      // Error !!!
    end;
  end else begin
    fDok:=TfmSimpleD(obj);
    tb:=fDok.FMainTable;
    fDok.FBOOKMARK_SVIDPOVTOR:='';
  end;
  lSvid:=false;
  f:=TfmNewNomerAkt.Create(nil);
  f.FSeekID:=0;
  f.FAddNomer:=false;
  f.FMainTable:=tb;
  f.FTypeObj:=nTypeObj;
  f.FVosstan:=false;
  f.FOnlySvid:=lOnlySvid;
  if nTypeObj=_TypeObj_DBrak then begin
    f.Caption:='Ќовое за€вление о регистрации брака';
  end else if nTypeObj=_TypeObj_DRast then begin
    f.Caption:='Ќовое за€вление о расторжении брака';
  end else if nTypeObj=_TypeObj_AktZAH then begin
    f.Caption:='Ќова€ информаци€';
    if nAddNomer>-1 then begin
      f.FAddNomer:=true;
      f.lbNomer2.Top:=f.lbNomer.Top;
      f.lbNomer2.Left:=f.edNomer.Left+f.edNomer.Width+2;
      f.lbNomer2.Visible:=true;
      f.edNomer2.Top:=f.edNomer.Top;
      f.edNomer2.Left:=f.lbNomer2.Left+f.lbNomer2.Width+2;
      f.edNomer2.Visible:=true;
      f.edOrgan.Visible:=false;
      f.lbOrgan.Visible:=false;
    end;  
  end else begin
    if lOnlySvid then begin
      f.Caption:='ѕовторное свидетельство записи акта';
    end;
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
    if Opis<>nil then begin
      f.Caption:=f.Caption+' '+Opis.Naim(nTypeObj,false);
    end;
  end;
  if nNomer>0 then f.edNomer.Value:=nNomer;
  if nAddNomer>0 then f.edNomer2.Value:=nAddNomer;
  if dDate<=0 then dDate:=dmBase.getCurDate;
  f.edDate.Value:=dDate;
  if lOnlySvid
    then f.edDate.Value:=null;
  f.edOrgan.Value:=MyID; //GlobalTask.ParamAsInteger('ID');
  if sNomer<>'' then begin
    lSvid:=true;
    f.edSvid_Nomer.EditMask:=EM_NomerSvid;
    f.edSvid_Seria.Value:=sSeria;
    f.edSvid_Nomer.Text:=sNomer;
    f.edSvid_Seria.Visible:=true;
    f.edSvid_Nomer.Visible:=true;
    f.lbSvid1.Visible:=true;
    f.lbSvid2.Visible:=true;
  end else begin
    lSvid:=false;
    f.edSvid_Nomer.Text:='';
  end;
  if f.ShowModal=mrOk then begin
    nNomer:=f.edNomer.Value;
    if f.FAddNomer then begin
      try
        if f.edNomer2.Value<>null
          then nAddNomer:=f.edNomer2.Value
          else nAddNomer:=0;
      except
        nAddNomer:=0;
      end;
    end else begin
      nAddNomer:=0;
    end;
    dDate:=f.edDate.Value;
    nOrgan:=f.edOrgan.Value;
    if lSvid then begin
      sSeria:=f.edSvid_Seria.Text;
      sNomer:=Trim(f.edSvid_Nomer.Text);
    end;
    try
      if f.FSeekID=0 then begin
        tb.Append;
        
        tb.FieldByName('NOMER').AsInteger:=nNomer;
        if f.FAddNomer and (nAddNomer>0) then begin
          tb.FieldByName('NOMER2').AsInteger:=nAddNomer;
        end;
        tb.FieldByName('DATEZ').AsDateTime:=dDate;
        tb.FieldByName('ID_ZAGS').AsInteger:=nOrgan;

        if not f.FOnlySvid and ((f.FTypeObj=_TypeObj_ZRogd) or (f.FTypeObj=_TypeObj_ZSmert)) then begin
          tb.FieldByName('SPRAV_NOMER').AsString:=tb.FieldByName('NOMER').AsString;
          tb.FieldByName('SPRAV_DATE').AsDateTime:=dDate;
        end;

        //-------------------------------------------------------------------------------------------------------
        if lSvid and (sNomer<>'') and not lOnlySvid then begin    // не повторное свидетельство
          tb.FieldByName('SVID_SERIA').AsString:=sSeria;
          tb.FieldByName('SVID_NOMER').AsString:=sNomer;
          tb.FieldByName('DATESV').AsDateTime:=dDate;
        end;
        //-------------------------------------------------------------------------------------------------------
        tb.Post;
        Result:=tb.FieldByName('ID').AsInteger;
        fDok.FCheckNewNomerAkt:=true;     // !!!
      end else begin
        Result:=f.FSeekID;
      end;
      //-------------------------------------------------------------------------------------------------------
      {$IFDEF ZAGS}
      if lSvid and (sNomer<>'') and lOnlySvid then begin    // повторное свидетельство   !!! fDok д.б. не nil
        dmBase.SvidPovtor.Append;
        dmBase.SvidPovtor.FieldByName('SVID_TYPE').AsInteger := nTypeObj;
        dmBase.SvidPovtor.FieldByName('AKT_ID').AsInteger := Result;
        dmBase.SvidPovtor.FieldByName('SVID_DATE').AsDateTime:= Now;
        dmBase.SvidPovtor.FieldByName('SVID_NOMER').AsString := sNomer;
        dmBase.SvidPovtor.FieldByName('SVID_SERIA').AsString := sSeria;
        dmBase.SvidPovtor.FieldByName('FIRST').AsBoolean:=false;
        dmBase.SvidPovtor.Post;
        fDok.FBOOKMARK_SVIDPOVTOR:=dmBase.SvidPovtor.Bookmark;
      end;
      {$ENDIF}
      //-------------------------------------------------------------------------------------------------------

    except
      Result:=-1;
      tb.Cancel;
    end;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmNewNomerAktZ.FormCreate(Sender: TObject);
begin
  btOk.Caption:=BT_CREATE_OK;
  btCAncel.Caption:=BT_CREATE_CANCEL;
end;
//--------------------------------------------------------------------------------
procedure TfmNewNomerAktZ.UpdateActions;
begin
  inherited;
  btOk.Enabled:=( (edNomer.Value<>null) and (edDate.Value<>null) and (edOrgan.Value<>null) );
end;
//--------------------------------------------------------------------------------
procedure TfmNewNomerAktZ.btOkClick(Sender: TObject);
begin
  if Check then begin
    ModalResult:=mrOk;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmNewNomerAktZ.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Shift=[]) and (Key=VK_F2) then begin
     if Check then begin
       Key:=0;
       FClearKey:=true;
       ModalResult:=mrOk;
     end;
  end else begin
    Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmNewNomerAktZ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;
//--------------------------------------------------------------------------------
function TfmNewNomerAktZ.Check: Boolean;
var
  arr:TArrStrings;
begin
  FSeekID:=0;
  if btOk.Enabled then begin
    if FOnlySvid then begin
      Result:=true;
      arr:=dmBase.SeekAkt(FTypeObj,edOrgan.Value,edNomer.Value,edDate.Value,FVosstan);
      if Length(arr)>0 then begin
        FSeekID:=FMainTable.FieldByName('ID').AsInteger;
      end else begin

      end;
    end else begin
      Result:=dmBase.CheckNomerAkt(FTypeObj, edOrgan.Value, -1, edNomer.Value, edDate.Value, FVosstan);
    end;
  end else begin
    Result:=false;
  end;
end;

end.
