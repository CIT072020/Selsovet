unit AddEvents;

interface

uses Windows, Messages, SysUtils, Forms, Dialogs, stdctrls, controls, sndkey32, Variants,Graphics,
     Classes,{StrUtils,} comctrls, Math, DbCtrlsEh, DbLookupEh, DBGridEh, FuncPr, FuncEh;

  procedure Event_FormKeyDown(Form : TForm; var lClearKey : Boolean; Sender: TObject;
            var Key: Word; Shift: TShiftState; PageControl : TPageControl=nil; lCheckGrid:Boolean=false; slGo:TStrings=nil);
  function FindWinControl( F : TForm; C : TWinControl; N : Integer) : Boolean;

implementation

//uses uProject;

function FindWinControl( F : TForm; C : TWinControl; N : Integer) : Boolean;
var
  i : Integer;
  FirstWinControl : TWinControl;
  CurWin : TWinControl;
begin
 FirstWinControl := nil;
 Result := false;
 for i:=0 to C.ControlCount-1 do begin
   if (C.Controls[i] is TWinControl) and C.Controls[i].Visible and C.Controls[i].Enabled then begin
     CurWin := TWinControl(C.Controls[i]);
     if (FirstWinControl=nil) and (CurWin.ControlCount=0) and not (CurWin is TDBCheckBoxEh) and not (CurWin is TButtonControl) then begin
       FirstWinControl := CurWin;
     end;
     if CurWin.HelpContext = N then begin
       Result:=true;
       F.ActiveControl := CurWin;
       break;
     end else if CurWin.ControlCount>0 then begin
       Result := FindWinControl( F, CurWin, N);
       if Result then break;
     end;
   end;
 end;
 if not Result and (FirstWinControl<>nil) then begin
   F.ActiveControl := FirstWinControl;
 end;
end;

procedure Event_FormKeyDown(Form : TForm; var lClearKey : Boolean; Sender: TObject;
          var Key: Word; Shift: TShiftState; PageControl : TPageControl; lCheckGrid:Boolean; slGo:TStrings);
var
  BackWard,nNew,n,nInd,i : Integer;
  lHand,lCheck : Boolean;
  s:String;
  NewKey:Integer;
  gr:TDbGridEh;
  c,cc:TColor;
//  ac:TWinControl;
  //---------------------
  procedure KillMessage(Wnd: HWnd; Msg: Integer);
  var
    M: TMsg;
  begin
    M.Message := 0;
    if PeekMessage(M, Wnd, Msg, Msg, pm_Remove) and (M.Message = WM_QUIT) then
      PostQuitMessage(M.wparam);
  end;
  //---------------------
  function GoControl(lDown:Boolean):Boolean;
  var
    ii:Integer;
    wc:TWinControl;
    ss:String;
  begin
    Result:=false;
    if slGo=nil then begin

    end else begin
      if lDown then ss:='down->' else ss:='up->';
      for ii:=0 to slGo.Count-1 do begin
        if SameText(slGo.Names[ii],ss+Form.ActiveControl.Name) then begin
          wc:=TWinControl(Form.FindComponent(slGo.ValueFromIndex[ii]));
          if (wc<>nil) and wc.Enabled then begin
            Result:=true;
            lClearKey:=true;
            Form.ActiveControl:=wc;
          end;
        end;
      end;
    end;
  end;
  //---------------------
  procedure FindNextPage;
  begin
   if (PageControl<>nil) and (PageControl.ContainsControl(Form.ActiveControl)) then begin
     if PageControl.ActivePageIndex = (PageControl.PageCount-1)
       then nNew:=0
       else nNew:=PageControl.ActivePageIndex+1;
     while (PageControl.Pages[nNew].TabVisible=false) and (PageControl.ActivePageIndex<>nNew) do begin
       if nNew = (PageControl.PageCount-1)
         then nNew:=0
         else nNew:=nNew+1;
     end;
     PageControl.ActivePageIndex:=nNew;
     if Assigned(PageControl.OnChange)
       then PageControl.OnChange(PageControl);
     FindWinControl(Form, PageControl.Pages[PageControl.ActivePageIndex], 888);
   end;
  end;
  //---------------------
  procedure GoNextControl;
  begin
    if (Form.ActiveControl.HelpContext=999) then begin
      FindNextPage;
    end else begin
      if GoControl(true) then begin

      end else begin
        lClearKey:=true;
        Key:=0;
        BackWard:=0;
        Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
      end;
    end;                          
  end;
