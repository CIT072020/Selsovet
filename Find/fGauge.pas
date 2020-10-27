unit fGauge;  // gauge form
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, ExtCtrls;

type
   TGaugeUpdate=(guStart, guStop, guUpdate);
   TGaugeUpdateEvent=procedure(Pos: Integer; Typ: TGaugeUpdate) of object;
   TGaugeCancelEvent=procedure of object;

type
   TfmGauge=class(TForm)
      paMaster: TPanel;
      laMasterText: TLabel;
      laMasterTime: TLabel;
      pbaMaster: TProgressBar;
      paDetail: TPanel;
      laDetailText: TLabel;
      laDetailTime: TLabel;
      pbaDetail: TProgressBar;
      paButton: TPanel;
      btCancel: TButton;
      laMasterPos: TLabel;
      laDetailPos: TLabel;
      laMasterSpeed: TLabel;
      laDetailSpeed: TLabel;
      paPaint: TPanel;
      pbGr: TPaintBox;
      btMinimize: TButton;
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure btMinimizeClick(Sender: TObject);
   public
      procedure Config(NotButton, NotDetail, NotGr: Boolean);
   end;

   TGaugeGr=class(TObject)
   private
      FPaintBox: TPaintBox;
      FWidth: Integer;
      FPosY: Integer;
      FPosX: Integer;
      FGroupHeight: Integer;
      FSpeed: array of Integer;
      FGroup: array of TColor;
      FGroupColor: TColor;
   private
      procedure Scroll;
      procedure PaintLine(X: Integer);
      procedure Paint;
      procedure OnPaint(Sender: TObject);
   public
      constructor Create(PaintBox: TPaintBox);
      destructor Destroy; override;
      procedure StartGroup(Color: TColor);
      procedure StopGroup;
      procedure AddLine(Speed: Integer);
   end;

   TGauge=class (TObject)
   private
      FForm: TForm;
      FProgressBar: TProgressBar;
      FTextLabel: TLabel;
      FTimeLabel: TLabel;
      FPosLabel: TLabel;
      FSpeedLabel: TLabel;
      FCancelButton: TButton;
      FStartTime: LongWord;
      FCancel: Boolean;
      FPos: integer;
      FOldPos: Integer;
      FOldTime: LongWord;
      FMax: integer;
      FMaster: boolean;
      FDetail: boolean;
      FDetailGauge: TGauge;
      FDetailPos: integer;
      FGr: TGaugeGr;
   private
      FOnUpdate: TGaugeUpdateEvent;
      FOnCancel: TGaugeCancelEvent;
   private
      procedure DoUpdate(pos: integer; typ: TGaugeUpdate);
      procedure DoCancel;
      procedure ButtonClick(sender: TObject);
      procedure UpdateDetail(pos: integer; typ: TGaugeUpdate);
      procedure SetDetail(const Value: TGauge);
   public
      constructor Create;
      destructor Destroy; override;
      procedure Init(form: TForm; text, time, pos, speed: TLabel; bar: TPRogressBar; button: TButton; pb: TPaintBox);
      procedure Start(max: integer; text: string);
      function Update(pos: integer; text: string; NewText: boolean=true): boolean;
      function UpdateAdd(Add: Integer): Boolean;
      procedure Stop;
      procedure Clear;
      procedure ChangeGroup;
   public
      property Pos: integer read FPos;
      property Max: integer read FMax;
      property Master: boolean read FMaster write FMaster;
      property DetailGauge: TGauge read FDetailGauge write SetDetail;
      property Detail: Boolean read FDetail write FDetail;
      property Cancel: Boolean read FCancel;
   public
      property OnUpdate: TGaugeUpdateEvent read FOnUpdate write FOnUpdate;
      property OnCancel: TGaugeCancelEvent read FOnCancel write FOnCancel;
   end;

   TSimpleGauge=class(TGauge)
   private
      FForm: TfmGauge;
   public
      constructor Create;
      destructor Destroy; override;
      procedure CancelOn;
   end;

   TDoubleGauge=class(TGauge)
   private
      FForm: TfmGauge;
      FMaster: TGauge;
   public
      constructor Create;
      destructor Destroy; override;
   public
      property Master: TGauge read FMaster;
   end;

procedure StartGauge;
procedure StopGauge;

implementation

{$R *.DFM}

procedure StartGauge;
begin
end;

procedure StopGauge;
begin
end;

{ TfmGauge }

procedure TfmGauge.Config(NotButton, NotDetail, NotGr: Boolean);
begin
   if NotDetail then begin
      if paDetail.Visible then begin
         paDetail.Visible:=False;
         Height:=Height-paDetail.Height;
      end;
   end
   else begin
      if not paDetail.Visible then begin
         paDetail.Visible:=True;
         Height:=Height+paDetail.Height;
      end;
   end;
   if NotButton then begin
      if paButton.Visible then begin
         paButton.Visible:=False;
         Height:=Height-paButton.Height;
      end;
   end
   else begin
      if not paButton.Visible then begin
         paButton.Visible:=True;
         Height:=Height+paButton.Height;
      end;
   end;
   if NotGr then begin
      if paPaint.Visible then begin
         paPaint.Visible:=False;
         Height:=Height-paPaint.Height;
      end
   end
   else begin
      if not paPaint.Visible then begin
         paPaint.Visible:=True;
         Height:=Height+paPaint.Height;
      end
   end;
