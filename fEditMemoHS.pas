unit fEditMemoHS;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, NewDialogs,
  StdCtrls, Buttons, ExtCtrls, db, FuncPr, uProject, HunSpellMemo;

type
  TfmEditMemoHS = class(TForm)
    Panel1: TPanel;
    btCansel: TBitBtn;
    btSave: TBitBtn;
    edMemo: THunSpellMemo;
    procedure btSaveClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function EditMemoHS(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;
  function EditMemoHS(var strMemo : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;


implementation

var
  fmEditMemo: TfmEditMemoHS;

{$R *.DFM}

function EditMemoHS(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
begin
  Result := false;
  fmEditMemo:=TfmEditMemoHS.Create(nil);

  fmEditMemo.edMemo.HunSpell:=uproject.HunSpell;  // !!!

  if nWidth>0 then begin
    fmEditMemo.Width:=nWidth;
  end;
  if HostControl<>nil then begin
    UstDropDownForm(fmEditMemo,HostControl);
  end;
  if strCaption<>'' then begin
    if Pos(';',strCaption)=0 then begin
      fmEditMemo.Caption:=strCaption;
    end else begin
      StrToArr(strCaption,arr,';',false);
      SetLength(arr,3);
      fmEditMemo.Caption:=arr[0];
      if arr[1]='' then begin
        fmEditMemo.btSave.Visible:=false;
      end else begin
        fmEditMemo.btSave.Caption:=arr[1];
      end;
      if arr[2]='' then begin
        fmEditMemo.btCansel.Visible:=false;
      end else begin
        fmEditMemo.btCansel.Caption:=arr[2];
      end;
    end;
  end else begin
    fmEditMemo.Caption:='Примечание';
  end;
  fmEditMemo.edMemo.Lines.Text := ds.FieldByName(strFieldName).AsString;
  if fmEditMemo.ShowModal=mrOk then begin
    try
      if (ds.State<>dsEdit) and (ds.State<>dsInsert) then begin
        ds.Edit;
      end;
      ds.FieldByName(strFieldName).AsString := fmEditMemo.edMemo.Lines.Text;
      Result:=true;
    except
      Beep;
      PutError('Ошибка записи в поле '+strFieldName);
    end;
  end;
  FreeAndNil(fmEditMemo);
end;

function EditMemoHS(var strMemo : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
begin
  Result := false;
  fmEditMemo:=TfmEditMemoHS.Create(nil);

  fmEditMemo.edMemo.HunSpell:=uproject.HunSpell;  // !!!

  if nWidth>0 then begin
    fmEditMemo.Width:=nWidth;
  end;
  if HostControl<>nil then begin
    UstDropDownForm(fmEditMemo,HostControl);
  end;
  if strCaption<>'' then begin
    if Pos(';',strCaption)=0 then begin
      fmEditMemo.Caption:=strCaption;
    end else begin
      StrToArr(strCaption,arr,';',false);
      SetLength(arr,3);
      fmEditMemo.Caption:=arr[0];
      if arr[1]='' then begin
        fmEditMemo.btSave.Visible:=false;
      end else begin
        fmEditMemo.btSave.Caption:=arr[1];
      end;
      if arr[2]='' then begin
        fmEditMemo.btCansel.Visible:=false;
      end else begin
        fmEditMemo.btCansel.Caption:=arr[2];
      end;
    end;
  end else begin
    fmEditMemo.Caption:='Примечание';
  end;
  fmEditMemo.edMemo.Lines.Text := strMemo;
  if fmEditMemo.ShowModal=mrOk then begin
    strMemo := fmEditMemo.edMemo.Lines.Text;
    Result:=true;
  end;
  FreeAndNil(fmEditMemo);
end;

procedure TfmEditMemoHS.btSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmEditMemoHS.btCanselClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmEditMemoHS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
  end;
end;

procedure TfmEditMemoHS.FormClose(Sender: TObject; var Action: TCloseAction);
var
  n:Integer;
begin
  Action:=caFree;
  if edMemo.Modified and (ModalResult<>mrOk) then begin
    ModalResult:=mrNone;
    n := QuestionPos(' Сохранить изменения ? ',
        'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation, Self);
    //-------------------------------------------------
    if n=1 then begin //Problem('    Сохранить документ ?    ') then begin
      ModalResult:=mrOk;
    end else if n=2 then begin
      ModalResult:=mrCancel;
    end else begin
      Action:=caNone;
    end;
  end;
end;

end.
