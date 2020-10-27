unit fDsgnSz; // designer size form [20.10.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, ExtCtrls;

type
   TSizeDlgParam=record
      NoWidthChange: Boolean;
      NoHeightChange: Boolean;
      NewWidth: Integer;
      NewHeight: Integer;
      MaxWidth: Integer;
      MinWidth: Integer;
      MaxHeight: Integer;
      MinHeight: Integer;
   end;

   TfmDsgnSize=class(TForm)
      btOK: TButton;
      btCancel: TButton;
      rgWidth: TRadioGroup;
      rgHeight: TRadioGroup;
      edWidth: TEdit;
      udWidth: TUpDown;
      edHeight: TEdit;
      udHeight: TUpDown;
      procedure rgWidthClick(Sender: TObject);
      procedure rgHeightClick(Sender: TObject);
   public
      procedure UpdateParam(var Param: TSizeDlgParam);
   end;

function ShowDesignerSizeDialog(var Param: TSizeDlgParam): Boolean;

implementation

{$R *.DFM}

function ShowDesignerSizeDialog(var Param: TSizeDlgParam): Boolean;
begin
   Result:=False;
   with TfmDsgnSize.Create(nil) do begin
      try
         if ShowModal=mrOk then begin
            UpdateParam(Param);
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

procedure TfmDsgnSize.rgWidthClick(Sender: TObject);
begin
   edWidth.Enabled:=rgWidth.ItemIndex=3;
   udWidth.Enabled:=rgWidth.ItemIndex=3;
end;

procedure TfmDsgnSize.rgHeightClick(Sender: TObject);
begin
   edHeight.Enabled:=rgHeight.ItemIndex=3;
   udHeight.Enabled:=rgHeight.ItemIndex=3;
end;

procedure TfmDsgnSize.UpdateParam(var Param: TSizeDlgParam);
begin
   case rgWidth.ItemIndex of
      0: begin
         Param.NoWidthChange:=True;
      end;
      1: begin
         Param.NoWidthChange:=False;
         Param.NewWidth:=Param.MinWidth;
      end;
      2: begin
         Param.NoWidthChange:=False;
         Param.NewWidth:=Param.MaxWidth;
      end;
      3: begin
         Param.NoWidthChange:=False;
         Param.NewWidth:=udWidth.Position;
      end;
   end;
   //
   case rgHeight.ItemIndex of
      0: begin
         Param.NoHeightChange:=True;
      end;
      1: begin
         Param.NoHeightChange:=False;
         Param.NewHeight:=Param.MinHeight;
      end;
      2: begin
         Param.NoHeightChange:=False;
         Param.NewHeight:=Param.MaxHeight;
      end;
      3: begin
         Param.NoHeightChange:=False;
         Param.NewHeight:=udHeight.Position;
      end;
   end;
end;

end.
