unit mFindPrp; // field control property [12.10.2004]
interface
uses
   Windows, Classes, Controls, Forms, IniFiles, mFindInt, TypInfo, SysUtils,
   StdCtrls, ExtCtrls, Dialogs;

type

   TFieldCtrlKind=(fckNone, fckLabel, fckEdit);

   TFieldCtrl=class;

   // редактируемый управляющий элемент
   TCtrlItem=class(TObject)
   private
      FCaption: string;
      FControl: TControl;
      FChangeProp: TStringList;
      FUpdating: Boolean;
      FInTabOrder: Boolean;
      FField: TFieldCtrl;
      FIsDeleted: Boolean;
   private
      function GetVisible: Boolean;
      function GetInTabOrder: Boolean;
      procedure SetIsDeleted(const Value: Boolean);
   public
      constructor Create(Field: TFieldCtrl; Caption: string; Control: TControl; InTabOrder: Boolean);
      destructor Destroy; override;
      function GetKind: TFieldCtrlKind;
      function SetProp(Name, Value: string): Boolean;
      function GetProp(Name: string): string;
      function ChangeToString: string;
      procedure ChangeFromString(S: string);
      procedure ApplyChange;
      procedure UpdatePos;
      procedure UpdateProp(Name, Value: string);
      function GetParentPath(StopParent: TWinControl): string;
   public
      property Control: TControl read FControl;
      property Caption: string read FCaption;
      property Visible: Boolean read GetVisible;
      property InTabOrder: Boolean read GetInTabOrder;
      property Field: TFieldCtrl read FField;
      property ChangeProp: TStringList read FChangeProp;
      property IsDeleted: Boolean read FIsDeleted write SetIsDeleted;
   end;

   // список редактируемых управляющих элементов
   TCtrlList=class(TObject)
   private
      FList: TList;
      FField: TFieldCtrl;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TCtrlItem;
   public
      constructor Create(Field: TFieldCtrl);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TCtrlItem): Integer;
      function AddNew(Caption: string; Control: TControl; InTabOrder: Boolean): TCtrlItem;
      function FindControl(Control: TControl; var Ctrl: TCtrlItem): Boolean;
      function ByName(Name: string): TCtrlItem;
      procedure SaveToStrings(sl: TStringList; AOwner: TWinControl);
      function LoadFromStrings(sl: TStringList; var Ind: Integer; New: Boolean; AOwner: TWinControl): Boolean;
      function GetMaxBottom: Integer;
      procedure Del(Ind: Integer);
      procedure DelControl(Control: TControl);
      function FindParent(Path: string): TWinControl;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TCtrlItem read GetItem; default;
   end;

   // поле со списком соответствующих ему управляющих элементов
   TFieldCtrl=class(TObject)
   private
      FId: Integer;
      FFindItem: TFindItem;
      FCaption: string;
      FImageIndex: Integer;
      FList: TCtrlList;
   private
      function GetControlCount: Integer;
      function GetCaption: string;
   public
      constructor Create(FindItem: TFindItem; Caption: string; Id: Integer; ImageIndex: Integer);
      destructor Destroy; override;
      function FindControl(Control: TControl; var Ctrl: TCtrlItem): Boolean;
      function IsControlName(Name: string): Boolean;
      procedure SaveToStrings(sl: TStringList; AOwner: TWinControl);
      function LoadFromStrings(sl: TStringList; var Ind: Integer; New: Boolean; AOwner: TWinControl): Boolean;
      function GetMaxBottom: Integer;
   public
      property Id: Integer read FId;
      property FindItem: TFindItem read FFindItem;
      property Caption: string read GetCaption;
      property ImageIndex: Integer read FImageIndex;
      property Controls: TCtrlList read FList;
      property ControlCount: Integer read GetControlCount;
   end;

   // список всех полей
   TFieldCtrlList=class(TObject)
   private
      FImages: TImageList;
      FList: TList;
      FExtraField: TFieldCtrl;
      FOwner: TWinControl;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TFieldCtrl;
      procedure CheckExtraField;
   public
      constructor Create(AOwner: TWinControl; Images: TImageList);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TFieldCtrl): Integer;
      function AddNew(FindItem: TFindItem; Caption: string; Id: Integer; ImageIndex: Integer): TFieldCtrl;
      function FindControl(Control: TControl; var Field: TFieldCtrl; var Ctrl: TCtrlItem): Boolean;
      function IsControl(Control: TControl): Boolean;
      function IsControlName(Name: string): Boolean;
      procedure SaveToStrings(sl: TStringList);
      function LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
      function ByPath(Path: string; Id: Integer): TFieldCtrl;
      function GetMaxBottom: Integer;
      procedure GetTabOrderList(List: TStringList);
      procedure UpdateTabOrderList(List: TStringList);
      procedure ApplyTabOrderList;
      procedure ApplyDeleted;
      function GetFirstControl: TWinControl;
      function AddExtraControl(Control: TControl; Name: string; InTabOrder: Boolean): TCtrlItem;
      procedure SetParentToExtraCtrl(AParent: TWinControl);
      function GetNewExtraName(Control: TControl; ClassName: string): string;
      procedure AdjustSize(PixelsPerInch: Integer);
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TFieldCtrl read GetItem; default;
      property Images: TImageList read FImages write FImages;
      property ExtraField: TFieldCtrl read FExtraField;
   end;

