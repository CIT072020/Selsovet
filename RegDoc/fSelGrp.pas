unit fSelGrp;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ElXPThemedControl, ElTree, StdCtrls, ExtCtrls, ImgList, mAdsObj;

type
   TfmSelGrp=class(TForm)
      paBottom: TPanel;
      btOk: TButton;
      btCancel: TButton;
      paTop: TPanel;
      laCaption: TLabel;
      tvTree: TElTree;
      imTree: TImageList;
      procedure tvTreeDblClick(Sender: TObject);
      procedure tvTreeAfterSelectionChange(Sender: TObject);
   private
      FFormLayout: TFormLayout;
   private
      function InitLayout(LayoutList: TLayoutList; LayoutName: string): TFormLayout;
      procedure LoadLayout(FormLayout: TFormLayout);
      procedure SaveLayout(FormLayout: TFormLayout);
      procedure SetLookTree(LookTree: TLookTree; LastGroupId: Integer);
      procedure UpdateButton;
      function GetNode: TLookItem;
   end;

function SelectGroup(LookTree: TLookTree; LastGroupId: Integer; LayoutList: TLayoutList): Integer;

implementation
uses
   mFindInt;
   
{$R *.dfm}

const
   // используемые картинки
   II_FolderClose  = 0; // закрытая папка
   II_FolderOpen   = 1; // открытая папка

function SelectGroup(LookTree: TLookTree; LastGroupId: Integer; LayoutList: TLayoutList): Integer;
var
   LookItem: TLookItem;
   OneId: Integer;
begin
   Result:=-1;
   with TfmSelGrp.Create(nil) do begin
      try
         SetLookTree(LookTree, LastGroupId);
         OneId:=-1;
         if LookTree<>nil then begin
            OneId:=LookTree.GetOneId;
         end;
         if OneId=-1 then begin
            FFormLayout:=InitLayout(LayoutList, 'TfmSelGrp');
            LoadLayout(FFormLayout);
            UpdateButton;
            if ShowModal=mrOk then begin
               LookItem:=GetNode;
               if (LookItem<>nil) and not LookItem.IsFolder then begin
                  Result:=LookItem.Id;
               end;
            end;
            SaveLayout(FFormLayout);
         end
         else if OneId=-2 then begin
            MessageDlgR('Для добавления документов надо добавить соответствующие группы в справочник "Группы документов".', mtWarning, [mbOK], 0);
         end
         else begin
            Result:=OneId;
         end;
      finally
         Free;
      end;
   end;
end;

{ TfmSelGrp }

function TfmSelGrp.GetNode: TLookItem;
var
   Node: TElTreeItem;
begin
   Result:=nil;
   Node:=tvTree.ItemFocused;
   if Node<>nil then begin
      Result:=TLookItem(Node.Data);
   end;
end;

function TfmSelGrp.InitLayout(LayoutList: TLayoutList; LayoutName: string): TFormLayout;
begin
   if LayoutList<>nil then begin
      Result:=LayoutList.ByName(LayoutName);
      if Result=nil then begin
         Result:=LayoutList.AddItem(LayoutName);
         Result.SetForm(Self);
      end;
   end
   else begin
      Result:=nil;
   end;
end;

procedure TfmSelGrp.LoadLayout(FormLayout: TFormLayout);
begin
   if FormLayout<>nil then begin
      FormLayout.GetForm(Self);
   end;
end;

procedure TfmSelGrp.SaveLayout(FormLayout: TFormLayout);
begin
   if FormLayout<>nil then begin
      FormLayout.SetForm(Self);
   end;
end;

procedure TfmSelGrp.SetLookTree(LookTree: TLookTree; LastGroupId: Integer);
var
   RootNode: TElTreeItem;
   LastGroupIdNode: TElTreeItem;

   procedure AddToTree(Root: TElTreeItem; LookList: TLookList);
   var
      I: Integer;
      LookItem: TLookItem;
      Node: TElTreeItem;
   begin
      for I:=0 to Pred(LookList.Count) do begin
         LookItem:=LookList[I];
         Node:=tvTree.Items.AddChild(Root, LookItem.Caption);
         Node.Data:=Pointer(LookItem);
         if (LastGroupId<>-1) and (LookItem.Id=LastGroupId) then begin
            LastGroupIdNode:=Node;
         end;
         if LookItem.IsFolder then begin
            if LookItem.CloseIndex=-1 then begin
               Node.ImageIndex:=II_FolderClose;
            end
            else begin
               Node.ImageIndex:=LookItem.CloseIndex;
            end;
         end
         else if LookItem.ImageIndex<>-1 then begin
            Node.ImageIndex:=LookItem.ImageIndex;
         end;
         AddToTree(Node, LookItem.Child);
      end;
   end;

begin
   if LookTree<>nil then begin
      if LookTree.Root.Count=0 then begin
         LookTree.DoGetLookTree;
      end;
      tvTree.Items.BeginUpdate;
      try
         tvTree.Items.Clear;
         if LookTree.Images<>nil then begin
            tvTree.Images:=LookTree.Images;
         end
         else begin
            tvTree.Images:=imTree;
         end;
         LastGroupIdNode:=nil;
         AddToTree(nil, LookTree.Root);
         if tvTree.Items.Count>0 then begin
            RootNode:=tvTree.Items[0];
            RootNode.Expand(True);
            if LastGroupIdNode<>nil then begin
               tvTree.ItemFocused:=LastGroupIdNode;
            end
            else begin
               tvTree.ItemFocused:=RootNode;
            end;
         end;
      finally
         tvTree.Items.EndUpdate;
      end;
   end;
end;

procedure TfmSelGrp.tvTreeDblClick(Sender: TObject);
var
   LookItem: TLookItem;
begin
   LookItem:=GetNode;
   if (LookItem<>nil) and not LookItem.IsFolder then begin
      ModalResult:=mrOk;
   end;
end;

procedure TfmSelGrp.tvTreeAfterSelectionChange(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmSelGrp.UpdateButton;
var
   LookItem: TLookItem;
begin
   LookItem:=GetNode;
   if (LookItem<>nil) and not LookItem.IsFolder then begin
      btOk.Enabled:=True;
   end
   else begin
      btOk.Enabled:=False;
   end;
end;

end.