begin
 if Shift = [] then begin
   if ((key=VK_DOWN) or (key=VK_TAB)) then begin
     if (key=VK_TAB) or CheckControl(Form,key,lCheckGrid) then begin
       Key:=0;
       if (Form.ActiveControl.HelpContext=999) then begin
         FindNextPage;
       end else begin
         BackWard:=0;
         if GoControl(true) then begin

         end else begin
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
           if (PageControl<>nil) and (Form.ActiveControl is TPageControl) then begin
             Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
           end;
         end;
       end;

       {
       repeat
         if (Form.ActiveControl.HelpContext=999) then begin
           FindNextPage;
         end else begin
           BackWard:=0;
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
           if (PageControl<>nil) and (Form.ActiveControl is TPageControl) then begin
             Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
           end;
         end;
       until GetColorProp(Form.ActiveControl)<>GetDisableColor;
       }
     end;
   end;
{
   if (key=VK_DOWN) and (Form.ActiveControl is TCustomDbEditEh) then begin
     if CheckControl(Form,lCheckGrid) then begin
       Key:=0;
       if (Form.ActiveControl.HelpContext=999) then begin
         FindNextPage;
       end else begin
         BackWard:=0;
         Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
         if (PageControl<>nil) and (Form.ActiveControl is TPageControl) then begin
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
         end;
       end;
     end;
   end;
}

