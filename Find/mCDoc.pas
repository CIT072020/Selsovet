unit mCDoc; // Compound File (OLE2 Structured Storage)
interface
uses
   Windows, Classes, ComCtrls, ActiveX, SysUtils, ComObj, TypInfo;

type
   // STGM - access modes for the object
   TStgAccessMode=(
      amRead,      // For stream objects, allows you to call the IStream::Read
                   // method. For storage objects, you can enumerate the
                   // storage elements and open them for reading
      amWrite,     // Lets you save changes to the object
      amReadWrite  // Is the combination of STGM_READ and STGM_WRITE
   );

   // STGM - access modes for the object
   TStgShareMode=(
      smExclusive,  // Is the combination of STGM_SHARE_DENY_READ and STGM_SHARE_DENY_WRITE
      smDenyWrite,  // Prevents others from subsequently opening the object in
                    // STGM_WRITE Mode. This value is typically used to prevent
                    // unnecessary copies made of an object opened by multiple
                    // users. If this value is not specified, a snapshot copy
                    // must be made for each subsequent opening. Thus, you can
                    // improve performance by specifying this value.
      smDenyRead,   // Prevents others from subsequently opening the object in
                    // STGM_READ Mode. It is typically used on a root storage
                    // object
      smDenyNone    // Specifies that subsequent openings of the object are
                    // not denied read or write access
   );

   // STGM - access modes for the object
   TStgTransactMode=(
      tmDirect,     // In direct Mode, each change to a storage element is
                    // written as it occurs. This is the default
      tmTransacted  // In transacted Mode, changes are buffered and are written
                    // only if an explicit commit operation is called. The
                    // changes can be ignored by calling the Revert method in
                    // the IStream or IStorage interfaces. Transacted Mode is
                    // not supported in the OLE-provided implementation of
                    // compound files
   );

   // STGM - conditions for creating and deleting the object
   TStgOpenFlag=(
      ofCreate,      // Indicates that an existing storage object or stream
                     // should be removed before the New one replaces it. A
                     // New object is created when this Flag is specified only
                     // if the existing object has been successfully removed.
      ofConvert,     // Flag is used in three situations:
                     // · when you are trying to create a storage object on disk
                     //   but a file of that Name already Exists
                     // · when you are trying to create a stream inside a
                     //   storage object but a stream with the specified Name
                     //   already Exists
                     // · when you are creating a byte array object but one with
                     //   the specified Name already Exists
                     // STGM_CONVERT creates the New object while preserving
                     // existing data in a stream named CONTENTS. In the case of
                     // a storage object or a byte array,the Old data is
                     // flattened to a stream regardless of whether the existing
                     // file or byte array currently contains a layered storage
                     // object.
      ofFail         // Causes the create operation to fail if an existing
                     // object with the specified Name Exists. In this case,
                     // STG_E_FILEALREADYEXISTS is returned. STGM_FAILIFTHERE
                     // applies to both storage objects and streams.
   );

   // STGM - conditions for creating and deleting the object
   TStgFlag=(
      sfPriority,    // Opens the storage object with exclusive access to the
                     // most recently committed version. Thus, other users
                     // cannot commit changes to the object while you have it
                     // open in priority Mode. You gain performance benefits for
                     // copy operations but you prevent others from committing
                     // changes. So you should limit the time you keep objects
                     // open in priority Mode. You must specify STGM_DIRECT and \
                     // STGM_READ with priority Mode.
      sfDelete       // Indicates that the underlying file is to be
                     // automatically destroyed when the root storage object is
                     // released. This capability is most useful for creating
                     // temporary files.
   );
   TStgFlags=set of TStgFlag;

   // STGTY - type of the storage element
   TStgType=(
      stRootStorage,
      stStorage,     // Indicates that the storage element is a storage object
      stStream,      // Indicates that the storage element is a stream object
      stLockBytes,   // Indicates that the storage element is a byte array object
      stProperty     // Indicates that the storage element is a property storage object
   );

   // STGFMT - format of a storage object
   TStgFormat=(
      sfDocument,    // Indicates a document format
      sfDirectory,   // Indicates a directory format
      sfCatalog,     // Indicates a catalog format
      sfFile         // Indicates a file format
   );

   // LOCKTYPE - type of locking requested for the specified range of bytes
   TStreamLock=(
      slWrite,      // If this lock is granted, the specified range of bytes can be
                    // opened and read any number of times, but writing to the locked
                    // range is prohibited except for the owner that was granted this lock
      slExclusive,  // If this lock is granted, writing to the specified range of
                    // bytes is prohibited except for the owner that was granted this lock
      slOnlyOnce    // If this lock is granted, no other LOCK_ONLYONCE lock can be
                    // obtained on the range. Usually this lock type is an alias for
                    // some other lock type. Thus, specific implementations can have
                    // additional behavior associated with this lock type
   );

   // STATFLAG - indicate whether the method should try to return a Name in the
   //            pwcsName member of the STATSTG structure
   TStatFlag=(
      stfDef,    // Requests that the statistics include the pwcsName member of
                 // the STATSTG structure
      stfNoname  // Requests that the statistics not include the pwcsName member
                 // of the STATSTG structure. If the Name is omitted, there is no
                 // need for the Stat methods to allocate and free Memory for the
                 // string value for the Name and the method can save an Alloc
                 // and Free operation
   );

   // STREAM_SEEK - origin from which to calculate the new seek pointer location
   TStreamSeek=(
      ssSet,   // Indicates that the new seek pointer is an offset relative to
               // the beginning of the stream. In this case, the dlibMove parameter
               // is the new seek position relative to the beginning of the stream
      ssCur,   // Indicates that the new seek pointer is an offset relative to the
               // current seek pointer location. In this case, the dlibMove parameter
               // is the signed displacement from the current seek position
      ssEnd    // Indicates that the new seek pointer is an offset relative to
               // the end of the stream. In this case, the dlibMove parameter is
               // the new seek position relative to the end of the stream
   );

   TStgFileState=(
      sfsOpenRead,
      sfsOpenWrite,
      sfsRewrite,
      sfsTemp,
      sfsBak,
      sfsTempCopy
   );

   TStorageResultMsgRec=record
      Res: HRESULT;
      Msg: string;
   end;