implementation

{ TCtrlItem }

procedure TCtrlItem.ChangeFromString(S: string);
begin
   FChangeProp.Clear;
   FChangeProp.CommaText:=S;
   if (FChangeProp.Count>0) and (FChangeProp[0]='PROPS') then begin
      FChangeProp.Delete(0);
      ApplyChange;
   end
   else if FChangeProp.Count>0 then begin
      FChangeProp.Clear;
   end;
end;

function TCtrlItem.ChangeToString: string;
begin
   Result:='PROPS,'+FChangeProp.CommaText;
end;

constructor TCtrlItem.Create(Field: TFieldCtrl; Caption: string; Control: TControl; InTabOrder: Boolean);
begin
   FCaption:=Caption;
   FControl:=Control;
   FChangeProp:=TStringList.Create;
   FUpdating:=False;
   FInTabOrder:=InTabOrder;
   FIsDeleted:=False;
   FField:=Field;
end;

destructor TCtrlItem.Destroy;
begin
   FChangeProp.Free;
   inherited;
end;

function TCtrlItem.GetKind: TFieldCtrlKind;
begin
   Result:=fckNone;
end;

function TCtrlItem.GetProp(Name: string): string;
var
   I: LongInt;
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
begin
   Result:='';
   PropInfo:=GetPropInfo(FControl.ClassInfo, Name);
   if PropInfo<>nil then begin
      PropType:=PropInfo.PropType;
      case PropType^.Kind of
         tkInteger: begin
            I:=GetOrdProp(FControl, PropInfo);
            Result:=IntToStr(I);
         end;
         tkEnumeration: begin
            I:=GetOrdProp(FControl, PropInfo);
            Result:=GetEnumName(PropType^, I);
            if PropType^=TypeInfo(Boolean) then begin
               if Result='True' then begin
                  Result:='Да';
               end
               else begin
                  Result:='Нет';
               end;
            end;
         end;
         tkString, tkWChar, tkLString, tkWString: begin
            Result:=GetStrProp(FControl, PropInfo);
         end;
         tkSet: begin
            Result:=GetSetProp(FControl, PropInfo, True);
         end;
      end;
   end;
end;

function TCtrlItem.GetVisible: Boolean;
begin
   if (FControl<>nil) and (FControl.Parent<>nil) then begin
      Result:=FControl.Visible;
   end
   else begin
      Result:=False;
   end;
end;

function TCtrlItem.SetProp(Name, Value: string): Boolean;
var
   I: Integer;
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
   OldValue: string;
