unit fGrpDK; // [5.09.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   mFindInt, StdCtrls;

type
   TfmGrpDK=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      rbFull: TRadioButton;
      rbYear: TRadioButton;
      rbMonth: TRadioButton;
      rbDayOfMonth: TRadioButton;
   end;

function GetDateKind(var DateKind: TDateKind): Boolean;

implementation

{$R *.DFM}

function GetDateKind(var DateKind: TDateKind): Boolean;
begin
   Result:=False;
   with TfmGrpDK.Create(nil) do begin
      try
         rbFull.Checked:=DateKind=dkFull;
         rbYear.Checked:=DateKind=dkYear;
         rbMonth.Checked:=DateKind=dkMonth;
         rbDayOfMonth.Checked:=DateKind=dkDayOfMonth;
         if ShowModal=mrOk then begin
            if rbFull.Checked then DateKind:=dkFull
            else if rbYear.Checked then DateKind:=dkYear
            else if rbMonth.Checked then DateKind:=dkMonth
            else if rbDayOfMonth.Checked then DateKind:=dkDayOfMonth;
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

end.
