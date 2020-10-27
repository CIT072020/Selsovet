unit fLgotSeek;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, Buttons, ExtCtrls, DbGridEh, Db, FuncPr, uProjectAll,
  CheckLst;

type

  TTypeSeekMens = (tsLgot, tsPrizn);

  TfmLgotSeek = class(TForm)
    gbOp: TGroupBox;
    Panel1: TPanel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    gbSeek: TGroupBox;
    rbOneValue: TRadioButton;
    rbAllValue: TRadioButton;
    cbSeek: TCheckListBox;
    GroupBox1: TGroupBox;
    cbVozr: TComboBox;
    Vozr1: TDBNumberEditEh;
    Vozr2: TDBNumberEditEh;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    cbPol: TComboBox;
    procedure cbVozrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;

  function RunMensSeek( nType : TTypeSeekMens; lWhere : Boolean; strFieldID : String; sAlias:String ) : String;

implementation

uses dBase, StdConvs;

{$R *.DFM}

function RunMensSeek( nType : TTypeSeekMens; lWhere : Boolean; strFieldID : String; sAlias:String ) : String;
var
  strField : String;
  strSeek,strDop  : String;
  ds : TDataSet;
  i,nV1,nV2 : Integer;
  ss,sV : String;
  fmLgotSeek : TfmLgotSeek;
  strTable : String;
  slKey : TStringList;
begin
{
SELECT *
FROM Население
WHERE ID in (SELECT ID FROM НаселениеЛьготы WHERE KOD=2 or kod=3)
}
  if nType=tsLgot then begin
    strTable := 'НаселениеЛьготы';
    ds := dmBase.SprLgot;
  end else begin
    strTable := 'НаселениеПризнаки';
    ds := dmBase.SprPrNasel;
  end;
  strSeek := '';
  fmLgotSeek := TfmLgotSeek.Create(nil);
  slKey := TStringList.Create;
  ds.First;
  while not ds.Eof do begin
    fmLgotSeek.cbSeek.Items.Add( ds.FieldByName('NAME').AsString);
    slKey.Add( ds.FieldByName('ID').AsString );
    ds.Next;
  end;
  Result := '';
  if fmLgotSeek.ShowModal=mrOk then begin
    strField := 'KOD';
    strSeek  := '';
    strDop   := '';
    if fmLgotSeek.rbOneValue.Checked then begin  // любое значение
      if lWhere then ss := ' or '
                else ss := ' .OR. ';
      for i:=0 to fmLgotSeek.cbSeek.Items.Count-1 do begin
        if fmLgotSeek.cbSeek.Checked[i] then begin
          if Length(strSeek)>0
            then strSeek := strSeek + ss;
          strSeek := strSeek+' '+strField+'='+slKey.Strings[i]+' ';
        end;
      end;
      Result := ' EXISTS (SELECT * FROM '+strTable+
        ' WHERE date_fiks=:datefiks and id='+strFieldID+' and ('+strSeek+'))';
    end else begin         // все значения
      ss := ' and ';
      for i:=0 to fmLgotSeek.cbSeek.Items.Count-1 do begin
        if fmLgotSeek.cbSeek.Checked[i] then begin
          if Length(strSeek)>0
            then strSeek := strSeek + ss;
          strSeek := strSeek + ' EXISTS (SELECT * FROM '+strTable+
              ' WHERE date_fiks=:datefiks and id='+strFieldID+' and '+
              strField+'='+slKey.Strings[i]+')';
        end;
      end;
      Result := strSeek;
    end;
    i:=fmLgotSeek.cbVozr.ItemIndex;
    sV:='GetVozrast(CURDATE(),n.dater)';
    if i>0 then begin
      try
        nV1:=fmLgotSeek.Vozr1.Value;
      except
        nV1:=0;
      end;
      try
        nV2:=fmLgotSeek.Vozr2.Value;
      except
        nV2:=0;
      end;
      if i=1 then begin  // младше трудоспособного
        ss:='Trud(CurDate(), DATER, POL)=0';
//        ss:=sV+'<'+InttoStr(TrudVozr);
      end else if i=2 then begin  // в трудоспособном
        ss:='Trud(CurDate(), DATER, POL)=1';
//        ss:='( (pol=''М'' and '+sV+'>='+InttoStr(TrudVozr)+' and '+sV+'<'+InttoStr(PensVozrM)+') or '+
//             '(pol=''Ж'' and '+sV+'>='+InttoStr(TrudVozr)+' and '+sV+'<'+InttoStr(PensVozrG)+') )';
      end else if i=3 then begin  // старше трудоспособного
        ss:='Trud(CurDate(), DATER, POL)=2';
//        ss:='((pol=''М'' and '+sV+'>='+InttoStr(PensVozrM)+') or '+
//           '(pol=''Ж'' and '+sV+'>='+InttoStr(PensVozrG)+'))'
      end else if i=4 then begin  // точный возраст
        if nV2>0 then begin
          ss:='('+sV+'>='+InttoStr(nV1)+' and '+sV+'<='+InttoStr(nV2)+')';
        end else begin
          ss:=sV+'>='+InttoStr(nV1);
        end;
      end;
      Result:=Result+' and '+ss;
    end;
    i:=fmLgotSeek.cbPol.ItemIndex;
    if i>0 then begin
      if i=1 then begin
        ss:='(pol=''М'')';
      end else begin
        ss:='(pol=''Ж'')';
      end;
      Result:=Result+' and '+ss;
    end;
  end;
  fmLgotSeek.Free;
  slKey.Free;
end;

procedure TfmLgotSeek.UpdateActions;
var
 i : Integer;
 lEnable : Boolean;
begin
  inherited;
  lEnable := false;
  for i:=0 to cbSeek.Items.Count-1 do begin
    if cbSeek.Checked[i] then begin
      lEnable := true;
      break;
    end;
  end;
  btOk.Enabled := lEnable;
end;

procedure TfmLgotSeek.cbVozrClick(Sender: TObject);
begin
  Vozr1.Enabled:=(cbVozr.ItemIndex=4);
  Vozr2.Enabled:=(cbVozr.ItemIndex=4);
end;

end.