begin
   Result:=False;
   OldValue:=GetProp(Name);
   PropInfo:=GetPropInfo(FControl.ClassInfo, Name);
   if (PropInfo<>nil) and (CompareText(Value, OldValue)<>0) then begin
      Result:=True;
      PropType:=PropInfo.PropType;
      case PropType^.Kind of
         tkInteger: begin
            I:=StrToInt(Value);
            SetOrdProp(FControl, PropInfo,  I);
         end;
         tkEnumeration: begin
            if PropType^=TypeInfo(Boolean) then begin
               if Value='Да' then begin
                  Value:='True';
               end
               else begin
                  Value:='False';
               end;
            end;
            I:=GetEnumValue(PropType^, Value);
            SetOrdProp(FControl, PropInfo, I);
         end;
         tkString, tkWChar, tkLString, tkWString: begin
            SetStrProp(FControl, PropInfo, Value);
         end;
         tkSet: begin
            SetSetProp(FControl, PropInfo, Value);
         end;
      end;
      // запоминаем изменения свойств
      if not FUpdating then begin
         UpdateProp(Name, Value);
      end;
   end
end;

procedure TCtrlItem.ApplyChange;
var
   I: Integer;
   Name: string;
   Value: string;
begin
   if FControl<>nil then begin
      FUpdating:=True;
      try
         for I:=0 to Pred(FChangeProp.Count) do begin
            Name:=FChangeProp.Names[I];
            Value:=FChangeProp.Values[Name];
            if Name='__IsDeleted' then begin
               FIsDeleted:=Boolean(StrToIntDef(Value, 0));
            end
            else if (Name<>'TabOrder') then begin
               SetProp(Name, Value);
            end;
         end;
      finally
         FUpdating:=False;
      end;
   end;
end;

procedure TCtrlItem.UpdatePos;
begin
   UpdateProp('Top', IntToStr(FControl.Top));
   UpdateProp('Left', IntToStr(FControl.Left));
   UpdateProp('Width', IntToStr(FControl.Width));
   UpdateProp('Height', IntToStr(FControl.Height));
end;

procedure TCtrlItem.UpdateProp(Name, Value: string);
var
   Ind: Integer;
begin
   Ind:=FChangeProp.IndexOfName(Name);
   if Ind<>-1 then begin
      FChangeProp.Values[Name]:=Value;
   end
   else begin
      FChangeProp.Add(Format('%s=%s', [Name, Value]));
   end;
end;

function TCtrlItem.GetInTabOrder: Boolean;
begin
   if (FControl<>nil) and (FControl is TWinControl) and (FControl.Parent<>nil) then begin
      Result:=FInTabOrder;
   end
   else begin
      Result:=False;
   end;
end;

procedure TCtrlItem.SetIsDeleted(const Value: Boolean);
begin
    FIsDeleted:=Value;
    UpdateProp('__IsDeleted', IntToStr(Ord(Value)));
end;

function TCtrlItem.GetParentPath(StopParent: TWinControl): string;
var
   Parent: TWinControl;
begin
   Result:='';
   if (FControl<>nil) then begin
      Parent:=FControl.Parent;
      while (Parent<>nil) and (Parent<>StopParent) do begin
         if Result='' then begin
            Result:=Parent.Name;
         end
         else begin
            Result:=Format('%s.%s', [Parent.Name, Result]);
         end;
         Parent:=Parent.Parent;
      end;
   end;
end;

{ TCtrlList }

function TCtrlList.Add(Item: TCtrlItem): Integer;
begin
   Result:=FList.Add(Item);
end;

function TCtrlList.AddNew(Caption: string; Control: TControl; InTabOrder: Boolean): TCtrlItem;
begin
   Result:=TCtrlItem.Create(FField, Caption, Control, InTabOrder);
   Add(Result);
end;

function TCtrlList.ByName(Name: string): TCtrlItem;
var
   I: Integer;
   Item: TCtrlItem;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (CompareText(Name, Item.Control.Name)=0) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

procedure TCtrlList.Clear;
var
   I: Integer;
   Item: TCtrlItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TCtrlList.Create(Field: TFieldCtrl);
begin
   FList:=TList.Create;
   FField:=Field;
end;

procedure TCtrlList.Del(Ind: Integer);
begin
   FList.Delete(Ind);
end;