const
   STGFMT_DOCUMENT  = 0;
   STGFMT_DIRECTORY = 1;
   STGFMT_CATALOG   = 2;
   STGFMT_FILE      = 3;

   AStgAccessMode: array [TStgAccessMode] of Integer=(
      STGM_READ,     //amRead
      STGM_WRITE,    //amWrite
      STGM_READWRITE //amReadWrite
   );

   AStgShareMode: array [TStgShareMode] of Integer=(
      STGM_SHARE_EXCLUSIVE,  //smExclusive
      STGM_SHARE_DENY_WRITE, //smDenyWrite
      STGM_SHARE_DENY_READ,  //smDenyRead
      STGM_SHARE_DENY_NONE   //smDenyNone
   );

   AStgTransactMode: array [TStgTransactMode] of Integer=(
      STGM_DIRECT,      //tmDirect
      STGM_TRANSACTED   //tmTransacted
   );

   AStgOpenFlag: array [TStgOpenFlag] of Integer=(
      STGM_CREATE,      //ofCreate
      STGM_CONVERT,     //ofConvert
      STGM_FAILIFTHERE  //ofFail
   );

   AStgType: array [TStgType] of Integer=(
      STGTY_STORAGE,    //stRootStorage
      STGTY_STORAGE,    //stStorage
      STGTY_STREAM,     //stStream
      STGTY_LOCKBYTES,  //stLockBytes
      STGTY_PROPERTY    //stProperty
   );

   AStgFormat: array [TStgFormat] of Integer=(
      STGFMT_DOCUMENT,   //sfDocument
      STGFMT_DIRECTORY,  //sfDirectory
      STGFMT_CATALOG,    //sfCatalog
      STGFMT_FILE        //sfFile
   );

   AStreamLock: array [TStreamlock] of Integer=(
      LOCK_WRITE,      //slWrite
      LOCK_EXCLUSIVE,  //slExclusive
      LOCK_ONLYONCE    //slOnlyOnce
   );

   AStatFlag: array [TStatFlag] of Integer=(
      STATFLAG_DEFAULT, //stfDef
      STATFLAG_NONAME   //stfNoname
   );


   AStreamSeek: array [TStreamSeek] of Integer=(
      STREAM_SEEK_SET,  // ssSet
      STREAM_SEEK_CUR,  // ssCur
      STREAM_SEEK_END   // ssEnd
   );

   AStorageResultMsg: array [1..42] of TStorageResultMsgRec=(
      (Res: STG_E_INVALIDFUNCTION; Msg: 'Unable to perform requested operation.'),
      (Res: STG_E_FILENOTFOUND; Msg: '%l could not be found.'),
      (Res: STG_E_PATHNOTFOUND; Msg: 'The path %l could not be found.'),
      (Res: STG_E_TOOMANYOPENFILES; Msg: 'There are insufficient resources to open another file.'),
      (Res: STG_E_ACCESSDENIED; Msg: 'Access Denied.'),
      (Res: STG_E_INVALIDHANDLE; Msg: 'Attempted an operation on an invalid object.'),
      (Res: STG_E_INSUFFICIENTMEMORY; Msg: 'There is insufficient memory available to complete operation.'),
      (Res: STG_E_INVALIDPOINTER; Msg: 'Invalid pointer error.'),
      (Res: STG_E_NOMOREFILES; Msg: 'There are no more entries to return.'),
      (Res: STG_E_DISKISWRITEPROTECTED; Msg: 'Disk is write-protected.'),
      (Res: STG_E_SEEKERROR; Msg: 'An error occurred during a seek operation.'),
      (Res: STG_E_WRITEFAULT; Msg: 'A disk error occurred during a write operation.'),
      (Res: STG_E_READFAULT; Msg: 'A disk error occurred during a read operation.'),
      (Res: STG_E_SHAREVIOLATION; Msg: 'A share violation has occurred.'),
      (Res: STG_E_LOCKVIOLATION; Msg: 'Файл заблокирован другой программой.'), //A lock violation has occurred.
      (Res: STG_E_FILEALREADYEXISTS; Msg: '%l already exists.'),
      (Res: STG_E_INVALIDPARAMETER; Msg: 'Invalid parameter error.'),
      (Res: STG_E_MEDIUMFULL; Msg: 'There is insufficient disk space to complete operation.'),
      (Res: STG_E_PROPSETMISMATCHED; Msg: 'Illegal write of non-simple property to simple property set.'),
      (Res: STG_E_ABNORMALAPIEXIT; Msg: 'An API call exited abnormally.'),
      (Res: STG_E_INVALIDHEADER; Msg: 'The file %l is not a valid compound file.'),
      (Res: STG_E_INVALIDNAME; Msg: 'The name %l is not valid.'),
      (Res: STG_E_UNKNOWN; Msg: 'An unexpected error occurred.'),
      (Res: STG_E_UNIMPLEMENTEDFUNCTION; Msg: 'That function is not implemented.'),
      (Res: STG_E_INVALIDFLAG; Msg: 'Invalid flag error.'),
      (Res: STG_E_INUSE; Msg: 'Attempted to use an object that is busy.'),
      (Res: STG_E_NOTCURRENT; Msg: 'The storage has been changed since the last commit.'),
      (Res: STG_E_REVERTED; Msg: 'Attempted to use an object that has ceased to exist.'),
      (Res: STG_E_CANTSAVE; Msg: 'Can''t save.'),
      (Res: STG_E_OLDFORMAT; Msg: 'The compound file %l was produced with an incompatible version of storage.'),
      (Res: STG_E_OLDDLL; Msg: 'The compound file %l was produced with a newer version of storage.'),
      (Res: STG_E_SHAREREQUIRED; Msg: 'Share.exe or equivalent is required for operation.'),
      (Res: STG_E_NOTFILEBASEDSTORAGE; Msg: 'Illegal operation called on non-file based storage.'),
      (Res: STG_E_EXTANTMARSHALLINGS; Msg: 'Illegal operation called on object with extant marshallings.'),
      (Res: STG_E_DOCFILECORRUPT; Msg: 'The docfile has been corrupted.'),
      (Res: STG_E_BADBASEADDRESS; Msg: 'OLE32.DLL has been loaded at the wrong address.'),
      (Res: STG_E_INCOMPLETE; Msg: 'The file download was aborted abnormally. The file is incomplete.'),
      (Res: STG_E_TERMINATED; Msg: 'The file download has been terminated.'),
      (Res: STG_S_CONVERTED; Msg: 'The underlying file was converted to compound file format.'),
      (Res: STG_S_BLOCK; Msg: 'The storage operation should block until more data is available.'),
      (Res: STG_S_RETRYNOW; Msg: 'The storage operation should retry immediately.'),
      (Res: STG_S_MONITORING; Msg: 'The notified event sink will not influence the storage operation.')
   );

