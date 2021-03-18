unit fEditRecSprWork;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, OpisEdit,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata, dbFunc, uTypes,
  adsfunc, adstable, FuncPr, MetaTask, uProjectAll;

type
  TfmEditRecSprWork = class(TForm)
    lbOrgan: TLabel;
    Label2: TLabel;
    edFName: TDBEditEh;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    DataSource1: TDataSource;
    Query: TAdsQuery;
    QuerySeek: TAdsQuery;
    edSMDO: TDBEditEh;
    Label1: TLabel;
    edRukov: TDBEditEh;
    Label3: TLabel;            
    edEmail: TDBEditEh;
    Label4: TLabel;
    edTel: TDBEditEh;
    Label5: TLabel;
    edName: TDBEditEh;
    Label6: TLabel;
    Label7: TLabel;
    edAdres: TDBEditEh;
    Label8: TLabel;
    edBookDate: TDBDateTimeEditEh;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edNomer: TDBNumberEditEh;
    Label13: TLabel;
    edFax: TDBEditEh;
    edAbonent: TDBEditEh;
    edPostIndex: TDBEditEh;
    edSOATO: TDBEditEh;
    gbCheck: TGroupBox;
    cbKorr: TDBCheckBoxEh;
    cbGilfond: TDBCheckBoxEh;
    cbControl: TDBCheckBoxEh;
    cbTerr: TDBCheckBoxEh;
    edCorrType: TDBComboBoxEh;
    cbGosud: TDBCheckBoxEh;
    procedure edSMDOChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edSMDOEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    FClearKey : Boolean;
  public
    dsOrg:TDataSet;
    ID : Integer;
    FRun : Boolean;
    FAdd : Boolean;
  end;

var
  fmEditRecSprWork: TfmEditRecSprWork;

implementation

uses dBase, uProject;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure TfmEditRecSprWork.edSMDOChange(Sender: TObject);
begin
  if not FRun then begin
  end;
end;
//--------------------------------------------------------------
procedure TfmEditRecSprWork.btOkClick(Sender: TObject);
var
  lOk:Boolean;
begin
  lOk:=true;
  if edName.Text='' then begin
    PutError('Заполните наименование.',self);
    lOk:=false;
  end;
  if lOk
    then ModalResult:=mrOk;
end;

procedure TfmEditRecSprWork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmEditRecSprWork.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
end;

procedure TfmEditRecSprWork.FormCreate(Sender: TObject);
var
  strSQL : String;
  n:Integer;
begin
// 'KEY_CORR_TYPE'
  FAdd:=false;
  ID:=-1;
  lSetDecimal:=false;
  FClearKey:=false;
//  s := GlobalTask.ParamAsString('KOD');
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_CORR_TYPE',edCorrType.Items,edCorrType.KeyItems);
end;
//-------------------------------------------------------------------
procedure TfmEditRecSprWork.edSMDOEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sID,sBook,sSMDO,s,ss:String;
  nCount,nID:Integer;
begin
  if ID=0 then begin
    PutError('Невозможно выполнить операцию (ID=0)');
    exit;
  end else if ID=-1 then begin  // новая запись
    sID:='';
  end else begin
    sID:=' and id<>'+IntToStr(ID);
  end;
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_NAME');
  if Opis<>nil then begin
    v:=edSMDO.Text;
    if Opis.ChoiceFromSprEx(edSMDO, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        sSMDO:=GetValueFieldEx(arrRec, 'SMDOCODE', '');
        try
          dmBase.WorkQuery.SQL.Text:='SELECT count(*) FROM СпрМестРаботы WHERE smdocode='+QStr(sSMDO)+sID;
          dmBase.WorkQuery.Open;
          nCount:=dmBase.WorkQuery.Fields[0].AsInteger;
          dmBase.WorkQuery.Close;
        except
          nCount:=0;
        end;
        if nCount>0 then begin
          PutError('Выбранная организация '+sSmdo+' уже существует в справочнике.');
        end else begin
          edSMDO.Text:=sSMDO;
          if edName.Text='' then begin
            edFName.Text:=GetValueFieldEx(arrRec, 'NAME', '');
            edName.Text:=GetValueFieldEx(arrRec, 'shortname', '');
            edTel.Text:=GetValueFieldEx(arrRec, 'phone', '');
            edEmail.Text:=GetValueFieldEx(arrRec, 'email', '');
            edFax.Text:=GetValueFieldEx(arrRec, 'fax', '');
            edAbonent.Text:=GetValueFieldEx(arrRec, 'abonentbox', '');
            edPostIndex.Text:=GetValueFieldEx(arrRec, 'postindex', '');
            edSOATO.Text:=GetValueFieldEx(arrRec, 'soato', '');
            edAdres.Text:=GetValueFieldEx(arrRec, 'street', '');
            s:=GetValueFieldEx(arrRec, 'home', '');
            if s<>'' then s:=', д.'+s;
            ss:=GetValueFieldEx(arrRec, 'corpus', '');
            if ss<>'' then s:=s+', корп.'+ss;
            if s<>'' then  edAdres.Text:=edAdres.Text+s;
          end;
        end;
      end;
    end;
  end;
end;

end.
