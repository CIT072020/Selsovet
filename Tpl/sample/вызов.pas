procedure TfmTest.Button3Click(Sender: TObject);
var
   tpl: TTemplateInterface;
begin
   tpl:=TTemplateInterface.Create;
   tpl.DefaultScript:=FScript;
   try
      if tpl.Engine.ReadTemplateList(ExtractFilePath(Application.ExeName)+'template.txt') then begin
         tpl.SetSimpleTemplate('NAME1');
      end;
   finally
      tpl.Free;
   end;
end;
