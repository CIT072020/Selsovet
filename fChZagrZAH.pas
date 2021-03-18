unit fChZagrZah;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, fWarning,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uTypes, uProjectAll,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl,
  uUtilFiles, FuncPr, ifpii_dbfunc;

type

  TfmChZagrZAH = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    cbChoice: TDBCheckBoxEh;
    edDisk: TDBComboBoxEh;
    edPath: TDBEditEh;
    AdsConnection: TAdsConnection;
    tbSource: TAdsTable;
    Zip: TZipForge;
    cbImitation: TDBCheckBoxEh;
    tbSourceBaseProp: TAdsTable;
    tbSourceBaseTextProp: TAdsTable;
    tbSourceHistZAGS: TAdsTable;
    tbSourceSprZAH: TAdsTable;
    tbSourceSprRazmer: TAdsTable;
    cbCheckData: TDBCheckBoxEh;
    Query: TAdsQuery;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FZAH:TStringList;
    FRazmer:TStringList;
    FDefPath : String;
    IDZah : String;
  public
    procedure CreateListDisk;
    procedure CopyBaseFiles;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    function CopyOneBaseFiles(strFileArxiv : String) : Integer;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
//    procedure WriteToSprNames;

  end;

  procedure RunZagrZAH;

implementation

uses dBase;

{$R *.DFM}


procedure RunZagrZAH;
var
  f : TfmChZagrZAH;
begin
  f := TfmChZagrZAH.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChZagrZAH.CopyBaseFiles;
var
  lOk : Boolean;
  SearchRec: TSearchRec;
  strPath : String;
