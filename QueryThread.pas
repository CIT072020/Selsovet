{  Free and previous threads still hanging around.
      if ( Assigned( poQueryThread ) ) then
         FreeAndNil( poQueryThread );
      poQueryThread := TQueryThread.Create( True, poQuery );
      poQueryThread.Resume( poQuery );
}

{
procedure TSQLNativeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( Assigned( poQueryThread ) ) then
   begin
      // Tell the thread to cancel and then wait for it to be called.
      bCancelSQL := True;
      poQueryThread.WaitFor;

      // Destroy the thread object now
      FreeAndNil( poQueryThread );
   end;
   Action := caFree;
end;
}

unit QueryThread;

{$IFDEF VER150}

   {$WARN UNSAFE_TYPE OFF}
   {$WARN UNSAFE_CODE OFF}
   {$WARN UNSAFE_CAST OFF}

   {$WARN SYMBOL_PLATFORM OFF}
   {$WARN UNIT_PLATFORM OFF}

{$ENDIF}


interface

uses

   Forms,
   ComObj,
   ActiveX,
   Classes,
   SysUtils,
   ComCtrls,
   adsdata,
   adstable;


const
  SQL_EXECUTE_SCRIPT=1;
  SQL_VERIFY_SQL=2;
  SQL_SHOW_PLAN=3;

type
  TQueryThread = class(TThread)
  private
    FQuery           : TAdsQuery;
    Fpb              : TProgressBar;
    FStartTime       : TDateTime;
    FEndTime         : TDateTime;
    FException       : Exception;
    FRowsAffected    : integer;
    FProgressVisible : boolean;
  protected
    procedure Execute; override;
    procedure FinishedSQL;
    procedure DoProgressBar;
    procedure SynchCall;
    procedure GetProgressVisibleFlag;
    procedure SetProgressVisibleFlag;
  public
    usPercent     : word;
    constructor Create( CreateSuspended   : Boolean;
                        poQuery           : TAdsQuery;
                        pb                : TProgressBar);
    function ProgressIsVisible : boolean;
    procedure SetProgressVisibility( Value : boolean );
    procedure Resume( poQuery : TAdsQuery ); overload;
  end;

function  ThreadCallback( usPercent : word; ulCallbackID : longint ) : longint; stdcall;

implementation

uses db, fSeekAkt;

constructor TQueryThread.Create(CreateSuspended: Boolean; poQuery : TAdsQuery; pb : TProgressBar);
begin
   inherited Create(CreateSuspended);
   FQuery:=poQuery;
   Fpb:=pb;
end;


{*******************************************************************************
*  Module: TQueryThread.DoProgressBar
*  Input:
*  Output:
*  Description: Performs the synchronized progress update. This is required in Kylix
*               because only the main thread may touch the screen.  In Delphi
*               it is just good programming technique.
*******************************************************************************}
procedure TQueryThread.DoProgressBar;
begin

   {*
    * Update the screen.  This function must be called with the
    * synchronize method to prevent Access Violations.
    *}
   Fpb.Position := usPercent;

end; {* TQueryThread.DoProgressBar *}


procedure TQueryThread.Execute;
var
  oSavedParams : TParams;
  savedBeforeScroll : TDataSetNotifyEvent;
  savedAfterScroll : TDataSetNotifyEvent;
