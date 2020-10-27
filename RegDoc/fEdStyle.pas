unit fEdStyle;
interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, CheckLst;

type
   TfmEdStyle=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      chbStyle: TCheckListBox;
   end;

function EditStyle(var Style: string; IsTable: Boolean): Boolean;

implementation
{$R *.dfm}

function EditStyle(var Style: string; IsTable: Boolean): Boolean;
var
   I: Integer;
   sl: TStringList;
begin
   Result:=False;
   with TfmEdStyle.Create(nil) do begin
      sl:=TStringList.Create;
      try
         if IsTable then begin
            chbStyle.Items.CommaText:='bsView,bsMaster,bsDetail,bsReadOnly,bsSpr,bsTree,bsAllSelable,bsOrder,bsPickList,bsConfirmDelete,bsFindVisible';
         end
         else begin
            chbStyle.Items.CommaText:='fsServerSide,fsFindVisible,fsViewVisible,fsEditVisible,fsCaseInsensitive,fsAlwaysUpper,fsInternal,fsInOrderBy,fsAscOrder,fsDescOrder,fsNotNull,fsFTS,fsFaset,fsLookup,fsReadOnly,fsKeyField,fsLookupCombo';
         end;
         sl.CommaText:=Style;
         for I:=0 to Pred(sl.Count) do begin
            chbStyle.Checked[chbStyle.Items.IndexOf(sl[I])]:=True;
         end;
         if ShowModal=mrOk then begin
            sl.Clear;
            for I:=0 to Pred(chbStyle.Items.Count) do begin
               if chbStyle.Checked[I] then begin
                  sl.Add(chbStyle.Items[I]);
               end;
            end;
            Style:=sl.CommaText;
            Result:=True;
         end;
      finally
         Free;
         sl.Free;
      end;
   end;
end;

end.
