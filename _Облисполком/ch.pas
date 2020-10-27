procedure TfmGurnOchered.TBItemAddDokClick(Sender: TObject);
var
  strID:String;
  ID:Integer;
  adr:TAdres;
begin
  Query.First;
  While not Query.Eof do begin
    ID:=Query.FieldByName('ID').AsInteger;
    strID:=Query.FieldByName('ID').AsString;
    dmBase.AdresFromMensAdd(strID,adr);
    if adr.OnlyText then begin
      dmBase.WriteValueProp('ADRES_PROP', adr.AdresPropis, DateFiks, ID, _TypeObj_Nasel, ftMemo);
    end else begin
      dmBase.WriteValueProp('ADRES_PROP', adr.AdresPropis, DateFiks, ID, _TypeObj_Nasel, ftMemo);
      if adr.Obl<>'' then
      dmBase.WriteValueProp('APROP_OBL', adr.Obl, DateFiks, ID, _TypeObj_Nasel, ftMemo);
      if adr.Raion<>'' then
      dmBase.WriteValueProp('APROP_RN', adr.Raion, DateFiks, ID, _TypeObj_Nasel, ftMemo);
      if adr.Punkt<>'' then
      dmBase.WriteValueProp('APROP_PN', adr.Punkt, DateFiks, ID, _TypeObj_Nasel, ftMemo);
      if adr.Ulica<>'' then
      dmBase.WriteValueProp('APROP_UL', adr.Ulica, DateFiks, ID, _TypeObj_Nasel, ftMemo);
      if adr.NDom<>'' then
      dmBase.WriteValueProp('APROP_DOM', adr.NDom, DateFiks, ID, _TypeObj_Nasel, ftString);
      if adr.Korp<>'' then
      dmBase.WriteValueProp('APROP_KORP', adr.Korp, DateFiks, ID, _TypeObj_Nasel, ftString);
      if adr.Kv<>'' then
      dmBase.WriteValueProp('APROP_KV', adr.Kv, DateFiks, ID, _TypeObj_Nasel, ftString);
    end;

    Query.Next;
  end;
   dmbase.AdsConnection.Execute('update население set id_base=0;');
   dmbase.AdsConnection.Execute('update Ochered set id_base=0;');
   dmbase.AdsConnection.Execute('update OcheredResh set id_base=0;');
  Query.First;
end;
