// форма выбора значения из справочника
unit fFindSel; // select from dataset form [24.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, DBGridEh, StdCtrls, mFindInt, IniFiles, DB, TypInfo;

type
   TfmSelVal=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      dgSpr: TDBGridEh;
      laSpr: TLabel;
      dsSpr: TDataSource;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure dgSprDblClick(Sender: TObject);
   private
      FSpr: TSPrItem;
   public
      procedure LoadLayout(Ini: TCustomIniFile; Section: string);
      procedure SaveLayout(Ini: TCustomIniFile; Section: string);
   end;

function SelectFindValue(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;

implementation

{$R *.DFM}

function SelectFindValue(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;
var
   KeyField: TField;
   NameField: TField;
begin
   Result:=False;
   if (Spr<>nil) and (Spr.DataSet<>nil) then begin
      if not Spr.DataSet.Active then begin
         Spr.DataSet.Open;
      end;
      KeyField:=Spr.DataSet.FindField(Spr.KeyFieldName);
      NameField:=Spr.DataSet.FindField(Spr.NameFieldName);
      if Value<>'' then begin
         Spr.DataSet.Locate(Spr.KeyFieldName, Value, [loCaseInsensitive]);
      end;
      with TfmSelVal.Create(nil) do begin
         try
            FSpr:=Spr;
            laSpr.Caption:=Spr.Caption;
            dsSpr.DataSet:=FSpr.DataSet;
            LoadLayout(Ini, FSpr.Name+'.'+Section);
            if ShowModal=mrOk then begin
               if KeyField<>nil then begin
                  Value:=KeyField.AsString;
               end;
               if NameField<>nil then begin
                  ValCaption:=NameField.AsString;
               end;
               Result:=True;
            end;
            if AutoSave then begin
               SaveLayout(Ini, FSpr.Name+'.'+Section);
            end;
         finally
            Free;
         end;
      end;
   end;
end;

procedure TfmSelVal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         ModalResult:=mrCancel;
      end;
      VK_RETURN: begin
         ModalResult:=mrOk;
      end;
   end;
end;

procedure TfmSelVal.LoadLayout(Ini: TCustomIniFile; Section: string);
var
   I: Integer;
   S: string;
   Ind: Integer;
   FieldName: string;
begin
   for I:=0 to Pred(dgSpr.Columns.Count) do begin
      FieldName:=dgSpr.Columns[I].FieldName;
      Ind:=FSpr.FieldNames.IndexOfName(FieldName);
      if Ind<>-1 then begin
         dgSpr.Columns[I].Visible:=True;
         S:=FSpr.FieldNames.Values[FieldName];
         if S<>'' then begin
            dgSpr.Columns[I].Title.Caption:=S;
         end;
      end
      else begin
         dgSpr.Columns[I].Visible:=False;
      end;
   end;
   if (Ini<>nil) and (Section<>'') then begin
      Top:=Ini.ReadInteger(Section, 'Top', Self.Top);
      Left:=Ini.ReadInteger(Section, 'Left', Self.Left);
      Width:=Ini.ReadInteger(Section, 'Width', Self.Width);
      Height:=Ini.ReadInteger(Section, 'Height', Self.Height);
      WindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)))));
      dgSpr.RestoreColumnsLayout(Ini, Section, [crpColIndexEh, crpColWidthsEh]);
   end;
end;

procedure TfmSelVal.SaveLayout(Ini: TCustomIniFile; Section: string);
begin
   if (Ini<>nil) and (Section<>'') then begin
      if WindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, 'Top', Self.Top);
         Ini.WriteInteger(Section, 'Left', Self.Left);
         Ini.WriteInteger(Section, 'Width', Self.Width);
         Ini.WriteInteger(Section, 'Height', Self.Height);
      end;
      Ini.WriteString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)));
      dgSpr.SaveColumnsLayout(Ini, Section);
   end;
end;

procedure TfmSelVal.dgSprDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

end.