end;

{ TGaugeGr }

procedure TGaugeGr.AddLine(Speed: Integer);
begin
   if FPosX=Pred(FWidth) then begin
      Scroll;
   end;
   FGroup[FPosX]:=FGroupColor;
   FSpeed[FPosX]:=Speed;
   Inc(FPosX);
   if FPosX=FWidth then begin
      Dec(FPosX);
      Paint;
   end
   else begin
      PaintLine(Pred(FPosX));
   end;
end;

constructor TGaugeGr.Create(PaintBox: TPaintBox);
var
   I: Integer;
begin
   FPaintBox:=PaintBox;
   FWidth:=PaintBox.Width;
   SetLength(FSpeed, FWidth);
   SetLength(FGroup, FWidth);
   FGroupColor:=PaintBox.Color;
   for I:=0 to Pred(FWidth) do begin
      FSpeed[I]:=0;
      FGroup[I]:=FGroupColor;
   end;
   FGroupHeight:=3;
   FPosY:=PaintBox.Height-FGroupHeight;
   FPosX:=0;
   PaintBox.Canvas.Pen.Width:=1;
   PaintBox.OnPaint:=OnPaint;
end;

destructor TGaugeGr.Destroy;
begin
   FPaintBox.OnPaint:=nil;
   inherited;
end;

procedure TGaugeGr.OnPaint(Sender: TObject);
begin
   Paint;
end;

procedure TGaugeGr.Paint;
var
   I: Integer;
begin
   for I:=0 to Pred(FWidth) do begin
      PaintLine(I);
   end;
end;

procedure TGaugeGr.PaintLine(X: Integer);
begin
   FPaintBox.Canvas.MoveTo(X, FPosY+FGroupHeight);
   FPaintBox.Canvas.Pen.Color:=FGroupColor;
   FPaintBox.Canvas.LineTo(X, FPosY);
   FPaintBox.Canvas.Pen.Color:=clLime;
   FPaintBox.Canvas.LineTo(X, FPosY-FSpeed[X]);
   FPaintBox.Canvas.Pen.Color:=FPaintBox.Color;
   FPaintBox.Canvas.LineTo(X, 0);
end;

procedure TGaugeGr.Scroll;
var
   I: Integer;
begin
   for I:=1 to Pred(FWidth) do begin
      FSpeed[Pred(I)]:=FSpeed[I];
      FGroup[Pred(I)]:=FGroup[I];
   end;
end;

procedure TGaugeGr.StopGroup;
begin

end;

procedure TGaugeGr.StartGroup(Color: TColor);
begin
   FGroupColor:=Color;
end;

{ TGauge }

procedure TGauge.ButtonClick(sender: TObject);
begin
   if not FDetail then begin
      FCancel:=True;
      DoCancel;
   end;
end;

procedure TGauge.ChangeGroup;
const
   MapColor: array [0..2] of TColor=(clBlue, clRed, clGreen);
   ColorIndex: Integer=0;
begin
   if FGr<>nil then begin
      FGr.StartGroup(MapColor[ColorIndex]);
      ColorIndex:=(ColorIndex+1) mod 3;
   end;
end;

procedure TGauge.Clear;
begin
   FTextLabel.Caption:='';
   FTimeLabel.Caption:='';
   FPosLabel.Caption:='';
   FPosLabel.Caption:='';
   FSpeedLabel.Caption:='';
   if FMaster then begin
      FDetailGauge.Clear;
   end;
end;

constructor TGauge.Create;
begin
   FMaster:=False;
   FDetail:=False;
   FCancel:=False;
end;

destructor TGauge.Destroy;
begin
   if FGr<>nil then begin
      FGr.Free;
   end;
   inherited;
end;

procedure TGauge.DoCancel;
begin
   if Assigned(FOnCancel) then begin
      FOnCancel;
   end;
end;

procedure TGauge.DoUpdate(pos: Integer; typ: TGaugeUpdate);
begin
   if Assigned(FOnUpdate) then begin
      FOnUpdate(pos, typ);
   end;
end;

procedure TGauge.Init(form: TForm; text, time, pos, speed: TLabel; bar: TPRogressBar; button: TButton; pb: TPaintBox);
begin
   FForm:=form;
   FTextLabel:=text;
   FTimeLabel:=time;
   FPosLabel:=pos;
   FSpeedLabel:=speed;
   FProgressBar:=bar;
   FCancelButton:=button;
   if pb<>nil then begin
      FGr:=TGaugeGr.Create(pb);
   end;
   if FCancelButton<>nil then begin
      FCancelButton.OnClick:=ButtonClick;
   end;
end;

procedure TGauge.SetDetail(const Value: TGauge);
begin
   FDetailGauge:=Value;
   Value.OnUpdate:=UpdateDetail;
   Value.Detail:=True;
end;

