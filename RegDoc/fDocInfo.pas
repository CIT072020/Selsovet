unit fDocInfo;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGridEh, DB, kbmMemTable, ExtCtrls;

type
   TfmDocInfo=class(TForm)
      btClose: TButton;
      dsoInfo: TDataSource;
      gbDocInfo: TGroupBox;
      paDocInfo: TPanel;
      dgInfo: TDBGridEh;
      procedure dgInfoColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
   private
      InfoId: TField;
      InfoValue: TField;
      FgColor: TField;
      BgColor: TField;
   end;

procedure ShowDocInfo(dsDocInfo: TDataSet; gbText: string);

implementation
uses
   mDRecInt;

{$R *.dfm}

procedure ShowDocInfo(dsDocInfo: TDataSet; gbText: string);
begin
   with TfmDocInfo.Create(nil) do begin
      try
         //NB: !!! добавить автоматичекий подбор высоты
         gbDocInfo.Caption:=gbText;
         InfoId:=dsDocInfo.FieldByName('ID');
         InfoValue:=dsDocInfo.FieldByName('VALUE');
         FgColor:=dsDocInfo.FieldByName('FG_COLOR');
         BgColor:=dsDocInfo.FieldByName('BG_COLOR');
         dsoInfo.DataSet:=dsDocInfo;
         ShowModal;
      finally
         Free;
      end;
   end;
end;

procedure TfmDocInfo.dgInfoColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
   if InfoId.AsInteger<>Ord(diBlank) then begin
      if InfoValue.AsInteger=0 then begin
         Params.Text:='нет';
      end
      {--else if InfoId.AsInteger=diSkipTerm then begin
         Params.Background:=CRedBackground;
         Params.Font.Color:=clRed;
      end
      else if InfoId.AsInteger=diTotalExec then begin
         Params.Background:=CNavyBackground;
         Params.Font.Color:=clNavy;
      end}
      else begin
         //--Params.Background:=CGreenBackground;
         //--Params.Font.Color:=clGreen;
         Params.Background:=TColor(BgColor.AsInteger);
         Params.Font.Color:=TColor(FgColor.AsInteger);
      end;
   end
   else begin
      Params.Text:='';
   end;
end;

end.