type

   TStgObject=class;
   TStorage=class;
   TStgStream=class;

   TStgTimes=record
     Creation: TDateTime;
     Access: TDateTime;
     Modify: TDateTime;
   end;

   TStgStat=class(TObject)
   private
      FStgObj: TStgObject;
      FName: string;
      FType: TStgType;
      FSize: Longint;
      FTime: TStgTimes;
      FMode: Longint;
      FLocksSupported: TStreamlock;
      FCLSID: TCLSID;
      FStateBits: Longint;
      FStgFmt: TStgFormat;
   private
      function GetsATime: string;
      function GetsCLSID: string;
      function GetsCTime: string;
      function GetsFormat: string;
      function GetsLock: string;
      function GetsMode: string;
      function GetsMTime: string;
      function GetsSize: string;
      function GetsState: string;
      function GetsType: string;
   public
      constructor Create(Stg: TStgObject; Typ: TStgType);
      destructor Destroy; override;
      function Stat(Flag: TStatFlag): HRESULT;
   public
      property Name: string read FName;
      property sType: string read GetsType;
      property sSize: string read GetsSize;
      property sATime: string read GetsATime;
      property sMTime: string read GetsMTime;
      property sCTime: string read GetsCTime;
      property sMode: string read GetsMode;
      property sLock: string read GetsLock;
      property sCLSID: string read GetsCLSID;
      property sState: string read GetsState;
      property sFormat: string read GetsFormat;
   end;

   // hierarchy                                    comments
   // -------------------------------------------------------------------------
   // TStgObject
   //  |-- TStorage
   //  |    \-- TRootStorage
   //  \-- TStgStream
   // -------------------------------------------------------------------------

   TStgObject=class(TObject)
   private
      FType: TStgType;
      FName: string;
      FParent: TStorage;
      FStat: TStgStat;
      FResult: HRESULT;
   protected
      procedure SetName(const VName: string); virtual;
      function GetOk: Boolean; virtual;
   public
      constructor Create(Parent: TStorage; Name: string; Typ: TStgType);
      destructor Destroy; override;
      function GetStat(var Stat: STATSTG; Flag: TStatFlag): HRESULT; virtual; abstract;
      procedure SetStat(Flag: TStatFlag);
   public
      property Name: string read FName write SetName;
      property Ok: Boolean read GetOk;
      property LastErr: HRESULT read FResult;
      property Parent: TStorage read FParent;
      property Stat: TStgStat read FStat;
      property Typ: TStgType read FType;
   end;

   TStgEnumProc=function (Stg: TStorage; Typ: TStgType; Name: string; Data: TObject): Boolean of object;

   TStorage=class(TStgObject)
   private
      FStorage: IStorage;
   private
      function AddElement(Stg: TStorage; Typ: TStgType; Name: string; Data: TObject): Boolean;
   public
      constructor Create(Name: string; Stg: IStorage; Parent: TStorage);
      destructor Destroy; override;
      function CreateStorage(const StgName: string; Mode: Integer): TStorage;
      function OpenStorage(const StgName: string; Mode: Integer): TStorage;
      function CreateStream(const StreamName: string; Mode: Integer): TStgStream;
      function OpenStream(const StreamName: string; Mode: Integer): TStgStream;
      procedure EnumElements(Proc: TStgEnumProc; Data: TObject);
      function GetStat(var Stat: STATSTG; Flag: TStatFlag): HRESULT; override;
      procedure CopyTo(Dest: TStorage);
      procedure GetElements(Elements: TStringList);
   end;

   TRootStorage=class(TStorage)
   private
      FFileName: string;
      FCopyFileName: string;
      FFileState: TStgFileState;
      FCanWrite: Boolean;
      FCanRead: Boolean;
      FMode: Integer;
   public
      constructor Create;
      destructor Destroy; override;
      function OpenFile(const FileName: string; State: TStgFileState): Boolean;
   public
      property CanRead: Boolean read FCanRead;
      property CanWrite: Boolean read FCanWrite;
      property FileName: string read FFileName;
      property State: TStgFileState read FFileState;
   end;

   TIStreamStream=class(TStream)
   private
      FStgStream: TStgStream;
      FStream: IStream;
      FResult: HRESULT;
   protected
      function GetOk: Boolean;
   public
      constructor Create(stream: IStream);
      destructor Destroy; override;
      function Read(var Buffer; Count: Longint) : Longint; override;
      function Seek(Offset: Longint; Origin: Word) : Longint; override;
      function Write(const Buffer; Count: Longint) : Longint; override;
      procedure SetSize(NewSize: Longint); override;
   public
      property Ok: Boolean read GetOk;
      property LastErr: HRESULT read FResult;
      property StgStream: TStgStream read FStgStream write FStgStream;
   end;

   TStgStream=class(TStgObject)
   private
      FStream: TIStreamStream;
   protected
      function GetOk: Boolean; override;
   public
      constructor Create(Name: string; Stream: IStream; Parent: TStorage);
      destructor Destroy; override;
      function GetStat(var Stat: STATSTG; Flag: TStatFlag): HRESULT; override;
      function WriteString(const S: string): Boolean;
      function WriteInteger(const I: Integer): Boolean;
      function WriteExtended(const E: Extended): Boolean;
      function WriteChar(const C: Char): Boolean;
      function WriteBoolean(const B: Boolean): Boolean;
      function WriteStream(const Stream: TStream): Boolean;
      function ReadByte(var B: Byte): Boolean;
      function ReadWord(var W: Word): Boolean;
      function ReadDWord(var D: DWord): Boolean;
      function ReadString(var S: string): Boolean;
      function ReadInteger(var I: Integer): Boolean;
      function ReadExtended(var E: Extended): Boolean;
      function ReadChar(var C: Char): Boolean;
      function ReadBoolean(var B: Boolean): Boolean;
      function ReadStream(const Stream: TStream): Boolean;
      procedure First;
   public
      property Stream: TIStreamStream read FStream;
   end;

   TStgNode=class;

   TStgTreeEnumProc=function(Node: TStgNode): Boolean of object;

   TStgNode=class(TList)
   private
      FStgObj: TStgObject;
      FNode: TTreeNode;
      FMode: Integer;
   protected
      function GetNode(I: Integer): TStgNode;
      function Enum(Stg: TStorage; Typ: TStgType; Name: string; Data: TObject): Boolean;
      procedure AddTreeNode(tv: TTreeView; Parent: TTreeNode);
   public
      constructor Create(Parent: TStorage; Typ: TStgType; Name: string; Mode: Integer);
      destructor Destroy; override;
      procedure Expand;
      function EnumNode(Proc: TStgTreeEnumProc): Boolean;
   public
      property Nodes[I: Integer]: TStgNode read GetNode;
      property Stg: TStgObject read FStgObj;
      property Node: TTreeNode read FNode;
   end;

   TStgTree=class(TObject)
   private
      FRoot: TRootStorage;
      FTree: TStgNode;
   protected
      function StatEnum(Node: TStgNode): Boolean;
   public
      constructor Create(const FileName: string; State: TStgFileState);
      destructor Destroy; override;
      procedure EnumTree(Proc: TStgTreeEnumProc);
      procedure SetStat;
      procedure ShowTree(tv: TTreeView);
   public
      property Tree: TStgNode read FTree;
      property Root: TRootStorage read FRoot;
   end;

