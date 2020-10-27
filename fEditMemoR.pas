unit fEditMemoR;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, NewDialogs,
  StdCtrls, Buttons, ExtCtrls, db, FuncPr, uProject, ComCtrls;

type
  TfmEditMemoR = class(TForm)
    Panel1: TPanel;
    btCansel: TBitBtn;
    btSave: TBitBtn;
    edMemo: TRichEdit;
    procedure btSaveClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//  function EditMemoHS(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;
  function EditMemoR(strMemo : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;


implementation

{$R *.DFM}

function EditMemoR(strMemo : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
  f:TfmEditMemoR;
  lerr:Boolean;
  SStrm:TStringStream;
begin
  Result := false;
  f:=TfmEditMemoR.Create(nil);

//  f.edMemo.HunSpell:=uproject.HunSpell;  // !!!

  if nWidth>0 then begin
    f.Width:=nWidth;
  end;
  if HostControl<>nil then begin
    UstDropDownForm(f,HostControl);
  end;
  if strCaption<>'' then begin
    if Pos(';',strCaption)=0 then begin
      f.Caption:=strCaption;
    end else begin
      StrToArr(strCaption,arr,';',false);
      SetLength(arr,3);
      f.Caption:=arr[0];
      if arr[1]='' then begin
        f.btSave.Visible:=false;
      end else begin
        f.btSave.Caption:=arr[1];
      end;
      if arr[2]='' then begin
        f.btCansel.Visible:=false;
      end else begin
        f.btCansel.Caption:=arr[2];
      end;
    end;
  end else begin
    f.Caption:='Примечание';
  end;
//  f.edMemo.Text:=strMemo;
  SStrm:=TStringStream.Create(strMemo);
  f.edMemo.Lines.LoadFromStream(SStrm);
  SStrm.Free;
  if f.ShowModal=mrOk then begin
//    strMemo := f.edMemo.Text;
    Result:=true;
  end;
  FreeAndNil(f);
end;

procedure TfmEditMemoR.btSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmEditMemoR.btCanselClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmEditMemoR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
  end;
end;

procedure TfmEditMemoR.FormClose(Sender: TObject; var Action: TCloseAction);
var
  n:Integer;
begin
  Action:=caFree;
  {
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
  }
end;

end.