begin
  lOk := true;
  if cbChoice.Checked then begin
    if edPath.Text <> '' then begin
      strPath := CheckSleshN(edPath.Text);
      if strPath = ExtractFilePath(Application.ExeName)+'Export\' then begin
        PutError(' ����� ��� �������� �� ������ ���������� �� ����: '+#13+
                 ExtractFilePath(Application.ExeName)+'Export');
        lOk := false;
      end else begin
        GlobalTask.SetLastValueAsString('PATH_ZAGR_ZAH',edPath.Text);
        FDefPath := edPath.Text;
      end;
    end else begin
      PutError(' ���������� ���� ��� ������ ������ ! ');
      lOk := false;
    end;
  end else begin
    if edDisk.Text<>'' then begin
      strPath := edDisk.Text+':\';
    end else begin
      PutError(' ���������� ���� ��� ������ ������ ! ');
      lOk := false;
    end;
  end;
  if lOk then begin
    lOk := FindFirst(strPath+'*.zah', faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1] <> '.') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then begin
          CopyOneBaseFiles(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end else begin
      PutError(' �� ������� �� ������ ����� ��� �������� !  ');
    end;
    FindClose(SearchRec);
  end;
end;
//---------------------------------------------------------
{
procedure TfmChZagrZAH.WriteToSprNames;
begin
  with dmBase.SprNames do begin
    FieldByName('NAME').AsString    := tbSourceSprNames.FieldByName('NAME').AsString;
    FieldByName('NAME_B').AsString  := tbSourceSprNames.FieldByName('NAME_B').AsString;
    FieldByName('KNAME').AsString   := tbSourceSprNames.FieldByName('KNAME').AsString;
    FieldByName('KNAME_B').AsString := tbSourceSprNames.FieldByName('KNAME_B').AsString;
    FieldByName('HANDLED').AsBoolean:= tbSourceSprNames.FieldByName('HANDLED').AsBoolean; // !!!
    if (FindField('SHTAMP')<>nil) and (tbSourceSprNames.FieldByName('SHTAMP')<>nil) then begin
      FieldByName('SHTAMP').AsString := tbSourceSprNames.FieldByName('SHTAMP').AsString;
    end;
  end;
end;
}
//---------------------------------------------------------
function TfmChZagrZAH.CopyOneBaseFiles(strFileArxiv : String) : Integer;
var
  strDate1,strDate2 : String;
  i,j,nnn,nID,n : Integer;
  strPath,s,ss, sKod, sName : String;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  fld : TField;
  strFieldName, strNameOrgan: String;
  slOpis, slType : TStringList;
  arr:TArrStrings;
  tbDesc : TAdsTable;
  IDZAHFile, strVer, strVerFile, strVerZAH, strDateFile : String;
  nTypeZah,nErr, nPodrFile, nPodr, IDPodr : Integer;
  strListKlad,strWhereKlad,strNameKlad,strWhere,strSQL,strNameZags, strNameFilter, strErr: String;
  lProp,lShowErr,lFromOblArxiv,lOnlySmert : Boolean;
  dDate1,dDate2:TDateTime;
begin
  nTypeZah := dmBase.GetTypeZah;
  lProp := false;
  nErr := 0;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  lShowErr:=false;
  lFromOblArxiv:=false;
//-------------- ??? ���������� ����
  IDPodr := 0;
  strDate1:='';
  strDate2:='';
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  AdsConnection.IsConnected := false;
  Query.SQL.Clear;
  Zip.FileName := strFileArxiv;
  Zip.BaseDir  := strPath;
  try
    Zip.OpenArchive;
    Zip.ExtractFiles('zah.ini');
  except
    Zip.CloseArchive;
    nErr := 1;
    strErr := '������ ������ ����� ��������: '+strFileArxiv;
  end;
  if nErr = 0 then begin
    VerInfo:=TVerInfo.Create(Application.ExeName);
    strVer := VerInfo.ProductVersion;
    VerInfo.Free;
    Ini := TSasaIniFile.Create(strPath+'\'+'zah.ini');
    IDZah       := GlobalTask.ParamAsString('ID');
    IDZAHFile   := Ini.ReadString('MAIN','ORGAN','');
    strNameOrgan:= Ini.ReadString('MAIN','NAME','');
//    lFromOblArxiv:= (Ini.ReadString('MAIN','ARXIV','0')='1');
    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strVerFile  := Ini.ReadString('MAIN','VERSION','');
    strVerZAH   := Ini.ReadString('MAIN','VERSION_ZAH','');
//    strVerBase  := Ini.ReadString('MAIN','BASE','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    //----- �������� -----------------------------------
    strListKlad:=Ini.ReadString('MAIN','KLAD','');
    //---------------------------------------------------
    nPodr:=Globaltask.ParamAsInteger('PODR');
    nPodrFile := 0;
    s := Trim(Ini.ReadString('MAIN','PODR',''));
    if (s='') or (s='0') then begin
      nPodrFile := 0;
    end else begin
      try
        nPodrFile := StrToInt(s);
      except
        nErr:=8;
        strErr:='������ ����������� ������ �������������.';
      end;
    end;
    if (strDate1='') and (strDate2='') then begin
      nErr := 4;
      strErr := '���������� ���� �������� ����������� ����������.';
    end;
    if nErr=0 then begin
      {$IFDEF LAIS}

      {$ELSE}
      if (IDZah<>IDZAHFile) then begin
        nErr:=3;  // ������ ��������� � ���� ������
        strErr:='����������� ����� ����������� ����������.';
      end;
      {$ENDIF}
      if (IDZah=IDZAHFile) and (nPodr=nPodrFile) then begin
        nErr:=2;  // ������ ��������� � ���� ������
        strErr:='������ ��������� ����������� ���������.';
      end;
    end;
    if nErr = 0 then begin
      // ��������� �������������
      if (IDZah=IDZahFile) and (nPodrFile>nPodr) and (nPodr=0) then begin
        IDPodr := nPodrFile;
      end;
      slOpis.AddObject('���������� � ������������', dmBase.AktZ);
      slType.Add(IntToStr(_TypeObj_AktZAH));
      i:=1;
      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
      end;
      Query.SQL.Clear;
      Query.SQL.Add(' select distinct ID_ZAGS from (');
      for i:=0 to slOpis.Count-1 do begin
        arrCountDok[i]:= Ini.ReadInteger('COUNT',TAdsTable(slOpis.Objects[i]).TableName,0);
        Query.SQL.Add(' select distinct ID_ZAGS from '+TAdsTable(slOpis.Objects[i]).TableName);
        Query.SQL.Add('  union all  ');
      end;
      Query.SQL.Strings[Query.SQL.Count-1]:=') aaa';
    end;
    Ini.Free;
  end;
  strWhere  := '';
  strNameFilter := '';
  s := dmBase.GetVersionZAH(true);

  if nErr=7 then begin  // �������������� ������  !!!
    lShowErr:=true;
    PutError(strErr);
    if Problem('  �� ������ ���������� �������� ?  ') then begin
      nErr := 0;
      strErr := '';
    end;
  end;

  if nErr=0 then begin
    Zip.FileName := strFileArxiv;
    Zip.BaseDir  := strPath;
    OpenMessage('���������� ���������� �� ������ ... ','��������');
    try
      ClearDir(strPath,false);
      Zip.OpenArchive;
      Zip.ExtractFiles('*.*');
    except
      nErr := 5;
      strErr := '������ ������ ����������� ����������.';
      Zip.CloseArchive;
    end;
    CloseMessage;
  end;
  if nErr = 0 then begin
    AdsConnection.ConnectPath := strPath;
    AdsConnection.IsConnected := true;
    tbSource.TableType:=dmBase.AktZ.TableType;
    tbSource.AdsTableOptions.AdsCharType:=dmBase.AktZ.AdsTableOptions.AdsCharType;
   { if lProp then begin
      try
        s := tbSourceBaseTextProp.TableName;
        tbSourceBaseTextProp.Open;
      except
        nErr := 6;
        strErr := '������ �������� �������: '+s;
      end;
    end;  }
//    if not dmBase.LoadSQL('��������_����������_�����������', strSQL) then begin
//      nErr:=10;
//      strErr := '������ �������� ������� �� ��������.';
//    end;
    strSQL:='delete from &TABLE_NAME& where &ADD_WHERE&';

    if nErr=0 then begin
      try
        s:=tbSourceBaseProp.TableName;
        tbSourceBaseProp.Open;
        s:=tbSourceSprRazmer.TableName;
        tbSourceSprRazmer.Open;
        s:=tbSourceSprZAH.TableName;
        tbSourceSprZAH.Open;
      except
        nErr := 6;
        strErr := '������ �������� '+s;
      end;
    end;
    //---------------------------------------------
    if nErr=0 then begin
      if strDate2='' then begin  // ��������� �� ���
        strWhere  := 'Year(DATEZ)='+strDate1;
        strNameFilter := '�� '+strDate1+' ���';
      end else begin
        dDate1:=STOD(strDate1);
        dDate2:=STOD(strDate2);
        strWhere  := 'DATEZ>='+DateToSQL(dDate1)+' and '+ 'DATEZ<='+DateToSQL(dDate2);
        strNameFilter := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(strDate1))+
                         ' �� ' + FormatDateTime('dd.mm.yyyy',STOD(strDate2));
      end;
      strWhereKlad:='';
      strNameKlad:='';
      {$IFDEF LAIS}
      if strListKlad='' then begin
        // ��������� ��� ����������� ��������, ���� �������� KLAD � zah.ini ������
        with tbSourceSprZAH do begin
          First;
          while not Eof do begin
            strListKlad:=strListKlad+FieldByName('ID_GIS').AsString+',';
            Next;
          end;
          First;
        end;
      end;
      {$ENDIF}
      if strListKlad<>'' then begin
        StrToArr(strListKlad,arr,',',true);
        for i:=0 to Length(arr)-1 do begin
          if dmBase.SprZAH.Locate('ID_GIS', arr[i], []) then begin
            strWhereKlad:=strWhereKlad+'zh_klad='+dmBase.SprZAH.FieldByName('ID').AsString+' or ';
            if i<16 then strNameKlad:=strNameKlad+'  '+dmBase.SprZAH.FieldByName('NAME').AsString+#13
          end else if tbSourceSprZAH.Locate('ID_GIS', arr[i], []) then begin
            if i<16 then strNameKlad:=strNameKlad+'  '+tbSourceSprZAH.FieldByName('NAME').AsString +' (�����)'+#13
          end;
        end;
        if strWhereKlad<>'' then begin
          strWhereKlad:=' and ('+Copy(strWhereKlad,1,Length(strWhereKlad)-4)+') ';
          if Length(arr)>15
            then strNameKlad:=IntToStr(Length(arr))+' �������'
            else strNameKlad:=Copy(strNameKlad,1,Length(strNameKlad)-1);
          strNameKlad:=#13+' ����� �����������: '+#13+strNameKlad;
        end else begin
          {$IFDEF LAIS}
          // ��� ��� ��� ������ �� ������ ��� ������, � ��� �� ������ ������������ �������� � ���� �����������
          // ������ �����, ���-�� ������ �� ����� !!!
            strWhereKlad:=' and zh_klad=-999';
          {$ELSE}
            // � ������������ ��-������ ���� �� ������ ������������� !!!
          {$ENDIF}
        end;
      end;
      if strWhereKlad<>''
        then strWhere:=strWhere + strWhereKlad;
    {$IFDEF LAIS}
    //==========================================================
      s:='';
    // !!!    strWhere := strWhere + ' and ID_ZAGS=' + IDZahFile;  �� ���� �� ������
      if Problem('����� ����������� �������� ����������.'+#13+
                 ' �����  : '+strNameOrgan+' ('+IDZahFile+')'+#13+
                 ' ������ : '+strNameFilter+
                 strNameKlad) then begin
        dmBase.WorkQuery.SQL.Text:='select count(*) from AktZ where '+strWhere+#13#10+
                                   ' union all '+#13#10+
                                   'select count(*) from AktZ where '+strWhere+' and pole_grn>=3000';
        dmBase.WorkQuery.Open;    
        j:=dmBase.WorkQuery.Fields[0].AsInteger;
        dmBase.WorkQuery.Next;
        i:=dmBase.WorkQuery.Fields[0].AsInteger;

        dmBase.WorkQuery.Close;
        if (i>0) or (j>0) then begin
          s:='��������!'#13+
             '�� ��������� ������ � ���� ������� ������: '+IntToStr(j)+#13+
             '������������������ � '+_GIS_+' � ����������: '+IntToStr(i)+#13+
             '��� �������� ������ ����� ������� � ������������'+#13+
             '���� �� ������ ����������, ������� ����� �� � ���� �����'#13;
          if OkWarning(s,self) then begin

          end else begin
            nErr:=-1;
            strErr := '����� �� �������.';
          end;
        end;
      end else begin
        nErr:=-1;
        strErr := '����� �� �������.';
      end;
    {$ELSE}
      //===== ZAH ���� ������������ =====================================================
      if (IDPodr>0) then begin
        s:='';
        ss:='�������';
        strWhere := strWhere + ' and PODR='+IntToStr(IDPodr);
        s := ' ������������� : '+IntToStr(IDPodr)+#13;
    //    end;
        if Problem('����� ����������� �������� ����������.'+#13+
    //               ' �����  : '+strNameZags+#13+
                   s+
                   ' ������ : '+strNameFilter+
                   strNameKlad) then begin
          dmBase.WorkQuery.SQL.Text:='select count(*) from AktZ where '+strWhere+#13#10+
                                     ' union all '+#13#10+
                                     'select count(*) from AktZ where '+strWhere+' and pole_grn>=3000';
          dmBase.WorkQuery.Open;
          j:=dmBase.WorkQuery.Fields[0].AsInteger;
          dmBase.WorkQuery.Next;
          i:=dmBase.WorkQuery.Fields[0].AsInteger;
          dmBase.WorkQuery.Close;
          if (i>0) or (j>0) then begin
            s:='��������!'#13+
               '�� ��������� ������ � ���� ������� ������ ������������� '+IntToStr(IDPodr)+': '+IntToStr(j)+#13+
               '������������������ � '+_GIS_+' � ����������: '+IntToStr(i)+#13+
               '��� �������� ������ ����� ������������'+#13+
               '���� �� ������ ����������, ������� ����� �� � ���� �����'#13;
            if OkWarning(s,self) then begin

            end else begin
              nErr:=-1;
              strErr := '����� �� �������.';
            end;
          end;
        end else begin
          nErr:=-1;
          strErr := '����� �� �������.';
        end;
      end else begin
        nErr:=-1;
        strErr:='����������� �������������.';
      end;
    {$ENDIF}
    end;
    //---------------------------------------------
    if nErr=0 then begin
      OpenMessage('���������� � �������� ... ');
      try
        FZah.Clear;
        FRazmer.Clear;
        strErr:='';
        with tbSourceSprZAH do begin
          First;
          s:='';
          while not Eof do begin
            if not dmBase.SprZAH.Locate('ID_GIS', FieldByName('ID_GIS').AsString, []) then begin
              dmBase.SprZAH.Append;
              for j:=0 to dmBase.SprZAH.FieldCount-1 do begin
                strFieldName:=dmBase.SprZAH.Fields[j].FieldName;
                fld:=FindField(strFieldName);
                if (fld<>nil) and not fld.IsNull then begin
                  dmBase.SprZAH.Fields[j].Value:=fld.Value;
                end;
              end;
              dmBase.SprZAH.Post;
              WriteProp(FieldByName('ID').AsInteger, dmBase.SprZAH.FieldByName('ID').AsInteger, _TypeObj_BookKlad);
            end;
            FZAH.Add(FieldByName('ID').AsString+'='+dmBase.SprZAH.FieldByName('ID').AsString);
  //           s:=s+FieldByName('ID_GIS').AsString+' ('+FieldByName('NAME').AsString+')'+#13#10;
  //          end else begin
  //            FZAH.Add(FieldByName('ID').AsString+'='+dmBase.SprZAH.FieldByName('ID').AsString);
  //          end;
            Next;
          end;
          First;
          if s<>'' then begin
            nErr := 6;
            strErr:='������ ����������� �����������. �� ������� ��������:'#13#10+s;
          end;
        end;

        with tbSourceSprRazmer do begin
          First;
          s:='';
          while not Eof do begin
            if not dmBase.SprRazmer.Locate('NAME', Trim(FieldByName('NAME').AsString), []) then begin
              dmBase.SprRazmer.Append;
              for j:=0 to dmBase.SprRazmer.FieldCount-1 do begin
                strFieldName:=dmBase.SprRazmer.Fields[j].FieldName;
                fld:=FindField(strFieldName);
                if (fld<>nil) and not fld.IsNull then begin
                  dmBase.SprRazmer.Fields[j].Value:=fld.Value;
                end;
              end;
              dmBase.SprRazmer.Post;
            end;
            FRazmer.Add(FieldByName('ID').AsString+'='+dmBase.SprRazmer.FieldByName('ID').AsString);
            Next;
          end;
          First;
          if s<>'' then begin
            nErr := 6;
            strErr:=strErr+'������ ����������� ��������. �� ������� ��������:'#13#10+s;
          end;
        end;
      finally
        CloseMessage;
      end;
    end;

    if nErr=0 then begin
      //-------------------------------------------------
      OpenMessage(slOpis.Strings[0]+' ... '+StringOfChar(' ',25));
      GlobalTask.WriteToLogFile('�������� ���������� �� "'+strFileArxiv+'" ������: '+strNameFilter+' �����: '+strNameOrgan+' ('+IDZahFile+')');
      for i:=0 to slOpis.Count-1 do begin
        nnn:=0;
        ChangeMessage(slOpis.Strings[i]+' ... ');

        tbDesc := TAdsTable(slOpis.Objects[i]);
        tbSource.TableName := tbDesc.TableName;
        try
          tbSource.Open;
        except
          nErr := 6;
          strErr := '������ �������� �������: '+tbDesc.TableName;
          break;
        end;
        //------- �������� ���������� �� ����  ----------------
        ChangeMessage(slOpis.Strings[i]+'  ��������');
        s:=strSQL;
        s:=StringReplace(s, '&ADD_WHERE&', strWhere, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TABLE_NAME&', tbDesc.TableName, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TYPE_OBJ&', slType.Strings[i], [rfReplaceAll, rfIgnoreCase]);
        try
          dmBase.AdsConnection.Execute(s);
          GlobalTask.WriteToLogFile('��������������� ��������: '+s);
        except
          on E: Exception do begin
            PutError('�������: '+tbDesc.TableName+Chr(13)+
                     '������ �������� ����������'+Chr(13)+
                     E.Message);
            nErr:=6;
          end;
        end;
        if nErr>0 then break;
        //------------------------------------------------------
        ChangeMessage(slOpis.Strings[i]+'  ��������');
        GlobalTask.WriteToLogFile('�������� � "'+tbDesc.TableName);
        while not tbSource.Eof do begin
          nnn:=nnn+1;
          tbDesc.Append;
          arrCountAdd[i] := arrCountAdd[i] + 1;
          for j:=0 to tbSource.FieldCount-1 do begin
            strFieldName := tbSource.Fields[j].FieldName;
            if strFieldName='ID' then begin
              // �� ����� �.�. AutoInc
            end else if strFieldName='ZH_KLAD' then begin  // ����� �����������
              tbDesc.FieldByName('ZH_KLAD').AsString:=FZAH.Values[tbSource.Fields[j].AsString];
            end else if strFieldName='MOG_TYPE' then begin  // ��� �����������
              tbDesc.FieldByName('MOG_TYPE').AsString:=FRazmer.Values[tbSource.Fields[j].AsString];
            end else if strFieldName='ID_SOURCE' then begin
              tbDesc.FieldByName('ID_SOURCE').AsString:='0'; //IDZah;    // ���� ��� !!!
            end else if strFieldName='ID_ZAGS' then begin
              {$IFDEF LAIS}
                tbDesc.FieldByName('ID_ZAGS').AsString:='0'; //IDZAHFile;    // ���� ��� !!!
              {$ELSE}
                tbDesc.FieldByName('ID_ZAGS').AsString:='0'; //IDZAH;    // ���� ��� !!!
              {$ENDIF}
            end else if strFieldName='PODR' then begin
              // ������� PODR ���� �� �������� ������� ������
              tbDesc.FieldByName('PODR').AsInteger:=IDPODR;
            end else begin
              fld := tbDesc.FindField(strFieldName);
              if (fld<>nil) and not tbSource.Fields[j].IsNull then begin
                try
                  fld.Value:=tbSource.Fields[j].Value;
                except
                  on E: Exception do begin
                    PutError('�������: '+tbDesc.TableName+Chr(13)+
                             '������ ������ � ����: '+fld.FieldName+Chr(13)+
                             '��������: "'+fld.AsString+'"'+Chr(13)+
                             E.Message);

                  end;
                end;
              end;
            end;
          end;

          if cbImitation.Checked then begin
            tbDesc.Cancel;
          end else begin
            tbDesc.Post;
            if lProp then begin
              WriteProp(tbSource.FieldByName('ID').AsInteger,
                        tbDesc.FieldByName('ID').AsInteger,
                        StrToInt(slType.Strings[i]))
            end;
          end;
          tbSource.Next;
          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
          end;
        end;
        tbSource.Close;
        ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
        GlobalTask.WriteToLogFile('��������� '+IntToStr(arrCountAdd[i]));
      end;
    end;
//    tbSourceBaseProp.Active := false;
//    tbSourceBaseTextProp.Active := false;
//    tbSourceHistZAGS.Active := false;
//    tbSourceSvidPovtor.Active := false;
//    if nTypeZags = ZAGS_OBL_ARXIV then begin
//      tbSourceSprNames.Active := false;
//    end;

    AdsConnection.IsConnected:=false;

    CloseMessage;
  end;
//  ShowMessage(s);
  Result := nErr;
  DeleteFiles(strPath+'\*.*');
  if nErr = 0 then begin
    if cbImitation.Checked
      then s :=' �������� ������� ���������. '+#13+#13
      else s :=' �������� ������� ���������.   ���������: '+#13+#13;
    for i:=0 to slOpis.Count-1 do begin
      s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountAdd[i]) + '  '+#13  ;
    end;
    ShowMessage(s);
  end else begin
    if not lShowErr
      then PutError(strFileArxiv+#13#10+strErr);
  end;
  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;
//------------------------------------------------------------------------------------
function TfmChZagrZAH.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
var
  fldS,fldD:TField;
  i:Integer;
begin
  Result := true;

  tbSourceBaseProp.IndexName := 'VIGR_KEY';
  tbSourceBaseProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceBaseProp.Eof do begin
    with dmBase.tbSimpleProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := tbSourceBaseProp.fieldByName('DATES').AsDateTime;
      FieldByName('POKAZ').AsString := tbSourceBaseProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := tbSourceBaseProp.fieldByName('VALUE').AsString;
      FieldByName('NVALUE').AsString := tbSourceBaseProp.fieldByName('NVALUE').AsString;
      FieldByName('TYPESAVE').AsString := tbSourceBaseProp.fieldByName('TYPESAVE').AsString;
      Post;
    end;
    tbSourceBaseProp.Next;
  end;
  tbSourceBaseProp.CancelRange;
  {
  tbSourceBaseTextProp.IndexName := 'VIGR_KEY';
  tbSourceBaseTextProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceBaseTextProp.Eof do begin
    with dmBase.tbSimplePropMemo do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := tbSourceBaseTextProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := tbSourceBaseTextProp.fieldByName('VALUE').AsString;
      Post;
    end;
    tbSourceBaseTextProp.Next;
  end;
  tbSourceBaseTextProp.CancelRange;
  }
  {
  tbSourceHistZAGS.IndexName := 'VIGR_KEY';
  tbSourceHistZAGS.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  fldS:=tbSourceHistZAGS.FindField('INFO');
  fldD:=dmBase.tbHistoryZAGS.FindField('INFO');
  while not tbSourceHistZAGS.Eof do begin
    with dmBase.tbHistoryZAGS do begin
      Append;
      for i:=0 to tbSourceHistZAGS.FieldCount-1 do begin
        fldD := FindField(tbSourceHistZAGS.Fields[i].FieldName);
        if (fldD<>nil) and not tbSourceHistZAGS.Fields[i].IsNull then begin
          try
            fldD.Value:=tbSourceHistZAGS.Fields[i].Value;
          except
            on E: Exception do begin
              PutError('�������: '+dmBase.tbHistoryZAGS.TableName+Chr(13)+
                       '������ ������ � ����: '+fldD.FieldName+Chr(13)+
                       '��������: "'+fldD.AsString+'"'+Chr(13)+
                       E.Message);
            end;
          end;
        end;
      end;
      FieldByName('ID').AsInteger := nIDDesc;
      Post;
    end;
    tbSourceHistZAGS.Next;
  end;
  tbSourceHistZAGS.CancelRange;
  }
end;

procedure TfmChZagrZAH.WMDEVICECHANGE(var Msg: TMessage);
begin
{��������� ���������}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmChZagrZAH.CreateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
  edDisk.Enabled:=true;
  d := GetLogicalDrives;
  edDisk.ItemIndex:=-1;
  edDisk.Items.Clear;
  edDisk.KeyItems.Clear;
  i:=1;
  for c:='A' to 'Z' do begin
    if (d and 1)<>0 then begin
      n := GetDriveType(PChar(c + ':/'));
      if n=DRIVE_REMOVABLE then begin
        edDisk.Items.Add(c);
        edDisk.KeyItems.Add(IntToStr(i));
      end;
    end;
    d := d shr 1;
    Inc(i,1);
  end;
  if edDisk.Items.Count > 0 then begin
    s := GlobalTask.GetLastValueAsString('DISK_ZAGR_ZAH');
    edDisk.ItemIndex := 0;
    n := edDisk.Items.IndexOf(s);
    if n > -1 then begin
      edDisk.ItemIndex := n;
    end;
  end else begin
    edDisk.Enabled := false;
  end;
  FDefPath := GlobalTask.GetLastValueAsString('PATH_ZAGR_ZAH');
  edPath.Enabled := false;
end;

procedure TfmChZagrZAH.FormCreate(Sender: TObject);
begin
  FZAH:=TStringList.Create;
  FRazmer:=TStringList.Create;
  CreateListDisk;
end;

procedure TfmChZagrZAH.cbChoiceClick(Sender: TObject);
begin
  if cbChoice.Checked then begin
    edPath.Enabled := true;
    if edPath.Text = '' then begin
      edPath.Text := FDefPath;
    end;
  end else begin
    edPath.Enabled := false;
  end;
end;


procedure TfmChZagrZAH.edPathEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  strDir : String;
begin
  Handled := true;
  if SelectDirectory('�������� �����', '', strDir) then begin
    edPath.Text := strDir;
  end;
end;

procedure TfmChZagrZAH.FormDestroy(Sender: TObject);
begin
  FZAH.Free;
  FRazmer.Free;
end;

end.
