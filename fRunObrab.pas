unit fRunObrab;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  StdCtrls, Buttons, ExtCtrls, sasaIniFile, MetaTask, mPermit, FuncPr, ComCtrls
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type

  TOpisObrab = record
    Sect : String;
    Name : String;
    Komm : String;
    Caption : String;
    SQL  : String;
    Proc : String;
    RunOnce  : Boolean;
    RunCount : Integer;
  end;
  TArrOpisObrab = array of TOpisObrab;

  TfmRunObrab = class(TForm)
    pn: TPanel;
    pnOpis: TPanel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    edOpis: TMemo;
    lb: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbClick(Sender: TObject);
  private
    ini : TSasaIniFile;
  public
    ArrOpis : TArrOpisObrab;
    procedure Load;
    procedure Run;
    function Choice : Boolean;
    procedure UpdateActions; override;
    function GetItemIndex : Integer;
  end;

  procedure RunObrab;

implementation

uses fMain, dBase;

var
  fmRunObrab: TfmRunObrab;

{$R *.DFM}

procedure RunObrab;
begin
  fmRunObrab := TfmRunObrab.Create(nil);
  try
    if fmRunObrab.Choice then begin
      fmRunObrab.Run;
    end;
  finally
    fmRunObrab.Free;
  end;
end;

{ TfmRunObrab }

procedure TfmRunObrab.Load;
var
  lRunOnce : Boolean;
  i,j,nRunCount : Integer;
  sl,sect : TStringList;
  strCaption,strProc,strName,strKomm,strSQL,strSect,s,ss,strUser : String;
begin
  SetLength(arrOpis,0);
  sl  := TStringList.Create;
  sect:= TStringList.Create;
  ini.ReadSections(sect);
  for i:=0 to sect.Count-1 do begin
    strSect := sect.Strings[i];
    if ini.SectionExists(strSect) then begin
      if ini.ReadString(strSect, 'VISIBLE', '1')='1' then begin
        strName := ini.ReadString(strSect, 'NAME', '');
        strUser := ANSIUpperCase(ini.ReadString(strSect, 'USER', ''));
        if (strName <> '') and ((strUser='') or Role.SystemAdmin or (Pos(Role.User,strUser)>0) or (Role.Status=rsAdmin)) then begin
          lRunOnce  := ini.ReadBool(strSect, 'RUNONCE', false);
          nRunCount := ini.ReadInteger(strSect, 'RUNCOUNT', 0);
          strKomm   := ini.ReadString(strSect, 'KOMM', '');
          strProc   := ini.ReadString(strSect, 'PROCEDURE', '');
          strCaption:= ini.ReadString(strSect, 'CAPTION', ' Выполнение обработки ... ');
          //-------------------------------------------------------------------
          strSQL := '';
          ini.ReadSectionValues(strSect,sl);
          for j:=0 to sl.Count-1 do begin
            if Copy(sl.Names[j],1,3)='SQL' then begin
              s:=Trim(sl.ValueFromIndex[j]);
              CharDel(s,'"');
              if Copy(sl.Names[j],4,1)='_' then begin
                ss:=Trim(Copy(sl.Names[j],5,20));
                //---- !!!  если строка не для текущей программы, то игнорируем ее !!! -------
                if ss<>fmMain.IDProg
                  then s:='';
                //----------------------------------------------------------------------------
              end;
              if s<>''
                then strSQL:=strSQL+s+#13#10;
            end;
          end;
          {
          strSQL := '';
          for j:=1 to 50 do begin
            s := ini.ReadString(strSect, 'SQL'+IntToStr(j), '');
            CharDel(s,'"');
            if s<>'' then strSQL := strSQL + s + #13#10;
          end;
          }
          if not lRunOnce or (nRunCount<1) then begin
            SetLength(arrOpis, Length(arrOpis)+1);
            j := Length(arrOpis)-1;
            arrOpis[j].Sect     := strSect;
            arrOpis[j].Name     := strName;
            arrOpis[j].Komm     := strKomm;
            arrOpis[j].RunOnce  := lRunOnce;
            arrOpis[j].RunCount := nRunCount;
            arrOpis[j].SQL      := strSQL;
            arrOpis[j].Proc     := strProc;
            arrOpis[j].Caption  := strCaption;
          end;
        end;
      end;
    end;
  end;
  sl.Free;
  sect.Free;
  if Length(arrOpis)=0 then begin
    btOk.Enabled := false;
  end else begin
    edOpis.Text := arrOpis[0].Komm;
    for i:=0 to Length(arrOpis)-1 do begin
      lb.Items.Add(arrOpis[i].Name);