procedure TCtrlList.DelControl(Control: TControl);
var
   Item: TCtrlItem;
   Ind: Integer;
begin
   Item:=nil;
   if FindControl(Control, Item) then begin
      Ind:=FList.IndexOf(Item);
      Del(Ind);
   end;
end;

destructor TCtrlList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TCtrlList.FindControl(Control: TControl; var Ctrl: TCtrlItem): Boolean;
var
   I: Integer;
   Item: TCtrlItem;
begin
   Result:=False;
   Ctrl:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Control=Control) then begin
         Ctrl:=Item;
         Result:=True;
         Break;
      end;
   end;
end;

function TCtrlList.FindParent(Path: string): TWinControl;
var
   Names: TStringList;
   ParentName: string;
   Ctrl: TCtrlItem;
begin
   Result:=nil;
   Names:=TStringList.Create;
   try
      Names.CommaText:=StringReplace(Path, '.', ',', [rfReplaceAll]);
      if Names.Count>0 then begin
         ParentName:=Names[Pred(Names.Count)];
         Ctrl:=ByName(ParentName);
         if (Ctrl<>nil) and (Ctrl.Control is TWinControl) then begin
            Result:=Ctrl.Control as TWinControl;
         end;
      end;
   finally
      Names.Free;
   end;
end;

function TCtrlList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TCtrlList.GetItem(I: Integer): TCtrlItem;
begin
   Result:=TCtrlItem(FList[I]);
end;

function TCtrlList.GetMaxBottom: Integer;
var
   I: Integer;
   Item: TCtrlItem;
   Control: TControl;
begin
   Result:=0;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Control:=Item.Control;
         if (Control<>nil) and ((Control.Top+Control.Height)>Result) then begin
            Result:=Control.Top+Control.Height;
         end;
      end;
   end;
end;

function TCtrlList.LoadFromStrings(sl: TStringList; var Ind: Integer; New: Boolean; AOwner: TWinControl): Boolean;
var
   I: Integer;
   Version: Integer;
   Prop: TStringList;
   CtrlCount: Integer;
   CtrlItem: TCtrlItem;
   Control: TControl;
   Parent: TWinControl;
   InTabOrder: Boolean;
begin
   Result:=False;
   if sl=nil then begin
      Exit;
   end;
   Prop:=TStringList.Create;
   try
      try
         Prop.CommaText:=sl[Ind];
         Version:=-1;
         if (Prop.Count>2) and (Prop[1]='CONTROLS') then begin
            Version:=StrToIntDef(Prop[0], -1);
         end;
         case Version of
            1: begin
               Result:=True;
               Inc(Ind);
               CtrlCount:=StrToIntDef(Prop[2], -1);
               for I:=0 to Pred(CtrlCount) do begin
                  Prop.CommaText:=sl[Ind];
                  Inc(Ind);
                  Version:=-1;
                  if (Prop.Count>5) and (Prop[1]='CTRL') then begin
                     Version:=StrToIntDef(Prop[0], -1);
                  end;
                  case Version of
                     1: begin
                        CtrlItem:=nil;
                        if New then begin
                           Control:=nil;
                           InTabOrder:=False;
                           if Prop[2]='TLabel' then begin
                              Control:=TLabel.Create(AOwner);
                           end
                           else if Prop[2]='TRadioGroup' then begin
                              Control:=TRadioGroup.Create(AOwner);
                              InTabOrder:=True;
                           end
                           else if Prop[2]='TGroupBox' then begin
                              Control:=TGroupBox.Create(AOwner);
                           end;
                           if Control<>nil then begin
                              Parent:=FindParent(Prop[5]);
                              if Parent<>nil then begin
                                 Control.Parent:=Parent;
                              end;
                              Control.Name:=Prop[3];
                              CtrlItem:=AddNew(Prop[4], Control, InTabOrder);
                           end;
                        end
                        else begin
                           CtrlItem:=ByName(Prop[3]);
                        end;
                        if CtrlItem<>nil then begin
                           CtrlItem.ChangeFromString(sl[Ind]);
                        end;
                        Inc(Ind);
                     end;
                  else
                     Break;
                  end;
               end;
            end;
         end;
      except
         Result:=False;
      end;
   finally
      Prop.Free;
   end;