function GetMode(
   Access: TStgAccessMode;
   Share: TStgShareMode;
   Transact: TStgTransactMode;
   Open: TStgOpenFlag;
   Flags: TStgFlags
): Integer;

function IsStgFile(const FileName: string): Boolean;

function OpenStgFile(
   const FileName: string;
   var Stg: IStorage;
   Mode: Integer;
   var Res: HRESULT
): Boolean;

function CreateStgFile(
   const FileName: string;
   var Stg: IStorage;
   Mode: Integer;
   var Res: HRESULT
): Boolean;

function CreateNewStorage(
   const StgName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stg: IStorage;
   var Res: HRESULT
): Boolean;

function CreateNewStream(
   const StreamName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stream: IStream;
   var Res: HRESULT
): Boolean;

function OpenOldStream(
   const StreamName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stream: IStream;
   var Res: HRESULT
): Boolean;

function OpenOldStorage(
   const StgName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stg: IStorage;
   var Res: HRESULT
): Boolean;

var
  DefCreateMode: Integer;
  DefOpenMode: Integer;

implementation

const
  E_FAIL=HRESULT($80004005);

function GetTime(T: TFileTime): TDateTime;
var
   R: packed record
      W1: Word;
      W2: Word;
   end;
   I: Integer absolute R;
begin
   I:=0;
   CoFileTimeToDosDateTime(T, R.W2, R.W1);
   if I=0 then begin
      Result:=0
   end
   else begin
      Result:=FileDateToDateTime(I);
   end;
end;

function GetGUID(G: TGUID): string;
var
   SG: System.TGUID;
   I: Integer;
begin
   SG.D1:=G.D1;
   SG.D2:=G.D2;
   SG.D3:=G.D3;
   for I:=0 to 7 do begin
      SG.D4[I]:=G.D4[I];
   end;
   Result:=GUIDToString(SG);
end;

function ModeToStr(M: DWORD): string;
begin
   Result:='';
   if (M and STGM_READ)=STGM_READ then Result:=Result+' READ';
   if (M and STGM_WRITE)=STGM_WRITE then Result:=Result+' WRITE';
   if (M and STGM_READWRITE)=STGM_READWRITE then Result:=Result+' READWRITE';
   if (M and STGM_SHARE_DENY_NONE)=STGM_SHARE_DENY_NONE then Result:=Result+' DENY_NONE';
   if (M and STGM_SHARE_DENY_READ)=STGM_SHARE_DENY_READ then Result:=Result+' DENY_READ';
   if (M and STGM_SHARE_DENY_WRITE)=STGM_SHARE_DENY_WRITE then Result:=Result+' DENY_WRITE';
   if (M and STGM_SHARE_EXCLUSIVE)=STGM_SHARE_EXCLUSIVE then Result:=Result+' EXCLUSIVE';
   if (M and STGM_DIRECT)=STGM_DIRECT then Result:=Result+' DIRECT';
   if (M and STGM_TRANSACTED)=STGM_TRANSACTED then Result:=Result+' TRANSACTED';
   if (M and STGM_CREATE)=STGM_CREATE then Result:=Result+' CREATE';
   if (M and STGM_CONVERT)=STGM_CONVERT then Result:=Result+' CONVERT';
   if (M and STGM_FAILIFTHERE)=STGM_FAILIFTHERE then Result:=Result+' FAILIFTHERE';
   if (M and STGM_PRIORITY)=STGM_PRIORITY then Result:=Result+' PRIORITY';
   if (M and STGM_DELETEONRELEASE)=STGM_DELETEONRELEASE then Result:=Result+' DELETEONRELEASE';
   Delete(Result, 1, 1);
end;

function GetMode(
   Access: TStgAccessMode;
   Share: TStgShareMode;
   Transact: TStgTransactMode;
   Open: TStgOpenFlag;
   Flags: TStgFlags
): Integer;
begin
   Result:=AStgAccessMode[access] or AStgShareMode[share] or AStgTransactMode[transact] or AStgOpenFlag[open];
   if sfPriority in Flags then begin
      Result:=Result or StgM_PRIORITY;
   end;
   if sfDelete in Flags then begin
      Result:=Result or StgM_DELETEONRELEASE;
   end;
end;

function GetResultMsg(Res: HRESULT): string;
var
   I: Integer;
begin
   Result:='';
   for I:=Low(AStorageResultMsg) to High(AStorageResultMsg) do begin
      if AStorageResultMsg[I].Res=Res then begin
         Result:=AStorageResultMsg[I].Msg;
         Break;
      end;
   end;
end;

