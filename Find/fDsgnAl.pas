unit fDsgnAl; // designer align form [20.10.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls;

type
   THorzAlign=(haNone, haLeft, haRight, haCenter, haEqual);
   TVertAlign=(vaNone, vaTop, vaBottom, vaCenter, vaEqual);

   TAlignDlgParam=record
      HorzAlign: THorzAlign;
      VertAlign: TVertAlign;
   end;

   TfmDsgnAlign=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      rgHorz: TRadioGroup;
      rgVert: TRadioGroup;
   public
      procedure UpdateParam(var Param: TAlignDlgParam);
   end;

function ShowDesignerAlignDialog(var Param: TAlignDlgParam): Boolean;

implementation

{$R *.DFM}

function ShowDesignerAlignDialog(var Param: TAlignDlgParam): Boolean;
begin
   Result:=False;
   with TfmDsgnAlign.Create(nil) do begin
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

{ TfmDsgnAlign }

procedure TfmDsgnAlign.UpdateParam(var Param: TAlignDlgParam);
begin
   case rgHorz.ItemIndex of
      0: Param.HorzAlign:=haNone;
      1: Param.HorzAlign:=haLeft;
      2: Param.HorzAlign:=haCenter;
      3: Param.HorzAlign:=haRight;
      4: Param.HorzAlign:=haEqual;
   end;
   case rgVert.ItemIndex of
      0: Param.VertAlign:=vaNone;
      1: Param.VertAlign:=vaTop;
      2: Param.VertAlign:=vaCenter;
      3: Param.VertAlign:=vaBottom;
      4: Param.VertAlign:=vaEqual;
   end;
end;

end.