end;

procedure TCtrlList.SaveToStrings(sl: TStringList; AOwner: TWinControl);
var
   I: Integer;
   Item: TCtrlItem;
begin
   if sl<>nil then begin
      sl.Add(Format('1,CONTROLS,%d', [GetCount]));
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if Item<>nil then begin
            sl.Add(Format('1,CTRL,%s,%s,"%s","%s"', [Item.Control.ClassName, Item.Control.Name, Item.Caption, Item.GetParentPath(AOwner)]));
            sl.Add(Item.ChangeToString);
         end;
      end;
   end;
end;

{ TFieldCtrl }

constructor TFieldCtrl.Create(FindItem: TFindItem; Caption: string; Id: Integer; ImageIndex: Integer);
begin
   FId:=Id;
   FFindItem:=FindItem;
   FCaption:=Caption;
   FImageIndex:=ImageIndex;
   FList:=TCtrlList.Create(Self);
end;

destructor TFieldCtrl.Destroy;
begin
   FList.Free;
   inherited;
end;

function TFieldCtrl.FindControl(Control: TControl; var Ctrl: TCtrlItem): Boolean;
begin
   Result:=FList.FindControl(Control, Ctrl);
end;

function TFieldCtrl.GetCaption: string;
begin
   Result:=Format('%s (%d)', [FCaption, FId]);
end;

function TFieldCtrl.GetControlCount: Integer;
begin
   Result:=FList.Count;
end;

function TFieldCtrl.GetMaxBottom: Integer;
begin
   Result:=FList.GetMaxBottom;
end;

function TFieldCtrl.IsControlName(Name: string): Boolean;
begin
   Result:=FList.ByName(Name)<>nil;
end;

function TFieldCtrl.LoadFromStrings(sl: TStringList; var Ind: Integer; New: Boolean; AOwner: TWinControl): Boolean;
begin
   Result:=False;
   if sl<>nil then begin
      Result:=FList.LoadFromStrings(sl, Ind, New, AOwner);
   end;
end;

procedure TFieldCtrl.SaveToStrings(sl: TStringList; AOwner: TWinControl);
begin
   if sl<>nil then begin
      if FFindItem<>nil then begin
         sl.Add(Format('1,%s,%d', [FFindItem.Field.Path, FFindItem.Id]));
      end
      else begin
         sl.Add('1,nil');
      end;
      FList.SaveToStrings(sl, AOwner);
   end;
end;

{ TFieldCtrlList }

function TFieldCtrlList.Add(Item: TFieldCtrl): Integer;
begin
   Result:=FList.Add(Item);
end;

function TFieldCtrlList.AddExtraControl(Control: TControl; Name: string; InTabOrder: Boolean): TCtrlItem;
begin
   CheckExtraField;
   Result:=FExtraField.Controls.AddNew(Name, Control, InTabOrder);
   Result.UpdatePos;
end;

function TFieldCtrlList.AddNew(FindItem: TFindItem; Caption: string; Id: Integer; ImageIndex: Integer): TFieldCtrl;
begin
   Result:=TFieldCtrl.Create(FindItem, Caption, Id, ImageIndex);
   Add(Result);
end;

function CompareTabOrder2(Item1, Item2: Pointer): Integer;
var
   Ctrl1: TCtrlItem;
   Ctrl2: TCtrlItem;
   Win1: TWinControl;
   Win2: TWinControl;
begin
   Ctrl1:=TCtrlItem(Item1);
   Ctrl2:=TCtrlItem(Item2);
   Win1:=TWinControl(Ctrl1.Control);
   Win2:=TWinControl(Ctrl2.Control);
   Result:=Win1.TabOrder-Win2.TabOrder;
end;

function CompareTabOrder3(Item1, Item2: Pointer): Integer;
var
   Ctrl1: TCtrlItem;
   Ctrl2: TCtrlItem;
   TabOrder1: Integer;
   TabOrder2: Integer;