function IsStgFile(const FileName: string): Boolean;
var
   Res: HRESULT;
   W: WideString;
begin
   W:=FileName;
   try
      Res:=StgIsStorageFile(PWideChar(W));
      Result:=Res=S_OK;
   except
      Result:=False;
   end;
end;

function OpenStgFile(
   const FileName: string;
   var Stg: IStorage;
   Mode: Integer;
   var Res: HRESULT
): Boolean;
var
   W: WideString;
begin
   W:=FileName;
   try
      Res:=StgIsStorageFile(PWideChar(W));
      if Res=S_OK then begin
         Res:=StgOpenStorage(PWideChar(W), nil, Mode, nil, 0, Stg);
      end;
      Result:=Res=S_OK;
   except
      Result:=False;
   end;
end;

function CreateStgFile(
   const FileName: string;
   var Stg: IStorage;
   Mode: Integer;
   var Res: HRESULT
): Boolean;
var
   W: WideString;
   P: PWideChar;
begin
   W:=FileName;
   try
      if FileName='' then begin
         P:=nil
      end
      else begin
         P:=PWideChar(W);
      end;
      Res:=StgCreateDocFile(P, Mode, 0, Stg);
      Result:=Res=S_OK;
   except
      Result:=False;
   end;
   //
   if not Result then begin
      raise Exception.Create(GetResultMsg(Res));
   end;
end;

function CreateNewStorage(
   const StgName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stg: IStorage;
   var Res: HRESULT
): Boolean;
var
   W: WideString;
begin
   Result:=False;
   if Parent<>nil then begin
      W:=StgName;
      try
         Res:=Parent.FStorage.CreateStorage(PWideChar(W), Mode, 0, 0, Stg);
         Result:=Res=S_OK;
      except
      end;
   end;
end;

function CreateNewStream(
   const StreamName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stream: IStream;
   var Res: HRESULT
): Boolean;                     
var
   W: WideString;
begin
  Result:=False;
  if Parent<>nil then begin
     W:=StreamName;
     try
        Res:=Parent.FStorage.CreateStream(PWideChar(W), Mode, 0, 0, Stream);
        Result:=Res=S_OK;
     except
     end;
  end;
end;

function OpenOldStream(
   const StreamName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stream: IStream;
   var Res: HRESULT
): Boolean;
var
   W: WideString;
begin
   Result:=False;
   if Parent<>nil then begin
      W:=StreamName;
      try
         Res:=Parent.FStorage.OpenStream(PWideChar(W), nil, Mode, 0, Stream);
         Result:=Res=S_OK;
      except
      end;
   end;
end;

function OpenOldStorage(
   const StgName: string;
   Parent: TStorage;
   Mode: Integer;
   var Stg: IStorage;
   var Res: HRESULT
): Boolean;
var
   W: WideString;
begin
   Result:=False;
   if Parent<>nil then begin
      W:=StgName;
      try
         Res:=Parent.FStorage.OpenStorage(PWideChar(W), nil, Mode, nil, 0, Stg);
         Result:=Res=S_OK;
      except
      end;
   end;
end;

{ TStorage }