begin

   {* COM best-practice is to call CoInitializeEx in every thread that will use COM *}
   OleCheck( CoInitializeEx( nil, 0 {* multi-threaded apartment *} ) );

   FException := nil;

   {*
    * Set the rows affected to -1 initially.  This corresponds to executing
    * a select statemnt.
    *}
   FRowsAffected := -1;

   {* If FQuery is nil we have serious issues *}
   if not assigned( FQuery ) then
   begin
      FException := Exception.Create( 'Internal Error: Thread does not have query component.' );
      Synchronize( FinishedSQL );
      exit;
   end;

   {* register the callback function *}
   FQuery.AdsRegisterCallbackFunction( @ThreadCallback,
                                       FQuery.Owner.Tag );

   try
      // Disable events that will fire during the open call. These events
      // interact with the gui and can't be safely called from the context of
      // this thread.
      savedBeforeScroll := FQuery.BeforeScroll;
      FQuery.BeforeScroll := nil;
      savedAfterScroll := FQuery.AfterScroll;
      FQuery.AfterScroll := nil;

      try
         {* start the query *}
         if ( FQuery.Tag = SQL_EXECUTE_SCRIPT ) then
         begin
            FStartTime := NOW;
            FQuery.ExecSQLScript;
            FEndTime := NOW;
         end
         else if ( FQuery.Tag = SQL_VERIFY_SQL ) then
         begin
            FStartTime := NOW;
            FQuery.VerifySQL;
            FEndTime := NOW;
         end
         else if ( FQuery.Tag = SQL_SHOW_PLAN ) then
         begin
            FStartTime := NOW;
            {*
             * Start by verifying the SQL, if that succeeded preppend
             * 'SHOW PLAN FOR ' and execute the statement to get a result set.
             * This is to make sure that the position of the error returned by the
             * query engine is correct.
             *}

            {*
             * Work around an issue in TDS. The VerifySQL method internally
             * executes the script line by line. This means it wipes out the
             * Params property as it sets the sql text over and over again.
             * ARC will save the params if there are any, and restore them
             * after the call to VerifySQL.
             *}
            if ( Assigned( FQuery.Params ) ) and
               ( FQuery.Params.Count > 0 ) then
            begin
               oSavedParams := TParams.Create;
               try
                  oSavedParams.Assign( FQuery.Params );
                  FQuery.VerifySQL;
                  FQuery.Params.Clear;
                  FQuery.Params.Assign( oSavedParams );
               finally
                  oSavedParams.Free;
               end;
            end
            else
               FQuery.VerifySQL;

            FQuery.SQL.Insert( 0, 'SHOW PLAN FOR ' );
            FQuery.Open;

            FEndTime := NOW;
         end
         else
         begin
            FStartTime := NOW;
            FQuery.Open;
            FEndTime := NOW;
         end;

      finally
         // re-instate scroll events
         FQuery.BeforeScroll := savedBeforeScroll;
         FQuery.AfterScroll := savedAfterScroll;
      end;

      {* report that we are finished *}
      Synchronize( FinishedSQL  );

   except
      on E : Exception do
      begin
         {*
          * Ignore the exception if it was just a "use execSQL" message, in
          * this case the statement has already been executed, but when the
          * descendant checks the cursor handle and sees that it doesn't have
          * one it raises this exception (o/w Delphi would try to use this
          * handle and fill data-aware components and the like).
          *}
         if( Pos( 'The SQL statement did not generate a cursor handle.  Use TAdsQuery.ExecSQL to ' +
                  'execute SQL statements that are not SELECT statements', E.Message ) = 0 ) then
            {* it was some other exception *}
         begin
            FException := E;
            Synchronize( FinishedSQL );
         end
         else
         begin
            FEndTime := NOW;

            {*
             * If this statement needed to be executed using ExecSQL then it was
             * a DML statement and returns the number of rows affected.  This
             * value is meaningless if a script was executed because it would
             * only give the last statement's rows affected not the entire number
             * of rows affected.
             *}
            if ( FQuery.Tag <> SQL_EXECUTE_SCRIPT ) then
               FRowsAffected := FQuery.RowsAffected;

            Synchronize( FinishedSQL );
         end;
      end;
   end;

   {* Clean up the call back function. *}
   FQuery.AdsClearCallbackFunction;

   CoUninitialize();

end;

procedure TQueryThread.FinishedSQL;
begin

   (FQuery.Owner as TfmSeekAkt).FinishedSQL( FStartTime, FEndTime, FException, FRowsAffected );

end;