procedure TGauge.Start(max: Integer; text: string);
var
   I: Integer;
begin
   FCancel:=False;
   FStartTime:=GetTickCount;
   if (FForm<>nil) and not FDetail then begin
      FForm.Caption:=text;
      FForm.Show;
   end;
   FProgressBar.Max:=max;
   FProgressBar.Min:=0;
   FProgressBar.Position:=0;
   FMax:=max;
   FPos:=0;
   FOldPos:=0;
   FDetailPos:=0;
   Clear;
   if FForm<>nil then begin
      FForm.BringToFront;
   end;
   if not FDetail then begin
      for I:=0 to Pred(Screen.FormCount) do begin
         if Screen.Forms[I]<>FForm then begin
            Screen.Forms[I].Enabled:=False;
         end;
      end;
   end;
   DoUpdate(0, guStart);
   Application.ProcessMessages;
end;

procedure TGauge.Stop;
var
   I: Integer;
begin
   if (FForm<>nil) and not FDetail then begin
      FForm.Hide;
   end;
   FProgressBar.Position:=0;
   FTimeLabel.Caption:='';
   FTextLabel.Caption:='';
   FPosLabel.Caption:='';
   FSpeedLabel.Caption:='';
   if not FDetail then begin
      for I:=0 to Pred(Screen.FormCount) do begin
         if Screen.Forms[I]<>FForm then begin
            Screen.Forms[I].Enabled:=True;
         end;
      end;
   end;
   DoUpdate(FProgressBar.Max, guStop);
   Application.ProcessMessages;
end;

function TGauge.Update(pos: Integer; text: string; NewText: Boolean=True): Boolean;
var
   t: LongWord;
   speed: Extended;
   diff: Integer;
   CurTime: LongWord;
begin
   CurTime:=GetTickCount;
   diff:=CurTime-FOldTime;
   if diff<>0 then begin
      speed:=(FPos-FOldPos)/diff;
   end
   else begin
      speed:=0;
   end;
   FOldTime:=CurTime;
   FOldPos:=FPos;
   FPos:=FDetailPos+pos;
   t:=CurTime-FStartTime;
   FTimeLabel.Caption:=Format('%.2d:%.2d:%.2d', [(t div 1000) div 3600, ((t div 1000) div 60) mod 60, (t div 1000) mod 60]);
   FPosLabel.Caption:=Format('%d:%d', [FMax, FPos]);
   FSpeedLabel.Caption:=Format('%f поз/ms', [speed]);
   if FGr<>nil then begin
      FGr.AddLine(Round(Speed*10));//!!!!
   end;
   if NewText then begin
      FTextLabel.Caption:=text;
   end;
   FProgressBar.Position:=FPos;
   DoUpdate(FPos, guUpdate);
   if FForm<>nil then begin
      FForm.BringToFront;
   end;
   Application.ProcessMessages;
   Result:=FCancel;
end;

function TGauge.UpdateAdd(Add: Integer): Boolean;
begin
   Result:=Update(FPos+Add, '', False);
end;

procedure TGauge.UpdateDetail(pos: Integer; typ: TGaugeUpdate);
begin
   if FMaster then begin
      case typ of
         guStop: begin
            FDetailPos:=FDetailPos+pos;
            Update(0, '', False);
         end;
         guUpdate: begin
            Update(pos, '', False);
         end;
      end;
   end;
end;

procedure TfmGauge.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=False;
end;

{ TSimpleGauge }

procedure TSimpleGauge.CancelOn;
begin
   FForm.Config(False, True, True);
end;

constructor TSimpleGauge.Create;
begin
   inherited;
   FForm:=TfmGauge.Create(nil);
   FForm.Config(True, True, True);
   with FForm do begin
      Init(FForm, laMasterText, laMasterTime, laMasterPos, laMasterSpeed, pbaMaster, btCancel, nil);
   end;
end;

destructor TSimpleGauge.Destroy;
begin
   FForm.Free;
   inherited;
end;

{ TDoubleGauge }

constructor TDoubleGauge.Create;
begin
   inherited;
   FMaster:=TGauge.Create;
   FMaster.Master:=True;
   FMaster.DetailGauge:=Self;
   FForm:=TfmGauge.Create(nil);
   FForm.Config(True, False, True{False});
   with FForm do begin
      FMaster.Init(FForm, laMasterText, laMasterTime, laMasterPos, laMasterSpeed, pbaMaster, nil, nil);
      Init(FForm, laDetailText, laDetailTime, laDetailPos, laDetailSpeed, pbaDetail, nil, nil{pbGr});
   end;
   FDetail:=True;
end;

destructor TDoubleGauge.Destroy;
begin
   inherited;//!!!! из-за порядка уничтожения FGr
   FMaster.Free;
   FForm.Free;
end;

procedure TfmGauge.FormCreate(Sender: TObject);
begin {#ToDo3 протестировать по скорости}
   {paMaster.DoubleBuffered:=True;
   paDetail.DoubleBuffered:=True;}
end;

procedure TfmGauge.btMinimizeClick(Sender: TObject);
begin
   Application.Minimize;
   Application.ProcessMessages;
end;                                        

end.
