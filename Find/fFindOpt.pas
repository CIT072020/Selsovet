// форма редактирования настроек диалога параметрезированных условий для поиска
unit fFindOpt; // find parameters option form [25.08.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, mFindInt;

type
   TfmFindOpt=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      laCaption: TLabel;
      edCaption: TEdit;
      chbSaveValue: TCheckBox;
      chbShowClearButton: TCheckBox;
      chbShowCaption: TCheckBox;
      procedure chbShowCaptionClick(Sender: TObject);
   private
      procedure ChangeShowCaption;
   end;

function ShowParamOption(Filter: TFindList): Boolean;

implementation

{$R *.DFM}

function ShowParamOption(Filter: TFindList): Boolean;
begin
   Result:=False;
   with TfmFindOpt.Create(nil) do begin
      try
         edCaption.Text:=Filter.Params.Caption;
         if edCaption.Text='' then begin
            edCaption.Text:=Filter.Caption;
         end;
         chbSaveValue.Checked:=poSaveValue in Filter.Params.Option;
         chbShowClearButton.Checked:=poShowClearButton in Filter.Params.Option;
         chbShowCaption.Checked:=poShowCaption in Filter.Params.Option;
         ChangeShowCaption;
         if ShowModal=mrOk then begin
            Filter.Params.Caption:=Trim(edCaption.Text);
            if chbSaveValue.Checked then begin
               Filter.Params.Option:=Filter.Params.Option+[poSaveValue];
            end
            else begin
               Filter.Params.Option:=Filter.Params.Option-[poSaveValue];
            end;
            if chbShowClearButton.Checked then begin
               Filter.Params.Option:=Filter.Params.Option+[poShowClearButton];
            end
            else begin
               Filter.Params.Option:=Filter.Params.Option-[poShowClearButton];
            end;
            if chbShowCaption.Checked then begin
               Filter.Params.Option:=Filter.Params.Option+[poShowCaption];
            end
            else begin
               Filter.Params.Option:=Filter.Params.Option-[poShowCaption];
            end;
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

procedure TfmFindOpt.ChangeShowCaption;
begin
   laCaption.Enabled:=chbShowCaption.Checked;
   edCaption.Enabled:=chbShowCaption.Checked;
end;

procedure TfmFindOpt.chbShowCaptionClick(Sender: TObject);
begin
   ChangeShowCaption;
end;

end.