{*******************************************************************************
*  Module: TQueryThread.SynchCall
*  Input:
*  Output:
*  Description: Performs the synchronized progress update. This is required in Kylix
*               because only the main thread may touch the screen.  In Delphi
*               it is just good programming technique.
*******************************************************************************}
procedure TQueryThread.SynchCall;
begin

   Synchronize( DoProgressBar );

end;


{*******************************************************************************
*  Module: TQueryThread.ProgressIsVisible
*  Input:
*  Output:
*  Description: Performs the synchronized read of the pbQuery visible property.
*******************************************************************************}
function TQueryThread.ProgressIsVisible : boolean;
begin
   Synchronize( GetProgressVisibleFlag );
   Result := FProgressVisible;
end;


{*******************************************************************************
*  Module: TQueryThread.GetProgressVisibleFlag
*  Input:
*  Output:
*  Description: Performs the synchronized read of the pbQuery visible property.
*******************************************************************************}
procedure TQueryThread.GetProgressVisibleFlag;
begin
   FProgressVisible := Fpb.Visible;
end;


{*******************************************************************************
*  Module: TQueryThread.SetProgressVisibleFlag
*  Input:
*  Output:
*  Description: Performs the synchronized write of the pbQuery visible property.
*******************************************************************************}
procedure TQueryThread.SetProgressVisibleFlag;
begin
   Fpb.Visible := FProgressVisible;
end;


{*******************************************************************************
*  Module: TQueryThread.
*  Input:
*  Output:
*  Description: Performs the synchronized read of the pbQuery visible property.
*******************************************************************************}
procedure TQueryThread.SetProgressVisibility( Value : boolean );
begin
   FProgressVisible := Value;
   Synchronize( SetProgressVisibleFlag );
end;


{*******************************************************************************
*  Module: TQueryThread.Resume
*  Input:  poQuery - Query to use in the thread.
*  Output:
*  Description: Kludge for kylix so it can't lose the query associated with it.
*******************************************************************************}
procedure TQueryThread.Resume(poQuery: TAdsQuery);
begin
   FQuery := poQuery;
   inherited Resume;
end;




{*******************************************************************************
*  Module: TQueryThread.ThreadCallback
*  Input:  usPercent : The amount of progress on the statement.
*          ulCallbackID : The call back ID for the Query.  This is related to
*                         the form to update.
*  Output: returns a non zero value to cancel the function.
*  Description: Updates the progress for the query and allows queries to be canceled.
*******************************************************************************}
function ThreadCallback( usPercent: word;
                         ulCallbackID: Integer): longint;
var
   iIndex  : integer;
   SQLForm : TfmSeekAkt;
begin

   result := 0;

   {* Retrieve the proper window *}
   iIndex := SQLWindowList.IndexOf( IntToStr( ulCallBackID ) );
   if ( iIndex <> -1 ) then
   begin
      {* Retrieve the proper Native SQL Window *}
      SQLForm := TfmSeekAkt(SQLWindowList.Objects[iIndex]);
      if ( Assigned( SQLForm ) ) then begin
         {* Cancel the Query if need be *}
         if ( SQLForm.bCancelSQL = True ) then begin
            {* Canceling the query bail out. *}
           result := 1;
           exit;
         end else begin
           result := 0;
         end;

         // NOTE: Don't show the progress bar if in debug mode, it's distracting
         // and incorrect.
         if ( not SQLForm.poQueryThread.ProgressIsVisible ) then
            SQLForm.poQueryThread.SetProgressVisibility( TRUE );

         {* Do the progress bar *}
         if ( Assigned( SQLForm.poQueryThread ) ) then
         begin
            {* Set the percent on the thread so it knows how much to paint *}
            SQLForm.poQueryThread.usPercent := usPercent;

            {* Call the helper function to paint the screen *}
            SQLForm.poQueryThread.SynchCall;
         end;
      end;
   end;
end; {* ThreadCallback *}




end.













