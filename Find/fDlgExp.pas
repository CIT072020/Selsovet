unit fDlgExp; //
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls;

type
   TfmDlgExp=class(TForm)
      btRewrite: TButton;
      btAppend: TButton;
      btCancel: TButton;
      laMsg: TLabel;
      imConfirm: TImage;
      procedure FormCreate(Sender: TObject);
   end;

function FileExistsMsg(FileName: string; AppendButton: Boolean; var RewriteAppend: Boolean): Boolean;

implementation

{$R *.DFM}

function FileExistsMsg(FileName: string; AppendButton: Boolean; var RewriteAppend: Boolean): Boolean;
begin
   Result:=False;
   with TfmDlgExp.Create(nil) do begin
      try
         if not AppendButton then begin
            laMsg.Caption:='Файл "%s" уже существует. Переписать его заново?';
            btAppend.Visible:=False;
            btRewrite.Left:=btAppend.Left;
         end;
         laMsg.Caption:=Format(laMsg.Caption, [FileName]);
         ShowModal;
         if ModalResult<>mrCancel then begin
            RewriteAppend:=ModalResult=mrYes;
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

procedure TfmDlgExp.FormCreate(Sender: TObject);
begin
   imConfirm.Picture.Icon.Handle:=LoadIcon(0, IDI_QUESTION);
end;

end.