begin
   Ctrl1:=TCtrlItem(Item1);
   Ctrl2:=TCtrlItem(Item2);
   TabOrder1:=StrToIntDef(Ctrl1.ChangeProp.Values['TabOrder'], 1);
   TabOrder2:=StrToIntDef(Ctrl2.ChangeProp.Values['TabOrder'], 1);
   Result:=TabOrder1-TabOrder2;
end;

procedure TFieldCtrlList.AdjustSize(PixelsPerInch: Integer);
var
   I: Integer;
   J: Integer;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Field:=GetItem(I);
      if Field<>nil then begin
         for J:=0 to Pred(Field.ControlCount) do begin
            Ctrl:=Field.Controls[J];
            if not Ctrl.IsDeleted and (Ctrl.Control<>nil) and (Ctrl.ChangeProp.Count<>0) then begin
               if Ctrl.ChangeProp.IndexOfName('Left')<>-1 then Ctrl.Control.Left:=MulDiv(Ctrl.Control.Left, Screen.PixelsPerInch, PixelsPerInch);
               if Ctrl.ChangeProp.IndexOfName('Top')<>-1 then Ctrl.Control.Top:=MulDiv(Ctrl.Control.Top, Screen.PixelsPerInch, PixelsPerInch);
               if Ctrl.ChangeProp.IndexOfName('Width')<>-1 then Ctrl.Control.Width:=MulDiv(Ctrl.Control.Width, Screen.PixelsPerInch, PixelsPerInch);
               if Ctrl.ChangeProp.IndexOfName('Height')<>-1 then Ctrl.Control.Height:=MulDiv(Ctrl.Control.Height, Screen.PixelsPerInch, PixelsPerInch);
            end;
         end;
      end;
   end;
end;

procedure TFieldCtrlList.ApplyDeleted;
var
   I: Integer;
   J: Integer;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   for I:=0 to Pred(GetCount) do begin
      Field:=GetItem(I);
      if Field<>nil then begin
         for J:=0 to Pred(Field.ControlCount) do begin
            Ctrl:=Field.Controls[J];
            if Ctrl.IsDeleted and (Ctrl.Control<>nil) then begin
               Ctrl.Control.Parent:=nil;
            end;
         end;
      end;
   end;
end;

procedure TFieldCtrlList.ApplyTabOrderList;
var
   I: Integer;
   J: Integer;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
   List: TList;
   NewOrder: TList;
begin
   List:=TList.Create;
   NewOrder:=TList.Create;
   try
      for I:=0 to Pred(GetCount) do begin
         Field:=GetItem(I);
         if Field<>nil then begin
            for J:=0 to Pred(Field.ControlCount) do begin
               Ctrl:=Field.Controls[J];
               if Ctrl.InTabOrder then begin
                  List.Add(Ctrl);
                  if Ctrl.ChangeProp.IndexOfName('TabOrder')<>-1 then begin
                     NewOrder.Add(Ctrl);
                  end;
               end;
            end;
         end;
      end;
      List.Sort(CompareTabOrder2);
      NewOrder.Sort(CompareTabOrder3);
      for I:=0 to Pred(NewOrder.Count) do begin
         Ctrl:=TCtrlItem(NewOrder[I]);
         TWinControl(Ctrl.Control).TabOrder:=StrToIntDef(Ctrl.ChangeProp.Values['TabOrder'], 1);
      end;
   finally
      NewOrder.Free;
      List.Free;
   end;
end;

function TFieldCtrlList.ByPath(Path: string; Id: Integer): TFieldCtrl;
var
   I: Integer;
   Item: TFieldCtrl;
   S: string;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      S:='';
      if Item<>nil then begin
         if (Item.FindItem<>nil) and (Item.FindItem.Field<>nil) then begin
            S:=Item.FindItem.Field.Path;
            if (CompareText(S, Path)=0) and (Item.FindItem.Id=Id) then begin
               Result:=Item;
               Break;
            end;
         end;
      end;
   end;
end;

procedure TFieldCtrlList.CheckExtraField;
begin
   if FExtraField=nil then begin
      FExtraField:=TFieldCtrl.Create(nil, 'Дополнительные элементы', 0, -1);
      Add(FExtraField);
   end;
