
// районный загс оперативная статистика
function Rn_ZAGS_Oper : Boolean;
var
  f:TfmParamQuest;
  ds,q : TDataSet;
  sSQL,strGod,s,s1,s2 : String;
  i : Integer;
  nGod : Integer;
  dOtch:TDateTime;
  nYear,nMonth,nDay : Word;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  f.AddParamEx(Now, 'На дату' , 'DATEF' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  i:=f.ShowQuest;
  if i=1 then begin
//    GlobalTask.SetWorkParam('GOD',strGod);
    OpenMessage('Расчет формы','',10);

    dOtch:=f.GetValue('DATEF','D');
    DecodeDate(dOtch,nYear,nMonth,nDay);
    ds:=FindReportTable('ZAGS');
    dbZap(ds);
    s:='ЗАГС_рн_опер_аналитика:|';
    sSQL:=dmBase.LoadSQLEx(s+'{1}');
//    sSQL := dmBase.CheckDateFiksSQL(sSQL, MaindateFiks);
    sSQL:=StringReplace(sSQL, '2010-01-01', s1);
    sSQL:=StringReplace(sSQL, '2020-01-01', s2);
    ds.Append;

    q:=dbOpenSQL(sSQL,'');
    ds.Fld('NUM1').AsInteger  := q.Fld('ALLR').AsInteger;
    ds.Fld('NUM2').AsInteger  := q.Fld('MR').AsInteger;
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM3').AsInteger  := q.Fld('ALLS').AsInteger;
    ds.Fld('NUM4').AsInteger  := q.Fld('G1').AsInteger;

    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM3').AsInteger  := q.Fld('ALLS').AsInteger;
    ds.Fld('NUM4').AsInteger  := q.Fld('G1').AsInteger;

    ds.Post;
    dbClose(q);
    CloseMessage();
  end;
  f.Free;
end;

