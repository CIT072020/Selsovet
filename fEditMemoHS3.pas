unit fEditMemoHS3;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, NewDialogs,
  StdCtrls, Buttons, ExtCtrls, db, FuncPr, uProject, HunSpellMemo;

type
  TfmEditMemoHS3 = class(TForm)
    Panel1: TPanel;
    btCansel: TBitBtn;
    btSave: TBitBtn;
    GroupBox1: TGroupBox;
    edMemo: THunSpellMemo;
    GroupBox2: TGroupBox;
    edMemoON: THunSpellMemo;
    GroupBox3: TGroupBox;
    edMemoONA: THunSpellMemo;
    btShablon: TBitBtn;
    procedure btSaveClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btShablonClick(Sender: TObject);
    procedure edMemoEnter(Sender: TObject);
    procedure edMemoONEnter(Sender: TObject);
    procedure edMemoONAEnter(Sender: TObject);
  private
    { Private declarations }
    FShablon:Integer;
    CurEd:THunSpellmemo;
  public
    { Public declarations }
  end;

//  function EditMemoHS(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;
  function EditMemoHS3(var strMemo : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;


implementation

uses fShablon;

var
  fmEditMemo: TfmEditMemoHS3;

{$R *.DFM}

procedure PrepereText(fm: TfmEditMemoHS3; s:String);
var
  i:Integer;
  arr:TArrStrings;
begin
  i:=CharCount('#',s)+1;
  StrToArr(s,arr,'#',false);
  SetLength(arr,i);
  if i=1 then begin
    fm.edMemo.text:=s;
  end else if i=2 then begin
    fm.edMemoON.text:=Trim(arr[0]);
    fm.edMemoONA.text:=Trim(arr[1]);
  end else begin
    fm.edMemo.text:=Trim(arr[0]);
    fm.edMemoON.text:=Trim(arr[1]);
    fm.edMemoONA.text:=Trim(arr[2]);
  end;
end;

function CreateText(fm: TfmEditMemoHS3):String;
var
 s,sON,sONA:String;
begin
  Result:='';
  s:=Trim(fm.edMemo.text);
  sON:=Trim(fm.edMemoON.text);
  sONA:=Trim(fm.edMemoONA.text);
  if (s='') and (sON='') and (sONA='') then begin
    Result:='';
  end else if s='' then begin
    Result:=sON+' #'+sONA;
  end else begin
    if (sON='') and (sONA='') then begin
      Result:=s;
    end else begin
      Result:=s+' #'+sON+' #'+sONA;
    end;
  end;
end;
{
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
}
function EditMemoHS3(var strMemo : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
begin
  Result := false;
  fmEditMemo:=TfmEditMemoHS3.Create(nil);
  fmEditMemo.edMemo.HunSpell:=uproject.HunSpell;  // !!!
  fmEditMemo.FShablon:=SHABLON_NATION;
  fmEditMemo.CurEd:=nil;

  if nWidth>0 then begin
    fmEditMemo.Width:=nWidth;
  end;
  if HostControl<>nil then begin
    UstDropDownForm(fmEditMemo,HostControl);
  end;

  fmEditMemo.GroupBox2.Caption:=' Отец ';
  fmEditMemo.GroupBox3.Caption:=' Мать ';

  if strCaption<>'' then begin
    if Pos(';',strCaption)=0 then begin
      fmEditMemo.Caption:=strCaption;
    end else begin
      StrToArr(strCaption,arr,';',false);
      SetLength(arr,5);
      fmEditMemo.Caption:=arr[0];
      if arr[1]<>'' then begin
        fmEditMemo.GroupBox2.Caption:=arr[1];
      end;
      if arr[2]<>'' then begin
        fmEditMemo.GroupBox3.Caption:=arr[2];
      end;
      if arr[3]='*' then begin
        fmEditMemo.btSave.Visible:=false;
      end else begin
        if arr[3]<>'' then fmEditMemo.btSave.Caption:=arr[3];
      end;
      if arr[4]='*' then begin
        fmEditMemo.btCansel.Visible:=false;
      end else begin
        if arr[4]<>'' then fmEditMemo.btCansel.Caption:=arr[4];
      end;
    end;
  end else begin
    fmEditMemo.Caption:='Примечание';
  end;

//  fmEditMemo.edMemo.Lines.Text := strMemo;
  PrepereText(fmEditMemo,strMemo);
  if fmEditMemo.ShowModal=mrOk then begin
    strMemo:=CreateText(fmEditMemo);
//    strMemo := fmEditMemo.edMemo.Lines.Text;
    Result:=true;
  end;
  FreeAndNil(fmEditMemo);
end;

procedure TfmEditMemoHS3.btSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmEditMemoHS3.btCanselClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmEditMemoHS3.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
   VK_F10   : btShablonClick(nil);
  end;
end;

procedure TfmEditMemoHS3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  n:Integer;
begin
  Action:=caFree;
  if (edMemo.Modified or edMemoON.Modified or edMemoONA.Modified) and (ModalResult<>mrOk) then begin
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

procedure TfmEditMemoHS3.btShablonClick(Sender: TObject);
var
 s,s1,s2:String;
 n:Integer;
 ed:THunSpellmemo;
begin
  if CurEd<>nil then begin
    ed:=CurEd;
    s:=ChoiceFromShablon(FShablon);
    if s<>'' then begin
      n:=ed.SelStart;
      ed.SelStart:=0;
      ed.SelLength:=0;
      s1:=Copy(ed.Lines.Text,1,n);
      s2:=Copy(ed.Lines.Text,n+1,Length(ed.Lines.Text));
      ed.Lines.Text := s1+s+s2;
      ed.SelStart:=Length(s1+s);
    end;
    Activecontrol:=ed;
  end;
end;

procedure TfmEditMemoHS3.edMemoEnter(Sender: TObject);
begin
 CurEd:=edMemo;
end;

procedure TfmEditMemoHS3.edMemoONEnter(Sender: TObject);
begin
 CurEd:=edMemoON;
end;

procedure TfmEditMemoHS3.edMemoONAEnter(Sender: TObject);
begin
 CurEd:=edMemoONA;
end;

end.