function TStorage.AddElement(Stg: TStorage; Typ: TStgType; Name: string; Data: TObject): Boolean;
begin
   if (Data<>nil) and (Data is TStringList) then begin
      Result:=True;
      if (Length(Name)>0) and (Name[1]<#32) then begin
         Delete(Name, 1, 1);
      end;
      TStringList(Data).Add(Name);
   end
   else begin
      Result:=False;
   end;
end;

procedure TStorage.CopyTo(Dest: TStorage);
begin
   FResult:=FStorage.CopyTo(0, nil, nil, Dest.FStorage);
end;

constructor TStorage.Create(Name: string; Stg: IStorage; Parent: TStorage);
begin
   FStorage:=Stg;
   inherited Create(Parent, Name, stStorage);
end;

function TStorage.CreateStorage(const StgName: string; Mode: Integer): TStorage;
var
   Stg: IStorage;
begin
   Result:=nil;
   if CreateNewStorage(StgName, Self, Mode, Stg, FResult) then begin
      Result:=TStorage.Create(StgName, Stg, Self);
   end;
end;

function TStorage.CreateStream(const StreamName: string; Mode: Integer): TStgStream;
var
   Stream: IStream;
begin
   Result:=nil;
   if CreateNewStream(StreamName, Self, Mode, Stream, FResult) then begin
      Result:=TStgStream.Create(StreamName, Stream, Self);
   end;
end;

destructor TStorage.Destroy;
begin
   //--if Assigned(FStorage) then FStorage._Release;
   FStorage:=nil;
   inherited;
end;

procedure TStorage.EnumElements(Proc: TStgEnumProc; Data: TObject);
var
   Enum: IEnumSTATStg;
   Stat: TStatStg;
   Typ: TStgType;
   Name: string;
   Malloc: IMalloc;
   fExit: Boolean;
begin
   if (FStorage=nil) or not Assigned(Proc) then Exit;
   CoGetMalloc(1, Malloc);
   FResult:=FStorage.EnumElements(0, nil, 0, Enum);
   fExit:=False;
   while (FResult=S_OK) and not fExit do begin
      FResult:=Enum.Next(1, Stat, nil);
      if FResult=S_OK then begin
         case Stat.dwType of
            STGTY_STORAGE  : Typ:=stStorage;
            STGTY_STREAM   : Typ:=stStream;
            STGTY_LOCKBYTES: Typ:=stLockBytes;
            STGTY_PROPERTY : Typ:=stProperty;
         else
            Typ:=TStgType(-1);
         end;
         Name:=Stat.pwcsName;
         Malloc.Free(Stat.pwcsName);
         fExit:=not Proc(Self, Typ, Name, Data);
      end;
   end;
   //--Enum._Release;
   //--Malloc._Release;
   Enum:=nil;
   Malloc:=nil;
end;

procedure TStorage.GetElements(Elements: TStringList);
begin
   Elements.Clear;
   EnumElements(AddElement, Elements);
end;

function TStorage.GetStat(var Stat: STATSTG; Flag: TStatFlag): HRESULT;
begin
   FResult:=FStorage.Stat(Stat, AStatFlag[Flag]);
   Result:=FResult;
end;

function TStorage.OpenStorage(const StgName: string; Mode: Integer): TStorage;
var
   Stg: IStorage;
begin
   Result:=nil;
   if OpenOldStorage(StgName, Self, Mode, Stg, FResult) then begin
      Result:=TStorage.Create(StgName, Stg, Self);
   end;
end;

function TStorage.OpenStream(const StreamName: string; Mode: Integer): TStgStream;
var
   Stream: IStream;
begin
   Result:=nil;
   if OpenOldStream(StreamName, Self, Mode, Stream, FResult) then begin
      Result:=TStgStream.Create(StreamName, Stream, Self);
   end;
end;

{ TRootStorage }

constructor TRootStorage.Create;
begin
   inherited Create('', FStorage, nil);
   FType:=stRootStorage;
   FCanWrite:=False;
   FCanRead:=False;
   FMode:=DefOpenMode;
end;

destructor TRootStorage.Destroy;
begin
   inherited;
   if FFileState=sfsTempCopy then begin
      DeleteFile(ChangeFileExt(FCopyFileName, '.$$$'));
      if RenameFile(FCopyFileName, ChangeFileExt(FCopyFileName, '.$$$')) then begin
         RenameFile(FFileName, FCopyFileName);
         DeleteFile(ChangeFileExt(FCopyFileName, '.$$$'));
      end;
   end;
end;

function GetBakName(const Old: string; var New: string): Boolean;
var
   Ext: string;
begin
   Ext:=ExtractFileExt(Old);
   if Ext='.Bak' then begin
      Result:=False;
   end
   else begin
      Result:=True;
      New:=ChangeFileExt(Old, '.Bak');
   end;
end;

function TRootStorage.OpenFile(const FileName: string; State: TStgFileState): Boolean;
var
   Temp: IStorage;
   Bak: string;
   Exists: Boolean;
begin
   FResult:=E_FAIL;
   FFileState:=State;
   FFileName:=FileName;
   Exists:=FileExists(FileName);
   if FileName='' then begin
      FFileState:=sfsTemp
   end
   else begin
      if not Exists and ((FFileState=sfsBak) or (FFileState=sfsOpenWrite) or (FFileState=sfsTempCopy)) then begin
         FFileState:=sfsRewrite;
      end;
   end;
   case FFileState of
      sfsRewrite: begin
         FMode:=DefCreateMode;
         CreateStgFile(FileName, FStorage, FMode, FResult);
      end;
      sfsOpenWrite: begin
         FMode:=DefOpenMode;
         OpenStgFile(FileName, FStorage, FMode, FResult);
      end;
      sfsOpenRead: begin
        FMode:=GetMode(amRead, smExclusive, tmDirect, ofFail, []);
        if Exists then begin
           OpenStgFile(FileName, FStorage, FMode, FResult);
        end;
      end;
      sfsTemp: begin
         if not Exists then begin
            FMode:=DefCreateMode;
            CreateStgFile(FileName, FStorage, FMode or StgM_DELETEONRELEASE, FResult);
         end;
      end;
      sfsBak: begin
         if GetBakName(FileName, Bak) then begin
            if CreateStgFile(Bak, Temp, DefCreateMode, FResult) then begin
               try
                  FMode:=GetMode(amReadWrite, smExclusive, tmDirect, ofFail, []);
                  OpenStgFile(FileName, FStorage, FMode, FResult);
                  FStorage.CopyTo(0, nil, nil, Temp);
               except
                  FResult:=E_FAIL;
                  //--if Assigned(Temp) then Temp._Release;
                  Temp:=nil;
               end;
            end;
            //--if Assigned(Temp) then Temp._Release;
            Temp:=nil;
         end;
      end;
      sfsTempCopy: begin
         FCopyFileName:=FileName;
         if OpenStgFile(FileName, Temp, GetMode(amRead, smExclusive, tmDirect, ofFail, []),FResult) then begin
            try
               FFileName:=ChangeFileExt(FileName, '.tmp');
               FMode:=GetMode(amReadWrite, smExclusive, tmDirect, ofCreate, []);
               CreateStgFile(FFileName, FStorage, FMode, FResult);
               Temp.CopyTo(0, nil, nil, FStorage);
            except
               FResult:=E_FAIL;
               //--if Assigned(Temp) then Temp._Release;
               Temp:=nil;
            end;
         end;
         //--if Assigned(Temp) then Temp._Release;
         Temp:=nil;
      end;
   end;
   Result:=FResult=S_OK;
   FCanRead:=Result;
   FCanWrite:=(FFileState<>sfsOpenRead) and FCanRead;
end;

{ TStgStream }

constructor TStgStream.Create(Name: string; Stream: IStream; Parent: TStorage);
begin
   FStream:=TIStreamStream.Create(Stream);
   FStream.StgStream:=Self;
   inherited Create(Parent, Name, stStream);
end;

destructor TStgStream.Destroy;
begin
   FStream.Free;
   inherited;
end;

procedure TStgStream.First;
begin
   Stream.Seek(0, soFromBeginning);
end;

function TStgStream.GetOk: Boolean;
begin
   Result:=FStream.GetOk;
end;

function TStgStream.GetStat(var Stat: STATSTG; Flag: TStatFlag): HRESULT;
begin
   FResult:=FStream.FStream.Stat(Stat, AStatFlag[Flag]);
   Result:=FResult;
end;

function TStgStream.ReadBoolean(var B: Boolean): Boolean;
var
   P: Pointer;
begin
   P:=@B;
   FStream.Read(P^, SizeOf(Boolean));
   Result:=True;
end;

function TStgStream.ReadByte(var B: Byte): Boolean;
var
   P: Pointer;
   Size: Integer;
begin
   P:=@B;
   Size:=SizeOf(Byte);
   Result:=FStream.Read(P^, Size)<>Size;
end;

function TStgStream.ReadChar(var C: Char): Boolean;
var
   P: Pointer;
begin
   P:=@C;
   FStream.Read(P^, SizeOf(Char));
   Result:=True;
end;

function TStgStream.ReadDWord(var D: DWord): Boolean;
var
   P: Pointer;
   Size: Integer;
begin
   P:=@D;
   Size:=SizeOf(DWord);
   Result:=FStream.Read(P^, Size)<>Size;
end;

function TStgStream.ReadExtended(var E: Extended): Boolean;
var
   P: Pointer;
begin
   P:=@E;
   FStream.Read(P^, SizeOf(Extended));
   Result:=True;
end;

function TStgStream.ReadInteger(var I: Integer): Boolean;
var
   P: Pointer;
begin
   P:=@I;
   FStream.Read(P^, SizeOf(Integer));
   Result:=True;
end;

function TStgStream.ReadStream(const Stream: TStream): Boolean;
var
   Stat: STATSTG;
   Memory: TMemoryStream;
begin
   Result:=False;
   if (FStream<>nil) and (Stream<>nil) then begin
      FResult:=FStream.FStream.Stat(Stat, STATFLAG_NONAME);
      if Stream is TMemoryStream then begin
         Stream.Size:=Stat.cbSize; {*}
         FStream.Read(TMemoryStream(Stream).Memory^, Stream.Size);
      end
      else begin
         Memory:=TMemoryStream.Create;
         try
            Memory.Size:=Stat.cbSize; {*}
            FStream.Read(Memory.Memory^, Memory.Size);
            Stream.Write(Memory.Memory, Memory.Size);
         finally
            Memory.Free;
         end;
      end;
      Result:=True;
   end;
end;

function TStgStream.ReadString(var S: string): Boolean;
var
   L: Integer;
   P: Pointer;
begin
   P:=@L;
   FStream.Read(P^, SizeOf(Integer));
   SetString(S, nil, L);
   FStream.Read(PChar(S)^, L);
   Result:=True;
end;

function TStgStream.ReadWord(var W: Word): Boolean;
var
   P: Pointer;
   Size: Integer;
begin
   P:=@W;
   Size:=SizeOf(Word);
   Result:=FStream.Read(P^, Size)<>Size;
end;

function TStgStream.WriteBoolean(const B: Boolean): Boolean;
var
   P: Pointer;
begin
   P:=@B;
   FStream.Write(P^, SizeOf(Boolean));
   Result:=True;
end;

function TStgStream.WriteChar(const C: Char): Boolean;
var
   P: Pointer;
begin
   P:=@C;
   FStream.Write(P^, SizeOf(Char));
   Result:=True;
end;

function TStgStream.WriteExtended(const E: Extended): Boolean;
var
   P: Pointer;
begin
   P:=@E;
   FStream.Write(P^, SizeOf(Extended));
   Result:=True;
end;

function TStgStream.WriteInteger(const I: Integer): Boolean;
var
   P: Pointer;
begin
   P:=@I;
   FStream.Write(P^, SizeOf(Integer));
   Result:=True;
end;

function TStgStream.WriteStream(const Stream: TStream): Boolean;
var
   Memory: TMemoryStream;
begin
   Result:=False;
   if Stream<>nil then begin
      if Stream is TMemoryStream then begin
         FStream.Write(TMemoryStream(Stream).Memory, Stream.Size);
      end
      else begin
         Memory:=TMemoryStream.Create;
         Memory.Size:=Stream.Size;
         Stream.Read(Memory.Memory^, Memory.Size);
         FStream.Write(Memory.Memory, Memory.Size);
         Memory.Free;
      end;
      Result:=True;
   end;
end;

function TStgStream.WriteString(const S: string): Boolean;
var
   L: Integer;
   P: Pointer;
begin
   L:=Length(S);
   P:=@L;
   FStream.Write(P^, SizeOf(Integer));
   FStream.Write(PChar(S)^, L);
   Result:=True;
end;

{ TStgNode }

procedure TStgNode.AddTreeNode(tv: TTreeView; Parent: TTreeNode);
var
   I: Integer;
begin
   FNode:=tv.Items.AddChildObject(Parent, FStgObj.Name, Self);
   for I:=0 to Count-1 do begin
      Nodes[I].AddTreeNode(tv, FNode);
   end;
end;

constructor TStgNode.Create(Parent: TStorage; Typ: TStgType; Name: string; Mode: Integer);
begin
   FMode:=Mode;
   if Typ<>stRootStorage then begin
      case Typ of
         stStorage: FStgObj:=Parent.OpenStorage(Name, FMode);
         stStream : FStgObj:=Parent.OpenStream(Name, FMode);
      end;
   end
   else begin
      FStgObj:=Parent;
   end;
end;

destructor TStgNode.Destroy;
var
   I: Integer;
begin
   for I:=0 to Count-1 do begin
      TStgNode(Items[I]).Free;
   end;
   if Assigned(FStgObj) then begin
      if FStgObj.Typ<>stRootStorage then begin
         FStgObj.Free;
      end;
   end;
   inherited;
end;

function TStgNode.Enum(Stg: TStorage; Typ: TStgType; Name: string; Data: TObject): Boolean;
var
   Node: TStgNode;
begin
   Node:=TStgNode.Create(Stg, Typ, Name, FMode);
   Node.Expand;
   Add(Node);
   Result:=True;
end;

function TStgNode.EnumNode(Proc: TStgTreeEnumProc): Boolean;
var
   I: Integer;
begin
   Result:=True;
   for I:=0 to Count-1 do begin
      Result:=Proc(Items[I]);
      if not Result then Break;
      Result:=TStgNode(Items[I]).EnumNode(Proc);
      if not Result then Break;
   end;
end;

procedure TStgNode.Expand;
begin
   if (FStgObj<>nil) and ((FStgObj.Typ=stStorage) or (FStgObj.Typ=stRootStorage))
   then TStorage(FStgObj).EnumElements(Enum, nil);
end;

function TStgNode.GetNode(I: Integer): TStgNode;
begin
   Result:=TStgNode(Items[I]);
end;

{ TStgTree }

constructor TStgTree.Create(const FileName: string; State: TStgFileState);
begin
   FRoot:=TRootStorage.Create;
   FRoot.OpenFile(FileName, State);
   FTree:=TStgNode.Create(FRoot, stRootStorage, FRoot.Name, FRoot.FMode);
   if FRoot.FCanRead then begin
      FTree.Expand;
   end;
end;

destructor TStgTree.Destroy;
begin
   FTree.Free;
   FRoot.Free;
   inherited;
end;

procedure TStgTree.EnumTree(Proc: TStgTreeEnumProc);
begin
   FTree.EnumNode(Proc);
end;

procedure TStgTree.SetStat;
begin
   EnumTree(StatEnum);
end;

procedure TStgTree.ShowTree(tv: TTreeView);
var
   I: Integer;
begin
   tv.Items.BeginUpdate;
   tv.Items.Clear;
   for I:=0 to FTree.Count-1 do begin
      FTree.Nodes[I].AddTreeNode(tv, nil);
   end;
   tv.Items.EndUpdate;
end;

function TStgTree.StatEnum(Node: TStgNode): Boolean;
begin
   if Node.Stg<>nil then begin
      Node.Stg.SetStat(stfDef);
   end;
   Result:=True;
end;

{ TStgStat }

constructor TStgStat.Create(Stg: TStgObject; Typ: TStgType);
begin
   FStgObj:=Stg;
   FType:=Typ;
end;

destructor TStgStat.Destroy;
begin
   inherited;
end;

function TStgStat.GetsATime: string;
begin
   Result:=DateTimeToStr(FTime.Access);
end;

function TStgStat.GetsCLSID: string;
begin
   Result:=GetGUID(FCLSID)
end;

function TStgStat.GetsCTime: string;
begin
   Result:=DateTimeToStr(FTime.creation);
end;

function TStgStat.GetsFormat: string;
begin
   Result:=GetEnumName(TypeInfo(TStgFormat), Ord(FStgFmt));
end;

function TStgStat.GetsLock: string;
begin
   Result:=GetEnumName(TypeInfo(TStreamLock), Ord(FLocksSupported));
end;

function TStgStat.GetsMode: string;
begin
   Result:=ModeToStr(FMode);
end;

function TStgStat.GetsMTime: string;
begin
   Result:=DateTimeToStr(FTime.modify);
end;

function TStgStat.GetsSize: string;
begin
   Result:=IntToStr(FSize);
end;

function TStgStat.GetsState: string;
begin
   Result:=IntToStr(FStateBits);
end;

function TStgStat.GetsType: string;
begin
   Result:=GetEnumName(TypeInfo(TStgType), Ord(FType));
end;

function TStgStat.Stat(Flag: TStatFlag): HRESULT;
var
   Malloc: IMalloc;
   Stat: STATSTG;
begin
   Result:=E_FAIL;
   if FStgObj=nil then Exit;
   Result:=FStgObj.GetStat(Stat, Flag);
   if Result=S_OK then begin
      if Flag=stfDef then begin
         FName:=Stat.pwcsName;
         CoGetMalloc(1, Malloc);
         Malloc.Free(Stat.pwcsName);
         //--Malloc._Release;
         Malloc:=nil;
      end;
      FSize:=Stat.cbSize; {*}
      FTime.creation:=GetTime(Stat.ctime);
      FTime.access:=GetTime(Stat.atime);
      FTime.modify:=GetTime(Stat.mtime);
      FMode:=Stat.grfMode;
      case Stat.grfLocksSupported of
         LOCK_WRITE: FLocksSupported:=slWrite;
         LOCK_EXCLUSIVE: FLocksSupported:=slExclusive;
         LOCK_ONLYONCE: FLocksSupported:=slOnlyOnce;
      end;
      FCLSID:=Stat.clsid;
      FStateBits:=Stat.grfStateBits;
      case Stat.Reserved of
         STGFMT_DOCUMENT:FStgFmt:=sfDocument;
         STGFMT_DIRECTORY:FStgFmt:=sfDirectory;         STGFMT_CATALOG:FStgFmt:=sfCatalog;         STGFMT_FILE:FStgFmt:=sfFile;      end;
   end;
end;

{ TIStreamStream }

constructor TIStreamStream.Create(Stream: IStream);
begin
   FStream:=Stream;
end;

destructor TIStreamStream.Destroy;
begin
   //--if Assigned(FStream) then FStream._Release;
   FStream:=nil;
   inherited;
end;

function TIStreamStream.GetOk: Boolean;
begin
   Result:=FResult=S_OK;
end;

function TIStreamStream.Read(var Buffer; Count: Integer): Longint;
var
   ReadCount: Integer;
begin
   ReadCount:=0;
   FResult:=FStream.Read(@Buffer, Count, @ReadCount);
   if FStgStream<>nil then begin
      FStgStream.FResult:=FResult;
   end;
   Result:=ReadCount
end;

function TIStreamStream.Seek(Offset: Integer; Origin: Word): Longint;
var
   NewPos: Largeint;
begin
   case Origin of
      soFromBeginning: Origin:=STREAM_SEEK_SET;
      soFromCurrent: Origin:=STREAM_SEEK_CUR;
      soFromEnd: Origin:=STREAM_SEEK_END;
   end;
   FResult:=FStream.Seek(Offset, Origin, NewPos);
   if FStgStream<>nil then begin
      FStgStream.FResult:=FResult;
   end;
   Result:=NewPos; {*}
end;

procedure TIStreamStream.SetSize(NewSize: Integer);
begin
   FResult:=FStream.SetSize(NewSize);
   if FStgStream<>nil then begin
      FStgStream.FResult:=FResult;
   end;
end;

function TIStreamStream.Write(const Buffer; Count: Integer): Longint;
var
   WriteCount: Integer;
begin
   WriteCount:=0;
   FResult:=FStream.Write(@Buffer, Count, @WriteCount);
   if FStgStream<>nil then begin
      FStgStream.FResult:=FResult;
   end;
   Result:=WriteCount
end;

{ TStgObject }

constructor TStgObject.Create(Parent: TStorage; Name: string; Typ: TStgType);
begin
   FName:=Name;
   FParent:=Parent;
   FType:=Typ;
   FStat:=TStgStat.Create(Self, FType);
end;

destructor TStgObject.Destroy;
begin
   FStat.Free;
   inherited;
end;

function TStgObject.GetOk: Boolean;
begin
   Result:=FResult=S_OK;
end;

procedure TStgObject.SetStat(Flag: TStatFlag);
begin
   FResult:=FStat.Stat(Flag);
end;

procedure TStgObject.SetName(const VName: string);
begin
end;

initialization
   DefCreateMode:=GetMode(amReadWrite, smExclusive, tmDirect, ofCreate, []);
   DefOpenMode:=GetMode(amReadWrite, smExclusive, tmDirect, ofFail, []);

end.