//      it.Caption := arrOpis[i].Name;
    end;
  end;
end;

function TfmRunObrab.Choice: Boolean;
begin
  Load;
  ActiveControl := lb;
  Result := (ShowModal = mrOk);
end;

function TfmRunObrab.GetItemIndex : Integer;
//var
//  i : Integer;
begin
  Result := lb.ItemIndex;
//  for i:=0 to lb.Items.Count-1 do begin
//    if lb.Items[i].Selected then begin
//      Result := i;
//    end;
//  end;
end;

procedure TfmRunObrab.Run;
var
  i,j,nCount,n,nn,m : Integer;
  v : Variant;
  lErr,lKomm : Boolean;
  arrSQL:TArrStrings;
  s,sKomm:String;
begin
  if GetItemIndex > -1 then begin // ItemIndex>-1 then begin
    nCount:=0;
    i:=GetItemIndex;
    lErr:=true;
    if ArrOpis[i].Proc<>'' then begin
      v := null;
      fmMain.RunProcScript(ArrOpis[i].Proc,v);
      if (v=null) or (v=true) then begin
        lErr := false;
      end;
    end else if ArrOpis[i].SQL<>'' then begin
      if Problem('Выполнить обработку "'+ArrOpis[i].Name+'" ?') then begin
//          OpenMessage(' Выполнение обработки ... '+);
        MemoWrite('run.sql',ArrOpis[i].SQL);
        GlobalTask.WriteToLogFile('>>>Выполнение обработки:'#13#10+arrOpis[i].SQL);
        if Pos('//', arrOpis[i].SQL)>0
          then lKomm:=true
          else lKomm:=false;
        StrToArr(ArrOpis[i].SQL, arrSQL, ';', true);
        m:=High(arrSQL);
        s:=ArrOpis[i].Caption;
        for j:=Low(arrSQL) to m do begin
          n:=0;
          nn:=Pos('//',arrSQL[j]);
          if nn>0
            then sKomm:=Copy(arrSQL[j],nn+2,Length(arrSQL[j]))
            else if lKomm or (m=1) then sKomm:=ArrOpis[i].Caption else sKomm:=ArrOpis[i].Caption+'    '+IntToStr(j+1)+'/'+IntToStr(m+1);
          OpenMessage(sKomm);
          try
            lErr := false;
            n:=dmBase.AdsConnection.Execute(arrSQL[j]);
//            sleep(2000);
            CloseMessage;
          except
            on E: Exception do begin
              lErr := true;
              CloseMessage;
              PutError('Ошибка выролнения:'+#13#10+arrSQL[j]+#13#10+E.Message);
            end;
          end;
          if lErr then begin
            if not Problem(PadCStr('Продолжить выполнение ?',STD_LEN,' ')) then begin
              break;
            end else begin
              lErr:=false;
            end;
          end else begin
            nCount:=nCount+n;
          end;
        end;
        if (nCount>0) or not lErr then begin
          ShowMessage('Обработано '+IntToStr(nCount)+' записей');
        end;
      end;
    end else begin
      lErr := false;
      PutError(' Обработка не выполнена. ')
    end;
    if not lErr then begin
      ArrOpis[i].RunCount:=ArrOpis[i].RunCount+1;
      ini.WriteInteger(ArrOpis[i].Sect, 'RUNCOUNT', ArrOpis[i].RunCount);
      ini.UpdateFile;
    end;
  end;
end;

procedure TfmRunObrab.FormCreate(Sender: TObject);
var
  sFile:String;
begin
   sFile:=NameFile_OBRABOTKA;
  ini := TSasaIniFile.Create(GlobalTask.PathService+sFile);
end;

procedure TfmRunObrab.FormDestroy(Sender: TObject);
begin
  ini.Free;
end;

procedure TfmRunObrab.UpdateActions;
begin
  inherited;
  btOk.Enabled := GetItemIndex>-1;
end;

procedure TfmRunObrab.lbClick(Sender: TObject);
begin
  if GetItemIndex>-1 then begin
    edOpis.Text := arrOpis[GetItemIndex].Komm;
  end;
end;

end.
