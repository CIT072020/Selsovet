unit fEditMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, db, FuncPr;

type

  TParEditMemo=class
  public
    FontSize:Integer;
    ScrollStyle:TScrollStyle;
    Width:Integer;
    Top:Integer;
    // ...

  end;

  TfmEditMemo = class(TForm)
    Panel1: TPanel;
    btCansel: TBitBtn;
    btSave: TBitBtn;
    edMemo: TMemo;
    procedure btSaveClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function EditMemo(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;
  function EditMemo(var strMemo : String; strCaption : String; HostControl:TControl=nil; nWidth:Integer=0) : Boolean; overload;

var
  EditMemo_FontSize:Integer;
  EditMemo_ScrollBars:TScrollStyle;
//  TScrollStyle = (ssNone, ssHorizontal, ssVertical, ssBoth);

implementation

var
  fmEditMemo: TfmEditMemo;

{$R *.DFM}

//function SetParEditMemo(ParMemo:TParEditMemo);
//begin
//
//end;

function EditMemo(ds : TDataSet; strFieldName : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
begin
  Result := false;
  fmEditMemo:=TfmEditMemo.Create(nil);
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
  fmEditMemo.edMemo.Font.Size:=EditMemo_FontSize;
  fmEditMemo.edMemo.ScrollBars:=EditMemo_ScrollBars;
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

function EditMemo(var strMemo : String; strCaption : String; HostControl:TControl; nWidth:Integer) : Boolean;
var
  arr:TArrStrings;
begin
  Result := false;
  fmEditMemo:=TfmEditMemo.Create(nil);
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
  if Pos('<READONLY>', strMemo)>0 then begin
    strMemo:=StringReplace(strMemo,'<READONLY>','',[]);
    fmEditMemo.edMemo.ReadOnly:=true;
    fmEditMemo.edMemo.Color:=clInfoBk;
    fmEditMemo.btSave.Visible:=false;
    fmEditMemo.btCansel.Caption:='Закрыть';
  end;
  fmEditMemo.edMemo.Font.Size:=EditMemo_FontSize;
  fmEditMemo.edMemo.ScrollBars:=EditMemo_ScrollBars;
  fmEditMemo.edMemo.Lines.Text := strMemo;
  if fmEditMemo.ShowModal=mrOk then begin
    if not fmEditMemo.edMemo.ReadOnly
      then strMemo:=fmEditMemo.edMemo.Lines.Text;
    Result:=true;
  end;
  FreeAndNil(fmEditMemo);
end;

procedure TfmEditMemo.btSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmEditMemo.btCanselClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmEditMemo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
  end;
end;

initialization
  EditMemo_FontSize:=11;
  EditMemo_ScrollBars:=ssNone;

end.