end;

procedure TFieldCtrlList.Clear;
var
   I: Integer;
   Item: TFieldCtrl; 
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FExtraField:=nil;
   FList.Clear;
end;

constructor TFieldCtrlList.Create(AOwner: TWinControl; Images: TImageList);
begin
   FList:=TList.Create;
   FImages:=Images;
   FExtraField:=nil;
   FOwner:=AOwner;
end;

destructor TFieldCtrlList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TFieldCtrlList.FindControl(Control: TControl; var Field: TFieldCtrl; var Ctrl: TCtrlItem): Boolean;
var
   I: Integer;
   Item: TFieldCtrl;
begin
   Result:=False;
   Field:=nil;
   Ctrl:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.FindControl(Control, Ctrl) then begin
         Field:=Item;
         Result:=True;
         Break;
      end;
   end;
end;

function TFieldCtrlList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TFieldCtrlList.GetFirstControl: TWinControl;
var
   I: Integer;
   List: TStringList;
begin
   Result:=nil;
   List:=TStringList.Create;
   try
      GetTabOrderList(List);
      I:=0;
      while (I<List.Count) and not TCtrlItem(List.Objects[I]).Visible do begin
         Inc(I);
      end;
      if (I<List.Count) and TCtrlItem(List.Objects[I]).Visible then begin
         Result:=TWinControl(TCtrlItem(List.Objects[I]).Control);
      end;
   finally
      List.Free;
   end;
end;

function TFieldCtrlList.GetItem(I: Integer): TFieldCtrl;
begin
   Result:=TFieldCtrl(FList[I]);
end;

function TFieldCtrlList.GetMaxBottom: Integer;
var
   I: Integer;
   ItemBottom: Integer;
   Item: TFieldCtrl;
begin
   Result:=0;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) then begin
         ItemBottom:=Item.GetMaxBottom;
         if (ItemBottom>Result) then begin
            Result:=ItemBottom;
         end;
      end;
   end;
end;

function CompareTabOrder(List: TStringList; Index1, Index2: Integer): Integer;
var
   Ctrl1: TCtrlItem;
   Ctrl2: TCtrlItem;
   Win1: TWinControl;
   Win2: TWinControl;
begin
   Ctrl1:=TCtrlItem(List.Objects[Index1]);
   Ctrl2:=TCtrlItem(List.Objects[Index2]);
   Win1:=TWinControl(Ctrl1.Control);
   Win2:=TWinControl(Ctrl2.Control);
   Result:=Win1.TabOrder-Win2.TabOrder;
end;

function TFieldCtrlList.GetNewExtraName(Control: TControl; ClassName: string): string;
var
   N: Integer;
begin
   if FExtraField=nil then begin
      Result:=Format('%s1', [ClassName]);
   end
   else begin
      N:=0;
      repeat
         Inc(N);
         Result:=Format('%s%d', [ClassName, N]);
      until FExtraField.Controls.ByName(Result)=nil;
   end;
end;

procedure TFieldCtrlList.GetTabOrderList(List: TStringList);
var
   I: Integer;
   J: Integer;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
   S: string;
begin
   if List<>nil then begin
      List.Clear;
      for I:=0 to Pred(GetCount) do begin
         Field:=GetItem(I);
         if Field<>nil then begin
            for J:=0 to Pred(Field.ControlCount) do begin
               Ctrl:=Field.Controls[J];
               if Ctrl.InTabOrder then begin
                  S:=Format('%s - %s', [Field.Caption, Ctrl.Caption]);
                  List.AddObject(S, Ctrl);
               end;
            end;
         end;
      end;
      List.CustomSort(CompareTabOrder);
   end;
end;

function TFieldCtrlList.IsControl(Control: TControl): Boolean;
var
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   Result:=FindControl(Control, Field, Ctrl);
end;

function TFieldCtrlList.IsControlName(Name: string): Boolean;
var
   I: Integer;
   Item: TFieldCtrl;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.IsControlName(Name) then begin
         Result:=True;
         Break;
      end;
   end;