// было  if (key=VK_UP) and (Form.ActiveControl is TCustomDbEditEh) then begin
//     if CheckControl(Form,lCheckGrid) then begin

   if (key=VK_UP) then begin                    // стало
     if CheckControl(Form,key,lCheckGrid) then begin
       Key:=0;
       if (Form.ActiveControl.HelpContext=888) then begin
         if (PageControl<>nil) and (PageControl.ContainsControl(Form.ActiveControl)) then begin
           if PageControl.ActivePageIndex = 0
             then nNew:=PageControl.PageCount-1
             else nNew:=PageControl.ActivePageIndex-1;
           while (PageControl.Pages[nNew].TabVisible=false) and (PageControl.ActivePageIndex<>nNew) do begin
             if nNew=0
               then nNew:=PageControl.PageCount-1
               else nNew:=nNew-1;
           end;
           PageControl.ActivePageIndex:=nNew;
           if Assigned(PageControl.OnChange)
             then PageControl.OnChange(PageControl);
           FindWinControl(Form, PageControl.Pages[PageControl.ActivePageIndex], 999);
         end;
       end else begin
         if GoControl(false) then begin

         end else begin
           BackWard:=1;
           Key:=0;
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
         end;
       end;
     end;
   end;
   if Key=13 then begin
     lCheck:=false;
     if not lCheck and (Form.ActiveControl is TDBGridEh) then begin
       gr:=TDBGridEh(Form.ActiveControl);
       lCheck:=true;
       s := gr.VisibleColumns.Items[gr.VisibleColumns.Count-1].FieldName;
       NewKey:=VK_RIGHT;
       if (gr.SelectedField.FieldName = s) and (NewKey = VK_RIGHT) then begin // стоим на последней колонке
         gr.SelectedIndex := gr.VisibleColumns.Items[0].Index;
         NewKey := VK_DOWN;
       end;
       PostMessage(gr.Handle,WM_KEYDOWN,NewKey,0);
       Key:=0;
       lClearKey:=true;
     end;
     if not lCheck and (Form.ActiveControl is TDBComboBoxEh) then begin
       lCheck:=true;
       if not TDBComboBoxEh(Form.ActiveControl).ListVisible then begin
         if TCustomDbEditEh(Form.ActiveControl).Text='' then begin
           TDBComboBoxEh(Form.ActiveControl).DropDown;
           Key:=0;
           lClearKey:=true;
         end else begin
           GoNextControl;
         end;
       end else begin
      //   SendKeys('{DOWN}', false);
        {
         if (Form.ActiveControl.HelpContext<>999) then begin
           TDBComboBoxEh(Form.ActiveControl).CloseUp(true);
  //         KillMessage(Form.ActiveControl.Handle, WM_CHAR);
           BackWard:=0;
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
           Key:=0;
           lClearKey:=true;
         end;
        }
       end;
     end;
     if not lCheck and (Form.ActiveControl is TDBDateTimeEditEh) then begin
       lCheck:=true;
       if not TDBDateTimeEditEh(Form.ActiveControl).CalendarVisible then begin
         if TDBDateTimeEditEh(Form.ActiveControl).Value=null then begin
           TDBDateTimeEditEh(Form.ActiveControl).DropDown;
           Key:=0;
           lClearKey:=true;
         end else begin
           GoNextControl;
         end;
       end else begin
      //   SendKeys('{DOWN}', false);
       end;
     end;
     if not lCheck and (Form.ActiveControl is TDBLookupComboboxEh) then begin
       lCheck:=true;
       if not TDBLookupComboboxEh(Form.ActiveControl).ListVisible then begin
         if TCustomDbEditEh(Form.ActiveControl).Text='' then begin
           TDBLookupComboboxEh(Form.ActiveControl).DropDown;
           Key:=0;
           lClearKey:=true;
         end else begin
           GoNextControl;
         end;
       end else begin
      //   SendKeys('{DOWN}', false);
       end;
     end;
     if not lCheck and (Form.ActiveControl is TComboBox) then begin
       lCheck:=true;
       if not TComboBox(Form.ActiveControl).DroppedDown then begin
         TComboBox(Form.ActiveControl).DroppedDown:=not TComboBox(Form.ActiveControl).DroppedDown;
         Key:=0;
         lClearKey:=true;
       end else begin
         GoNextControl;
       end;
     end;

     if not lCheck and (Form.ActiveControl is TDBEditEh) then begin
       lCheck:=true;
       if TDBEditEh(Form.ActiveControl).MRUList.Active and (TDBEditEh(Form.ActiveControl).MRUList.Items.Count>0) then begin
         if not TDBEditEh(Form.ActiveControl).MRUList.DroppedDown then begin
           if TCustomDbEditEh(Form.ActiveControl).text='' then begin
             Key:=0;
             lClearKey:=true;
             TDBEditEh(Form.ActiveControl).MRUList.DropDown;
             KillMessage(Form.ActiveControl.Handle, WM_CHAR);
           end else begin
             GoNextControl;
           end;
         end else begin
    //       SendKeys('{DOWN}', false);
         end;
       end;
       if Key>0 then begin
         nInd:=-1;
         n:=TDBEditEh(Form.ActiveControl).EditButtons.Count;
         for i:=0 to n-1 do begin
           if TDBEditEh(Form.ActiveControl).EditButtons[i].Visible then begin
             nInd:=i;
             break;
           end;
         end;
         if nInd>-1 then begin
           //====== !!!!!!!!! ===================================================
           if TDBEditEh(Form.ActiveControl).EditButtons[nInd].ShortCut=VK_INSERT then begin
             nInd:=-1;
           end;
           //====================================================================
         end;
         if nInd>-1 then begin
           lHand:=false;
           Key:=0;
           lClearKey:=true;
           TDBEditEh(Form.ActiveControl).EditButtons[nInd].OnClick(TDBEditEh(Form.ActiveControl),lHand);
         end else begin
           if CheckControl(Form,key,lCheckGrid) then begin
             GoNextControl;
             {
             if (Form.ActiveControl.HelpContext=999) then begin
               FindNextPage;
             end else begin
               Key:=0;
               BackWard:=0;
               Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
             end;
             }
           end;
         end;
       end;
     end;
     if not lCheck and (Form.ActiveControl is TDBNumberEditEh) then begin
       lCheck:=true;
       if CheckControl(Form,key,lCheckGrid) then begin
         GoNextControl;
         {
         if (Form.ActiveControl.HelpContext=999) then begin
           FindNextPage;
         end else begin
           Key:=0;
           BackWard:=0;
           Form.Perform(WM_NEXTDLGCTL, BackWard, 0);
         end;
         }
       end;
     end;
   end;
 end else if Shift=[ssCtrl] then begin
   if (PageControl<>nil) then begin
     if Key=8 then begin  // Ctrl-BackSpace
       if PageControl.ActivePageIndex = 0
         then nNew:=PageControl.PageCount-1
         else nNew:=PageControl.ActivePageIndex-1;
       while (PageControl.Pages[nNew].TabVisible=false) and (PageControl.ActivePageIndex<>nNew) do begin
         if nNew=0
           then nNew:=PageControl.PageCount-1
           else nNew:=nNew-1;
       end;
       PageControl.ActivePageIndex:=nNew;
       if Assigned(PageControl.OnChange)
         then PageControl.OnChange(PageControl);
       FindWinControl(Form, PageControl.Pages[PageControl.ActivePageIndex], 999);
     end else if (Key>48) and (Key<57) then begin
       n:=Key-48;
       nNew:=0;
       for i:=0 to PageControl.PageCount-1 do begin
         if PageControl.Pages[i].TabVisible then begin
           nNew:=nNew+1;
         end;
         if n=nNew then begin
           Key:=0;
           PageControl.ActivePageIndex:=i;
           if Assigned(PageControl.OnChange)
             then PageControl.OnChange(PageControl);
           FindWinControl(Form, PageControl.Pages[PageControl.ActivePageIndex], 888);
           break;
         end;
       end;
     end;
   end;
 end;

end;

end.