end;

function TFieldCtrlList.LoadFromStrings(sl: TStringList; var Ind: Integer): Boolean;
var
   I: Integer;
   S: string;
   Id: Integer;
   FieldCount: Integer;
   Version: Integer;
   Prop: TStringList;
   FieldCtrl: TFieldCtrl;

   procedure SkipControls;
   var
      J: Integer;
      CtrlCount: Integer;
   begin
      Prop.CommaText:=sl[Ind];
      if (Prop.Count>2) and (Prop[1]='CONTROLS') then begin
         CtrlCount:=StrToIntDef(Prop[2], -1);
         Inc(Ind);
         for J:=0 to Pred(CtrlCount) do begin
            // проверка пропускаемых строк опущена, т.к. пока в этой
            // проверки нет особой необходимости
            Inc(Ind, 2);
         end;
      end;
   end;

begin
   Result:=False;
   if (sl<>nil) and (sl.Count>0) then begin
      Prop:=TStringList.Create;
      try
         Prop.CommaText:=sl[Ind];
         Version:=-1;
         FieldCount:=-1;
         if (Prop.Count>2) and (Prop[1]='FIELDS_CTRL') then begin
            Version:=StrToIntDef(Prop[0], -1);
            FieldCount:=StrToIntDef(Prop[2], -1);
         end;
         case Version of
            1: begin
               Inc(Ind);
               for I:=0 to Pred(FieldCount) do begin
                  S:=sl[Ind];
                  Prop.CommaText:=S;
                  S:='';
                  Id:=-1;
                  if Prop.Count>2 then begin
                     S:=Prop[1];
                     Id:=StrToIntDef(Prop[2], -1);
                  end
                  else if Prop.Count>1 then begin
                     S:=Prop[1];
                  end;
                  if S='nil' then begin
                     CheckExtraField;
                     Inc(Ind);
                     FExtraField.LoadFromStrings(sl, Ind, True, FOwner);
                  end
                  else begin
                     FieldCtrl:=ByPath(S, Id);
                     Inc(Ind);
                     if FieldCtrl<>nil then begin
                        FieldCtrl.LoadFromStrings(sl, Ind, False, nil);
                     end
                     else begin
                        // если не нашли поле по имени, то пропускаем его элементы
                        SkipControls;
                     end;
                  end;
               end;
            end;
         end;
      finally
         Prop.Free;
      end;
   end;
end;

procedure TFieldCtrlList.SaveToStrings(sl: TStringList);
var
   I: Integer;
   FieldCtrl: TFieldCtrl;
begin
   if sl<>nil then begin
      sl.Add(Format('1,FIELDS_CTRL,%d',[GetCount]));
      for I:=0 to Pred(GetCount) do begin
         FieldCtrl:=GetItem(I);
         if FieldCtrl<>nil then begin
            FieldCtrl.SaveToStrings(sl, FOwner);
         end;
      end;
   end;
end;

procedure TFieldCtrlList.SetParentToExtraCtrl(AParent: TWinControl);
var
   I: Integer;
   Ctrl: TCtrlItem;
begin
   if FExtraField<>nil then begin
      for I:=0 to Pred(FExtraField.ControlCount) do begin
         Ctrl:=FExtraField.Controls[I];
         if (Ctrl<>nil) and not Ctrl.IsDeleted and (Ctrl.Control<>nil) and (Ctrl.Control.Parent=nil) then begin
            Ctrl.Control.Parent:=AParent;
         end;
      end;
   end;
end;

procedure TFieldCtrlList.UpdateTabOrderList(List: TStringList);
var
   I: Integer;
   Ctrl: TCtrlItem;
   Win: TWinControl;
begin
   if List<>nil then begin
      for I:=0 to Pred(List.Count) do begin
         Ctrl:=TCtrlItem(List.Objects[I]);
         if Ctrl<>nil then begin
            Win:=TWinControl(Ctrl.Control);
            Win.TabOrder:=Succ(I);
            Ctrl.UpdateProp('TabOrder', IntToStr(Win.TabOrder));
         end;
      end;
   end;
end;

end.
