(* Delphi interface to Windows Task Scheduler 2.0

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1.0 - Oct. 2017
   Vers. 1.6 - September 2019
   Vers. 2.0 - January 2022
   last modified: April 2022
   *)

unit WinTask;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils, System.Contnrs, TaskSchedApi;

const
  BitMask : array [1..16] of word = (1,2,4,8,$10,$20,$40,$80,$100,$200,$400,$800,
     $1000,$2000,$4000,$8000);

  NotAvailOnXp = $20001322;

type
  TWinTaskStatus = (tsUnknown, tsReady, tsQueued, tsRunning, tsDisabled);
  TWinTaskCompatibility = (tcAT,tcXP,tcVista,tcWin7,tcWin10);
  TWinTaskActionType = (taExec,taCom,taMail,taMessage);
  TWinTaskTriggerType = (ttEvent,ttTime,ttDaily,ttWeekly,ttMonthly,ttMonthlyDow,ttIdle,
    ttRegistration,ttBoot,ttLogon,ttSessionStateChange,ttCustom);
  TLogonType = (ltNone,ltPassword,ltS4U,ltToken,ltGroup,ltService,ltTokenPassword);

  TWinServiceState =
   (ssUnknown,         // Just fill the value 0
    ssStopped,         // SERVICE_STOPPED
    ssStartPending,    // SERVICE_START_PENDING
    ssStopPending,     // SERVICE_STOP_PENDING
    ssRunning,         // SERVICE_RUNNING
    ssContinuePending, // SERVICE_CONTINUE_PENDING
    ssPausePending,    // SERVICE_PAUSE_PENDING
    ssPaused);         // SERVICE_PAUSED

  TTimeInfo = record
    DateTime : TDateTime;
    TimeZone : boolean;
//    TimeZoneOffset : integer; // time zone offset in minutes
    end;

  TWinTask = class;

  TWinTaskAction = class (TCollectionItem)
  private
    pAction : IAction;
    FActionType : TWinTaskActionType;
    function GetActionType : TWinTaskActionType;
    function GetActionTypeAsString : string;
    function GetId : string;
    procedure SetId (const Value : string);
  public
    destructor Destroy; override;
    procedure SetTaskAction(const Value: IAction);
    property ActionType : TWinTaskActionType read GetActionType;
    property ActionTypeAsString : string read GetActionTypeAsString;
    property Id : string read GetId write SetId;
    property TaskAction : IAction read pAction;
    end;

  TWinTaskExecAction = class (TWinTaskAction)
  private
    function GetPath : string;
    procedure SetPath (const Value : string);
    function GetArguments : string;
    procedure SetArguments (const Value : string);
    function GetWorkingDirectory : string;
    procedure SetWorkingDirectory (const Value : string);
  public
    property ApplicationPath : string read GetPath write SetPath;
    property Arguments : string read GetArguments write SetArguments;
    property WorkingDirectory  : string read GetWorkingDirectory write SetWorkingDirectory;
    end;

  TWinTaskComHandlerAction = class (TWinTaskAction)
  private
    function GetClassId : string;
    procedure SetClassId (const Value : string);
    function GetData : string;
    procedure SetData (const Value : string);
  public
    property ClassId : string read GetClassId write SetClassId;
    property Data : string read GetData write SetData;
    end;

  TWinTaskMailAction = class (TWinTaskAction)
  private
    function GetServer : string;
    function GetSubject : string;
    function GetTo : string;
    function GetCc : string;
    function GetBcc : string;
    function GetReplyTo : string;
    function GetFrom : string;
    function GetBody : string;
//    function GetHeaderFields
//    function GetAttachments
  public
//    property Attachments: PSafeArray read GetAttachments write SetAttachments;
    property Bcc: string read GetBcc; // write SetBcc;
    property Body: string read GetBody; // write SetBody;
    property Cc: string read GetCc; // write SetCc;
    property From: string read GetFrom; // write SetFrom;
//    property HeaderFields: ITaskNamedValueCollection read GetHeaderFields write SetHeaderFields;
    property ReplyTo: string read GetReplyTo; // write SetReplyTo;
    property Server: string read GetServer; // write SetServer;
    property Subject: string read GetSubject; // write SetSubject;
    property To_: string read GetTo; // write SetTo;
    end;

  TWinTaskMessageAction = class (TWinTaskAction)
  private
    function GetTitle : string;
    procedure SetTitle (const Value : string);
    function GetMessageBody : string;
    procedure SetMessageBody (const Value : string);
  public
    property Title: String read GetTitle write SetTitle;
    property MessageBody: String read GetMessageBody write SetMessageBody;
    end;

  TWinTaskActions = class (TCollection)
  private
    FTask : TWinTask;
    function GetItem(Index: Integer): TWinTaskAction;
    procedure SetItem(Index: Integer; Value: TWinTaskAction);
  public
    constructor Create(ATask : TWinTask);
    function New (AActionType : TWinTaskActionType) : TWinTaskAction;
    function Add (AAction : IAction) : TWinTaskAction; overload;
    procedure ClearAll;
    procedure Remove (AIndex : integer);
    property Items[Index: Integer]: TWinTaskAction read GetItem write SetItem;
    end;

  TWinTaskTrigger = class (TCollectionItem)
  private
    pTrigger : ITrigger;
    FTriggerType : TWinTaskTriggerType;
    FTimeZone : boolean;
    FTimeOffset : integer; // time zone offset in minutes
    function TimeStringToSeconds (TimeString : string) : cardinal;
    function SecondsToTimeString (Seconds : cardinal) : string;

    function GetDaysOfWeek : integer;
    procedure SetDaysOfWeek (Value : integer);
    function GetWeeksInterval : integer;
    procedure SetWeeksInterval (Value : integer);
    function GetWeeksOfMonth : integer;
    procedure SetWeeksOfMonth (Value : integer);
    function GetDaysOfMonth : integer;
    procedure SetDaysOfMonth (Value : integer);
    function GetMonthsOfYear : integer;
    procedure SetMonthsOfYear (Value : integer);
    function GetRunOnLastDayOfMonth : boolean;
    procedure SetRunOnLastDayOfMonth (Value : boolean);
    function GetRunOnLastWeekOfMonth : boolean;
    procedure SetRunOnLastWeekOfMonth (Value : boolean);
    function GetDaysInterval : SmallInt;
    procedure SetDaysInterval (Value : SmallInt);
    function GetDelay : cardinal;               // time in seconds
    procedure SetDelay (Value : cardinal);
    function GetDuration : cardinal;            // time in seconds
    procedure SetDuration (Value : cardinal);
    function GetExecutionTimeLimit : cardinal;  // time in seconds
    procedure SetExecutionTimeLimit (Value : cardinal);
    function GetEndTime : TDateTime;
    procedure SetEndTime (Value : TDateTime);
    function GetEnabled : boolean;
    procedure SetEnabled (Value : boolean);
    function GetId : string;
    procedure SetId (const Value : string);
    function GetLogonUserId : string;
    procedure SetLogonUserId (const Value : string);
    function GetInterval : cardinal;             // time in seconds
    procedure SetInterval (Value : cardinal);
    function GetRandomDelay : cardinal;             // time in seconds
    procedure SetRandomDelay (Value : cardinal);
    function GetStartTime : TDateTime;
    procedure SetStartTime (Value : TDateTime);
    function GetStopAtDurationEnd : boolean;
    procedure SetStopAtDurationEnd (Value : boolean);
    function GetSubscription : string;
    procedure SetSubscription (const Value : string);
    function GetTriggerType : TWinTaskTriggerType;
    function GetTriggerTypeAsString : string;
    function GetTriggerString : String;
  public
    constructor Create (Collection: TCollection);
    destructor Destroy; override;
    procedure SetTaskTrigger(const Value: ITrigger);
    procedure SetToDefault(const AUserId : string);
//    property Repetition: IRepetitionPattern read GetRepetition write Set_Repetition;
    property Delay : cardinal read GetDelay write SetDelay;
    property DaysInterval : SmallInt read GetDaysInterval write SetDaysInterval;
    property DaysOfMonth : integer read GetDaysOfMonth write SetDaysOfMonth;
    property DaysOfWeek : integer read GetDaysOfWeek write SetDaysOfWeek;
    property Duration : cardinal read GetDuration write SetDuration;
    property ExecutionTimeLimit : cardinal read GetExecutionTimeLimit write SetExecutionTimeLimit;
    property EndTime : TDateTime read GetEndTime write SetEndTime;
    property Enabled : Boolean read GetEnabled write SetEnabled;
    property Id : string read GetId write SetId;
    property Interval : cardinal read GetInterval write SetInterval;
    property LogonUserId : string read GetLogonUserId write SetLogonUserId;
    property MonthsOfYear: integer read GetMonthsOfYear write SetMonthsOfYear;
    property RandomDelay : cardinal read GetRandomDelay write SetRandomDelay;
    property RunOnLastDayOfMonth : boolean read GetRunOnLastDayOfMonth write SetRunOnLastDayOfMonth;
    property RunOnLastWeekOfMonth : boolean read GetRunOnLastWeekOfMonth write SetRunOnLastWeekOfMonth;
    property StartTime : TDateTime read GetStartTime write SetStartTime;
    property StopAtDurationEnd : boolean read GetStopAtDurationEnd write SetStopAtDurationEnd;
    property Subscription : string  read GetSubscription write SetSubscription;
    property TaskTrigger : ITrigger read pTrigger;
    property TriggerType : TWinTaskTriggerType read GetTriggerType;
    property TriggerTypeAsString : string read GetTriggerTypeAsString;
    property TriggerString : String read GetTriggerString;
    property UseTimeZone : boolean read FTimeZone write FTimeZone;
    property WeeksInterval : integer read GetWeeksInterval write SetWeeksInterval;
    property WeeksOfMonth  : integer read GetWeeksOfMonth  write SetWeeksOfMonth ;
    end;

  TWinTaskTriggers = class (TCollection)
  private
    FTask : TWinTask;
    function GetItem(Index: Integer): TWinTaskTrigger;
    procedure SetItem(Index: Integer; Value: TWinTaskTrigger);
  public
    constructor Create(ATask : TWinTask);
    function New (ATriggerType : TWinTaskTriggerType) : TWinTaskTrigger;
    function Add (ATrigger : ITrigger) : TWinTaskTrigger; overload;
    procedure ClearAll;
    procedure Remove (AIndex : integer);
    property Items[Index: Integer]: TWinTaskTrigger read GetItem write SetItem;
    end;

  TWinTask = class (TObject)
  private
    pDefinition : ITaskDefinition;
    FData: TMemoryStream;
    FActions : TWinTaskActions;
    FSelectedAction : integer;
    FTriggers: TWinTaskTriggers;
    function GetAuthor : string;
    procedure SetAuthor (const Value : string);
    function GetData : string;
    procedure SetData (const Value : string);
    function GetDate : TDateTime;
    function GetDateAsString : string;
    procedure SetDate (Value : TDateTime);
    function GetDescription : string;
    procedure SetDescription (const Value : string);
    function GetDocumentation : string;
    procedure SetDocumentation (const Value : string);
    function GetDisplayName : string;
    procedure SetDisplayName (const Value : string);
    function GetGroupId : string;
    procedure SetGroupId (const Value : string);
    function GetId : string;
    procedure SetId (const Value : string);
    function GetUserId : string;
    procedure SetUserId (const Value : string);
    function GetLogonType : TLogonType;
    procedure SetLogonType (Value : TLogonType);
    function GetRunLevel : boolean;
    procedure SetRunLevel (Value : boolean);
    function GetCompatibility : TWinTaskCompatibility;
    procedure SetCompatibility (Value : TWinTaskCompatibility);
    function GetCompatibilityAsString : string;
    function GetRunIfMissed : boolean;
    procedure SetRunIfMissed (Value : boolean);
    function GetRunOnlyIfNetwork : boolean;
    procedure SetRunOnlyIfNetwork (Value : boolean);
    function GetHidden : boolean;
    procedure SetHidden (Value : boolean);
    function GetDisallowOnBatteries : boolean;
    procedure SetDisallowOnBatteries (Value : boolean);
    function GetStopOnBatteries : boolean;
    procedure SetStopOnBatteries (Value : boolean);
    function GetPriority : TThreadPriority;
    procedure SetPriority (Value : TThreadPriority);
    function GetWakeToRun : boolean;
    procedure SetWakeToRun (Value : boolean);
    function GetAction (Index: Integer) : TWinTaskAction;
    function GetActionCount : Integer;
    function GetTrigger (Index: Integer) : TWinTaskTrigger;
    function GetTriggerCount : Integer;
  public
    constructor Create(const ADefinition : ITaskDefinition);
    destructor Destroy; override;
    function NewAction (AActionType : TWinTaskActionType) : TWinTaskAction;
    function DeleteAction (AIndex : integer) : boolean;
    function NewTrigger (ATriggerType : TWinTaskTriggerType) : TWinTaskTrigger;
    function DeleteTrigger (AIndex : integer) : boolean;
    procedure Refresh;
    function IndexOfApp (const AppFilter : string) : integer;
    function IndexOfNextExecAction (FromIndex : integer = 0) : integer;
    property Actions[Index: Integer] : TWinTaskAction read GetAction;
    property ActionCount : integer read GetActionCount;
    property Author : string read GetAuthor write SetAuthor;
    property Compatibility : TWinTaskCompatibility read GetCompatibility write SetCompatibility;
    property CompatibilityAsString : string read GetCompatibilityAsString;
    property UserData : string read GetData write SetData;
    property Date : TDateTime read GetDate write SetDate;
    property DateAsString : string read GetDateAsString;
    property Description : string read GetDescription write SetDescription;
    property DisallowOnBatteries : boolean read GetDisallowOnBatteries write SetDisallowOnBatteries;
    property DisplayName : string read GetDisplayName write SetDisplayName;
    property Documentation : string read GetDocumentation write SetDocumentation;
    property GroupId : string read GetGroupId write SetGroupId;
    property Hidden : boolean read GetHidden write SetHidden;
    property Id : string read GetId write SetId;
    property LogonType : TLogonType read GetLogonType write SetLogonType;
    property Priority : TThreadPriority read GetPriority write SetPriority;
    property RunIfMissed : boolean read GetRunIfMissed write SetRunIfMissed;
    property HighestRunLevel : boolean read GetRunLevel write SetRunLevel;
    property RunOnlyIfNetwork : boolean read GetRunOnlyIfNetwork write SetRunOnlyIfNetwork;
    property SelectedAction : integer read FSelectedAction;
    property StopOnBatteries : boolean read GetStopOnBatteries write SetStopOnBatteries;
    property Triggers[Index: Integer] : TWinTaskTrigger read GetTrigger;
    property TriggerCount : integer read GetTriggerCount;
    property UserId : string read GetUserId write SetUserId;
    property WakeToRun : boolean read GetWakeToRun  write SetWakeToRun;
    end;

  TWinRegisteredTask = class (TObject)
  private
    pRegisteredTask : IRegisteredTask;
    FTaskName: String;
    FIndex : integer;
    FTask : TWinTask;
    function GetEnabled : boolean;
    procedure SetEnabled (Value : boolean);
    function GetTaskResult : integer;
    function GetLastRunTime : TDateTime;
    function GetLastRunTimeAsString : string;
    function GetNextRunTime : TDateTime;
    function GetNextRunTimeAsString : string;
    function GetNumberOfMissedRuns : integer;
    function GetPath : string;
    function GetStatus : TWinTaskStatus;
    function GetStatusAsString: string;
  public
    constructor Create(const ARegisteredTask : IRegisteredTask);
    destructor Destroy; override;
    procedure Refresh;
    procedure Run;
    procedure Stop;
    function IndexOfApp (const AppFilter : string) : integer;
    property Definition : TWinTask read FTask;
    property Enabled : boolean read GetEnabled write SetEnabled;
    property LastResult : integer read GetTaskResult;
    property LastRunTime : TDateTime read GetLastRunTime;
    property LastRunTimeAsString : string read GetLastRunTimeAsString;
    property NextRunTime : TDateTime read GetNextRunTime;
    property NextRunTimeAsString : string read GetNextRunTimeAsString;
    property NumberOfMissedRuns : integer read GetNumberOfMissedRuns;
    property Path : string read GetPath;
    property Status: TWinTaskStatus read GetStatus;
    property StatusAsString : string read GetStatusAsString;
    property TaskIndex : integer read FIndex write FIndex;
    property TaskName : string read FTaskName;
    end;

  TWinTaskList = class (TObjectList);
  TWinTaskFolderList = class (TObjectList);

  TWinTaskSubFolder = class (TObject)
  private
    pTaskFolder : ITaskFolder;
    function GetName : string;
    function GetPath : string;
  public
    constructor Create (const ATaskFolder : ITaskFolder);
    destructor Destroy; override;
    property Name : string read GetName;
    property Path : string read GetPath;
    end;

  TWinTaskFolder = class (TObject)
  private
    pRootFolder : ITaskFolder;
    pTaskCollection : IRegisteredTaskCollection;
    pTaskFolderCollection : ITaskFolderCollection;
    FNumTasks, FNumFolders : LONG;
    FTasks : TWinTaskList;
    FFolders : TWinTaskFolderList;
    FErrMsg : string;
    FErrorCode : cardinal;
    function GetName : string;
    function GetPath : string;
    function GetTask(Index : Integer): TWinRegisteredTask;
    function GetFolder(Index : Integer): TWinTaskSubfolder;
  public
    constructor Create (ARootFolder : ITaskFolder);
    destructor Destroy; override;
    function Refresh : HResult;
    function DeleteTask (const TaskName: string) : boolean;
    function IndexOfTask (const TaskName: String): integer;
    function RegisterTask (const TaskName : string; ATask : TWinTask;
                           Username, Password : string) : integer;
    function IndexOfFolder (const FolderName: String): integer;
    function CreateFolder (const AName : string) : integer;
    function DeleteFolder (const AName : string) : boolean;
    property ErrorCode : cardinal read FErrorCode;
    property ErrorMessage : string read FErrMsg;
    property FolderName : string read GetName;
    property FolderPath : string read GetPath;
    property Folders[Index: Integer] : TWinTaskSubfolder read GetFolder;
    property FolderCount : integer read FNumFolders;
    property NumberOfTasks : integer read FNumTasks;
    property Tasks[Index: Integer] : TWinRegisteredTask read GetTask;
    property TaskCount : integer read FNumTasks;
    end;

//  TWinTaskScheduler = class (TObject)
  TWinTaskScheduler = class (TObject)
  private
    pService :  ITaskService;
    FFolder  : string;
    FTaskFolder : TWinTaskFolder;
    FResult     : HResult;
    procedure  SetFolder (const AFolder : string);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    function Init : HResult;
    function Refresh : HResult;
    function NewTask : TWinTask;
    property Path : string read FFolder write SetFolder;
    property TaskFolder : TWinTaskFolder read FTaskFolder;
  public
    class function IsRunning: Boolean;
    end;

function GetDefaultCompatibility : TWinTaskCompatibility;
function GetServiceStatusByName(const AServer,AServiceName : string) : TWinServiceState;

function CreateWinTaskScheduler (var TaskSchedule : TWinTaskScheduler) : HResult;

implementation

uses System.Win.ComObj, System.DateUtils, System.Math, System.StrUtils, Winapi.ActiveX,
  Winapi.WinSvc, System.Variants, WinTaskConsts;

const
  TaskTriggerNames : array[TWinTaskTriggerType] of string =
    ('Event','Time','Daily','Weekly','Monthly','MonthlyDow','Idle','Register',
     'Boot','Logon','State','Custom');
var
  TaskStateNames : array[TWinTaskStatus] of pointer =
    (@rsTrgUnknown,@rsTrgReady,@rsTrgQueued,@rsTrgRunning,@rsTrgDisabled);

  TaskActionNames : array[TWinTaskActionType] of pointer =
    (@rsTrgActionExec,@rsTragActionCom,@rsTragActionMail,@rsTragActionMsg);

  TaskTriggerDescriptions : array[TWinTaskTriggerType] of pointer =
    (@rsTrgTypeEvent,@rsTrgTypeTime,@rsTrgTypeDaily,@rsTrgTypeWeekly,@rsTrgTypeMonthly,
     @rsTrgTypeMonthly,@rsTrgTypeIdle,@rsTrgTypeRegister,@rsTrgTypeStartup,
     @rsTrgTypeLogon,@rsTrgTypeStateChg,@rsTrgTypeCustom);

  TaskWeeksOfMonthList : array[1..5] of pointer =
    (@rsTrgFirst,@rsTrgSecond,@rsTrgThird,@rsTrgFourth,@rsTrgLast);

  CompatibilityNames : array[TWinTaskCompatibility] of pointer =
    (@rsCompAT,@rsXP,@rsVista,@rsWin7,@rsWin10);

  TaskFlags : array[TLogonType] of LongWord =
    (TASK_LOGON_NONE,TASK_LOGON_PASSWORD,TASK_LOGON_S4U,TASK_LOGON_INTERACTIVE_TOKEN,
     TASK_LOGON_GROUP,TASK_LOGON_SERVICE_ACCOUNT,TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD);

  ActionTypes : array[TWinTaskActionType] of LongWord =
    (TASK_ACTION_EXEC,TASK_ACTION_COM_HANDLER,TASK_ACTION_SEND_EMAIL,TASK_ACTION_SHOW_MESSAGE);

  TriggerTypes  : array[TWinTaskTriggerType] of LongWord =
    (TASK_TRIGGER_EVENT,TASK_TRIGGER_TIME,TASK_TRIGGER_DAILY,TASK_TRIGGER_WEEKLY,
     TASK_TRIGGER_MONTHLY,TASK_TRIGGER_MONTHLYDOW,TASK_TRIGGER_IDLE,
     TASK_TRIGGER_REGISTRATION,TASK_TRIGGER_BOOT,TASK_TRIGGER_LOGON,
     TASK_TRIGGER_SESSION_STATE_CHANGE,TASK_TRIGGER_CUSTOM_TRIGGER_01);

  Compatibilities : array[TWinTaskCompatibility] of LongWord =
    (TASK_COMPATIBILITY_AT,TASK_COMPATIBILITY_V1,TASK_COMPATIBILITY_V2,
     TASK_COMPATIBILITY_V2_1,TASK_COMPATIBILITY_V2_2);

  Priorities : array[TThreadPriority] of integer = (10,9,7,5,3,1,0);

{ --------------------------------------------------------------- }
// Format without raising an exception on errors
function TryFormat(const AFormat: string; const Args: array of const): string;
begin
  try
    Result:=Format(AFormat,Args);
  except
    on E:Exception do Result:=rsFormatError+AFormat;
    end;
  end;

{------------------------------------------------------------------- }
function GetServiceStatusByName(const AServer,AServiceName : string) : TWinServiceState;
var
  ServiceHandle,
  SCMHandle: DWORD;
  SCMAccess,Access:DWORD;
  ServiceStatus: TServiceStatus;
{$IFDEF Trace}
const
  WinServiceStates : array [0..7] of string =
   ('Unknown',         // Just fill the value 0
    'Stopped',         // SERVICE_STOPPED
    'StartPending',    // SERVICE_START_PENDING
    'StopPending',     // SERVICE_STOP_PENDING
    'Running',         // SERVICE_RUNNING
    'ContinuePending', // SERVICE_CONTINUE_PENDING
    'PausePending',    // SERVICE_PAUSE_PENDING
    'Paused');         // SERVICE_PAUSED
{$EndIf}
begin
  Result:=ssUnknown;
  SCMAccess:=SC_MANAGER_CONNECT or SC_MANAGER_ENUMERATE_SERVICE or SC_MANAGER_QUERY_LOCK_STATUS;
  Access:=SERVICE_INTERROGATE or GENERIC_READ;
  SCMHandle:= OpenSCManager(PChar(AServer), Nil, SCMAccess);
  if SCMHandle <> 0 then begin
    try
      ServiceHandle:=OpenService(SCMHandle,PChar(AServiceName),Access);
      if ServiceHandle <> 0 then begin
        try
          ZeroMemory(@ServiceStatus, SizeOf(ServiceStatus));
          if QueryServiceStatus(ServiceHandle,ServiceStatus) then begin
            Result:=TWinServiceState(ServiceStatus.dwCurrentState);
{$IFDEF Trace}
//            WriteDebugLog(TryFormat('Status of service "%s": %s',[AServiceName,WinServiceStates[ServiceStatus.dwCurrentState]]));
{$EndIf}
            end;
        finally
          CloseServiceHandle(ServiceHandle);
          end;
        end
{$IFDEF Trace}
//        else WriteDebugLog(TryFormat('Error opening service "%s" - ',[AServiceName])+SysErrorMessage(GetLastError));
{$EndIf}
    finally
      CloseServiceHandle(SCMHandle);
      end;
    end
{$IFDEF Trace}
//  else WriteDebugLog('Error opening service mananger - '+SysErrorMessage(GetLastError));
{$EndIf}
  end;

{------------------------------------------------------------------- }
// Read number (word) between next non numerical character,
function ReadNextValue (var sTime : string) : word;
var
  n,k,v : integer;
const
  Numbers : TSysCharSet = ['0'..'9'];
begin
  if length(sTime)>0 then begin
    n:=1;
    while (n<=length(sTime)) and not CharInSet(sTime[n],Numbers) do inc(n);
    k:=n;
    while (k<=length(sTime)) and CharInSet(sTime[k],Numbers) do inc(k);
    if TryStrToInt(copy(sTime,n,k-n),v) then Result:=v
    else Result:=0;
    Delete(sTime,1,k-1);
    end
  else Result:=0;
  end;

function GetUnitNumber (const sOne,sMany : string; n : integer) : string;
begin
  if n=1 then Result:=TryFormat(sOne,[n]) else Result:=TryFormat(sMany,[n]);
  end;

// Convert boundary string to TDateTime
function BoundaryToTimeInfo (Boundary : string) : TTimeInfo;
var
  y,m,d,h,n,s : integer;
begin
  with Result do begin
    DateTime:=0; TimeZone:=false;
    end;
  if length(Boundary)=0 then Exit;
  y:=ReadNextValue(Boundary);
  m:=ReadNextValue(Boundary);
  d:=ReadNextValue(Boundary);
  h:=ReadNextValue(Boundary);
  n:=ReadNextValue(Boundary);
  s:=ReadNextValue(Boundary);
  try
    Result.DateTime:=EncodeDateTime(y,m,d,h,n,s,0);
  except
    Exit;
    end;
  if (length(Boundary)>0) then begin  // offset
    Result.TimeZone:=true;
//    if Boundary[1]='Z' then Result.TimeZoneOffset:=0
//      Result:=Result-TTimeZone.Local.UtcOffset.TotalMinutes/MinsPerDay
//    else with Result do begin
//      minus:=Boundary[1]='-';
//      h:=ReadNextValue(Boundary);
//      n:=ReadNextValue(Boundary);
//      TimeZoneOffset:=h*MinsPerHour+n;
//      if minus then TimeZoneOffset:=-TimeZoneOffset;
//      end;
//    if TTimeZone.Local.IsDaylightTime(Now) then Result:=Result+OneHour;
    end
  else with Result do begin
    TimeZone:=false; // TimeZoneOffset:=0;
    end;
  end;

function BoundaryToDateTime (const Boundary : string) : TDateTime;
begin
  Result:=BoundaryToTimeInfo(Boundary).DateTime;
  end;

function DateTimeToBoundary (Value : TDateTime; UseTimeZone : boolean) : string;
var
  m : double;
begin
  if Value<1 then Result:=''
  else begin
    Result:=FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',Value);
    if UseTimeZone then begin
      m:=TTimeZone.Local.UtcOffset.TotalMinutes;
      if IsZero(m) then Result:=Result+'Z'
      else begin
        if m<0 then Result:=Result+'-' else Result:=Result+'+';
        Result:=Result+FormatDateTime('hh:nn',abs(m)/MinsPerDay);
        end;
      end;
    end;
  end;

function DateTimeToText(DateTime : TDateTime) : string;  // only values from 2000-01-01
begin
  if DateTime<EncodeDate(2000,1,1) then Result:='' else Result:=DateTimeToStr(DateTime);
  end;

function GetDefaultCompatibility : TWinTaskCompatibility;
begin
  if (Win32Platform<VER_PLATFORM_WIN32_NT) then Result:=tcAT
  else begin
    if (Win32MajorVersion=5) then Result:=tcXP
    else if (Win32MajorVersion<10) then begin
      if (Win32MinorVersion=0) then Result:=tcVista
      else Result:=tcWin7
      end
    else Result:=tcWin10;
    end;
  end;

{------------------------------------------------------------------- }
destructor TWinTaskAction.Destroy;
begin
  pAction:=nil;
  inherited Destroy;
  end;

procedure TWinTaskAction.SetTaskAction(const Value: IAction);
begin
  pAction:=Value;
  FActionType:=GetActionType;
//  if length(Id)=0 then SetId('Action'+IntToStr(Index+1));
  end;

function TWinTaskAction.GetActionType : TWinTaskActionType;
begin
  case pAction.type_ of
  TASK_ACTION_COM_HANDLER: Result:=taCom;
  TASK_ACTION_SEND_EMAIL: Result:=taMail;
  TASK_ACTION_SHOW_MESSAGE: Result:=taMessage;
  else Result:= taExec; // TASK_ACTION_EXEC
    end;
  end;

function TWinTaskAction.GetActionTypeAsString : string;
begin
  Result:=LoadResString(TaskActionNames[ActionType]);
  end;

function TWinTaskAction.GetId : string;
begin
  Result:=pAction.Id;
  end;

procedure TWinTaskAction.SetId (const Value : string);
begin
  pAction.Id:=Value;
  end;

{------------------------------------------------------------------- }
function TWinTaskExecAction.GetPath : string;

  function DequotedCmdStr(const s : string; AQuote : Char) : string;
  begin
    Result:=AnsiDequotedStr(s,'"');
    if (length(Result)=0) and (length(s)>2) and (s[1]=AQuote) and (s[length(s)]=AQuote) then begin
      Result:=AnsiDequotedStr(AnsiQuotedStr(copy(s,2,length(s)-2),AQuote),AQuote);
      end;
    end;

begin
  Result:=DequotedCmdStr((pAction as IExecAction).Path,'"');
//  Result:=AnsiDequotedStr((pAction as IExecAction).Path,'"');
  end;

procedure TWinTaskExecAction.SetPath (const Value : string);
begin
  (pAction as IExecAction).Path:=Value;
  end;

function TWinTaskExecAction.GetArguments : string;
begin
  Result:=(pAction as IExecAction).Arguments;
  end;

procedure TWinTaskExecAction.SetArguments (const Value : string);
begin
  (pAction as IExecAction).Arguments:=Value;
  end;

function TWinTaskExecAction.GetWorkingDirectory : string;
begin
  Result:=(pAction as IExecAction).WorkingDirectory;
  end;

procedure TWinTaskExecAction.SetWorkingDirectory (const Value : string);
begin
  (pAction as IExecAction).WorkingDirectory:=Value;
  end;

{------------------------------------------------------------------- }
function TWinTaskComHandlerAction.GetClassId : string;
begin
  Result:=(pAction as IComHandlerAction).ClassId;
  end;

procedure TWinTaskComHandlerAction.SetClassId (const Value : string);
begin
  (pAction as IComHandlerAction).ClassId:=Value;
  end;

function TWinTaskComHandlerAction.GetData : string;
begin
  Result:=(pAction as IComHandlerAction).Data;
  end;

procedure TWinTaskComHandlerAction.SetData (const Value : string);
begin
  (pAction as IComHandlerAction).Data:=Value;
  end;

{------------------------------------------------------------------- }
function TWinTaskMailAction.GetServer : string;
begin
  Result:=(pAction as IEMailAction).Server;
  end;

function TWinTaskMailAction.GetSubject : string;
begin
  Result:=(pAction as IEMailAction).Subject;
  end;

function TWinTaskMailAction.GetTo : string;
begin
  Result:=(pAction as IEMailAction).To_;
  end;

function TWinTaskMailAction.GetCc : string;
begin
  Result:=(pAction as IEMailAction).Cc;
  end;

function TWinTaskMailAction.GetBcc : string;
begin
  Result:=(pAction as IEMailAction).Bcc;
  end;

function TWinTaskMailAction.GetReplyTo : string;
begin
  Result:=(pAction as IEMailAction).ReplyTo;
  end;

function TWinTaskMailAction.GetFrom : string;
begin
  Result:=(pAction as IEMailAction).From;
  end;

function TWinTaskMailAction.GetBody : string;
begin
  Result:=(pAction as IEMailAction).Body;
  end;

//  function TWinTaskMailAction.GetHeaderFields
//  function TWinTaskMailAction.GetAttachments

{------------------------------------------------------------------- }
function TWinTaskMessageAction.GetTitle : string;
begin
  Result:=(pAction as IShowMessageAction).Title;
  end;

procedure TWinTaskMessageAction.SetTitle (const Value : string);
begin
  (pAction as IShowMessageAction).Title:=Value;
  end;

function TWinTaskMessageAction.GetMessageBody : string;
begin
  Result:=(pAction as IShowMessageAction).MessageBody;
  end;

procedure TWinTaskMessageAction.SetMessageBody (const Value : string);
begin
  (pAction as IShowMessageAction).MessageBody:=Value;
  end;

{------------------------------------------------------------------- }
constructor TWinTaskActions.Create (ATask : TWinTask);
begin
  inherited Create(TWinTaskAction);
  FTask:=ATask;
  end;

function TWinTaskActions.GetItem(Index: Integer): TWinTaskAction;
begin
  Result:=TWinTaskAction(inherited GetItem(Index));
  end;

procedure TWinTaskActions.SetItem(Index: Integer; Value: TWinTaskAction);
begin
  inherited SetItem(Index,Value);
  end;

function TWinTaskActions.New (AActionType : TWinTaskActionType) : TWinTaskAction ;
begin
  Result:=TWinTaskAction(Add);
  Result.SetTaskAction(FTask.pDefinition.Actions.Create(ActionTypes[AActionType]));
  end;

function TWinTaskActions.Add (AAction : IAction) : TWinTaskAction ;
begin
  Result:=TWinTaskAction(Add);
  Result.SetTaskAction(AAction);
  end;

procedure TWinTaskActions.ClearAll;
begin
  FTask.pDefinition.Actions.Clear;
  Clear;
  end;

procedure TWinTaskActions.Remove (AIndex : integer);
begin
  FTask.pDefinition.Actions.Remove(AIndex);
  Delete(AIndex);
  end;

{------------------------------------------------------------------- }
constructor TWinTaskTrigger.Create (Collection: TCollection);
begin
  inherited Create(Collection);
  FTimeZone:=false; FTimeOffset:=0;
  end;

destructor TWinTaskTrigger.Destroy;
begin
  pTrigger:=nil;
  inherited Destroy;
  end;

procedure TWinTaskTrigger.SetToDefault(const AUserId : string);
begin
  StartTime:=Now;
  SetLogonUserId(AUserId); // required for ttLogon
//  EndTime:=Now+DaysInAYear(YearOf(Now));
//  Interval:=SecsPerHour;
//  Duration:=SecsPerDay;
//  ExecutionTimeLimit:=3*SecsPerDay;
//  case TriggerType of
//  ttDaily : begin
//            RandomDelay:=SecsPerHour;
//            end;
//    end;
  end;

procedure TWinTaskTrigger.SetTaskTrigger(const Value : ITrigger);
begin
  pTrigger:=Value;
  FTriggerType:=GetTriggerType;
//  if length(Id)=0 then SetId('Trigger'+IntToStr(Index+1));
  FTimeZone:=BoundaryToTimeInfo(pTrigger.StartBoundary).TimeZone;
  end;

function TWinTaskTrigger.TimeStringToSeconds (TimeString : string) : cardinal;
var
  n : word;
begin
  Result:=0;
  if AnsiStartsText('P',TimeString) then begin
    Delete(TimeString,1,1);
    if AnsiStartsText('T',TimeString) then begin  // time
      repeat
        n:=ReadNextValue(TimeString);
        if AnsiStartsText('H',TimeString) then Result:=Result+SecsPerHour*n;
        if AnsiStartsText('M',TimeString) then Result:=Result+SecsPerMin*n;
        if AnsiStartsText('S',TimeString) then Result:=Result+n;
        if length(TimeString)>0 then delete(TimeString,1,1);
        until length(TimeString)=0;
      end
    else begin // days
      n:=ReadNextValue(TimeString);
      if AnsiStartsText('D',TimeString) then Result:=Result+SecsPerDay*n;
      end;
    end
  end;

function TWinTaskTrigger.SecondsToTimeString (Seconds : cardinal) : string;
var
  h,m,s : word;
begin
  if Seconds=0 then Result:=''
  else if Seconds>=SecsPerDay then Result:='P'+IntToStr(Seconds div SecsPerDay)+'D'
  else begin
    Result:='PT';
    DivMod(Seconds ,SecsPerHour,h,m); DivMod(m,SecsPerMin,m,s);
    if h>0 then Result:=Result+IntToStr(h)+'H';
    if m>0 then Result:=Result+IntToStr(m)+'M';
    if s>0 then Result:=Result+IntToStr(s)+'S';
    end;
  end;

function TWinTaskTrigger.GetDaysOfWeek : integer;
begin
  if FTriggerType=ttWeekly then Result:=IWeeklyTrigger(pTrigger).DaysOfWeek
  else if FTriggerType=ttMonthlyDow then Result:=IMonthlyDowTrigger(pTrigger).DaysOfWeek
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetDaysOfWeek (Value : integer);
begin
  if (Value>0) and (Value<$80) then begin
    if FTriggerType=ttWeekly then IWeeklyTrigger(pTrigger).DaysOfWeek:=Value
    else if FTriggerType=ttMonthlyDow then IMonthlyDowTrigger(pTrigger).DaysOfWeek:=Value;
    end;
  end;

function TWinTaskTrigger.GetWeeksInterval : integer;
begin
  if FTriggerType=ttWeekly then Result:=IWeeklyTrigger(pTrigger).WeeksInterval
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetWeeksInterval (Value : integer);
begin
  if (Value>0) and (FTriggerType=ttWeekly) then IWeeklyTrigger(pTrigger).WeeksInterval:=Value;
  end;

function TWinTaskTrigger.GetWeeksOfMonth : integer;
begin
  if FTriggerType=ttMonthlyDow then begin
// Note: Get_WeeksOfMonth does not return $10 (16) for last week in month
//       use Get_RunOnLastWeekOfMonth instead as workaround
    Result:=IMonthlyDowTrigger(pTrigger).WeeksOfMonth ;
    if RunOnLastWeekOfMonth then Result:=Result or $10;
    end
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetWeeksOfMonth (Value : integer);
begin
  if (Value>0) and (Value<$20) and (FTriggerType=ttMonthlyDow) then
// Note: Set_WeeksOfMonth can handle $10 (16) for last week in month
    IMonthlyDowTrigger(pTrigger).WeeksOfMonth:=Value;
  end;

function TWinTaskTrigger.GetDaysOfMonth : integer;
begin
  if FTriggerType=ttMonthly then Result:=IMonthlyTrigger(pTrigger).DaysOfMonth
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetDaysOfMonth (Value : integer);
begin
  if (Value>0) and (FTriggerType=ttMonthly) then IMonthlyTrigger(pTrigger).DaysOfMonth:=Value;
  end;

function TWinTaskTrigger.GetMonthsOfYear : integer;
begin
  if FTriggerType=ttMonthly then Result:=IMonthlyTrigger(pTrigger).MonthsOfYear
  else if FTriggerType=ttMonthlyDow then Result:=IMonthlyDowTrigger(pTrigger).MonthsOfYear
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetMonthsOfYear (Value : integer);
begin
  if (Value>0) and (Value<$1000) then begin
    if FTriggerType=ttMonthly then IMonthlyTrigger(pTrigger).MonthsOfYear:=Value
    else if FTriggerType=ttMonthlyDow then IMonthlyDowTrigger(pTrigger).MonthsOfYear:=Value;
    end;
  end;

function TWinTaskTrigger.GetRunOnLastDayOfMonth : boolean;
begin
  if FTriggerType=ttMonthly then Result:=IMonthlyTrigger(pTrigger).RunOnLastDayOfMonth
  else Result:=false;
  end;

procedure TWinTaskTrigger.SetRunOnLastDayOfMonth (Value : boolean);
begin
  if FTriggerType=ttMonthly then IMonthlyTrigger(pTrigger).RunOnLastDayOfMonth:=Value;
  end;

function TWinTaskTrigger.GetRunOnLastWeekOfMonth : boolean;
begin
  if FTriggerType=ttMonthlyDow then Result:=IMonthlyDowTrigger(pTrigger).RunOnLastWeekOfMonth
  else Result:=false;
  end;

procedure TWinTaskTrigger.SetRunOnLastWeekOfMonth (Value : boolean);
begin
  if FTriggerType=ttMonthlyDow then IMonthlyDowTrigger(pTrigger).RunOnLastWeekOfMonth:=Value
  end;

function TWinTaskTrigger.GetRandomDelay : cardinal;             // time in seconds
begin
  case FTriggerType of
  ttTime   : Result:=TimeStringToSeconds(ITimeTrigger(pTrigger).RandomDelay);
  ttDaily  : Result:=TimeStringToSeconds(IDailyTrigger(pTrigger).RandomDelay);
  ttWeekly : Result:=TimeStringToSeconds(IWeeklyTrigger(pTrigger).RandomDelay);
  ttMonthly: Result:=TimeStringToSeconds(IMonthlyTrigger(pTrigger).RandomDelay);
  ttMonthlyDow: Result:=TimeStringToSeconds(IMonthlyDowTrigger(pTrigger).RandomDelay);
    else Result:=0;
    end;
  end;

procedure TWinTaskTrigger.SetRandomDelay (Value : cardinal);
var
  st : string;
begin
  st:=SecondsToTimeString(Value);
  case FTriggerType of
  ttTime   : ITimeTrigger(pTrigger).RandomDelay:=st;
  ttDaily  : IDailyTrigger(pTrigger).RandomDelay:=st;
  ttWeekly : IWeeklyTrigger(pTrigger).RandomDelay:=st;
  ttMonthly: IMonthlyTrigger(pTrigger).RandomDelay:=st;
  ttMonthlyDow: IMonthlyDowTrigger(pTrigger).RandomDelay:=st;
    end;
  end;

function TWinTaskTrigger.GetDaysInterval : SmallInt;
begin
  if FTriggerType=ttDaily then Result:=IDailyTrigger(pTrigger).DaysInterval
  else Result:=0;
  end;

procedure TWinTaskTrigger.SetDaysInterval (Value : SmallInt);
begin
  if (Value>0) and (FTriggerType=ttDaily) then IDailyTrigger(pTrigger).DaysInterval:=Value;
  end;

function TWinTaskTrigger.GetDelay : cardinal;               // time in seconds
begin
  case FTriggerType of
  ttBoot  : Result:=TimeStringToSeconds(IBootTrigger(pTrigger).Delay);
  ttLogon : Result:=TimeStringToSeconds(ILogonTrigger(pTrigger).Delay);
  ttEvent : Result:=TimeStringToSeconds(IEventTrigger(pTrigger).Delay);
    else Result:=0;
    end;
  end;

procedure TWinTaskTrigger.SetDelay (Value : cardinal);
var
  st : string;
begin
  st:=SecondsToTimeString(Value);
  case FTriggerType of
  ttBoot  : IBootTrigger(pTrigger).Delay:=st;
  ttLogon : ILogonTrigger(pTrigger).Delay:=st;
  ttEvent : IEventTrigger(pTrigger).Delay:=st;
    end;
  end;

function TWinTaskTrigger.GetDuration : cardinal;            // time in seconds
begin
  Result:=TimeStringToSeconds(pTrigger.Repetition.Duration);
  end;

procedure TWinTaskTrigger.SetDuration (Value : cardinal);
begin
  pTrigger.Repetition.Duration:=SecondsToTimeString(Value);
  end;

function TWinTaskTrigger.GetInterval: cardinal;             // time in seconds
begin
  Result:=TimeStringToSeconds(pTrigger.Repetition.Interval);
  end;

procedure TWinTaskTrigger.SetInterval(Value : cardinal);
begin
  pTrigger.Repetition.Interval:=SecondsToTimeString(Value);
  end;

function TWinTaskTrigger.GetStopAtDurationEnd : boolean;
begin
  Result:=pTrigger.Repetition.StopAtDurationEnd;
  end;

procedure TWinTaskTrigger.SetStopAtDurationEnd (Value : boolean);
begin
  pTrigger.Repetition.StopAtDurationEnd:=Value;
  end;

function TWinTaskTrigger.GetExecutionTimeLimit : cardinal;  // time in seconds
begin
  Result:=TimeStringToSeconds(pTrigger.ExecutionTimeLimit);
  end;

procedure TWinTaskTrigger.SetExecutionTimeLimit (Value : cardinal);
begin
  pTrigger.ExecutionTimeLimit:=SecondsToTimeString(Value);
  end;

function TWinTaskTrigger.GetEndTime : TDateTime;
begin
  Result:=BoundaryToDateTime(pTrigger.EndBoundary);
  end;

procedure TWinTaskTrigger.SetEndTime (Value : TDateTime);
begin
  pTrigger.EndBoundary:=DateTimeToBoundary(Value,FTimeZone);
  end;

function TWinTaskTrigger.GetEnabled : boolean;
begin
  Result:=pTrigger.Enabled;
  end;

procedure TWinTaskTrigger.SetEnabled (Value : boolean);
begin
  pTrigger.Enabled:=Value;
  end;

function TWinTaskTrigger.GetId : string;
begin
  Result:=pTrigger.Id;
  end;

procedure TWinTaskTrigger.SetId (const Value : string);
begin
  pTrigger.Id:=Value;
  end;

function TWinTaskTrigger.GetStartTime : TDateTime;
begin
  Result:=BoundaryToDateTime(pTrigger.StartBoundary);
  end;

procedure TWinTaskTrigger.SetStartTime (Value : TDateTime);
begin
  pTrigger.StartBoundary:=DateTimeToBoundary(Value,FTimeZone);
  end;

function TWinTaskTrigger.GetLogonUserId : string;
begin
  if FTriggerType=ttLogon then Result:=ILogonTrigger(pTrigger).UserId
  else Result:='';
  end;

procedure TWinTaskTrigger.SetLogonUserId (const Value : string);
begin
  if FTriggerType=ttLogon then ILogonTrigger(pTrigger).UserId:=Value;
  end;

function TWinTaskTrigger.GetSubscription : string;
begin
  if FTriggerType=ttEvent then Result:=IEventTrigger(pTrigger).Subscription
  else Result:='';
  end;

procedure TWinTaskTrigger.SetSubscription (const Value : string);
begin
  if FTriggerType=ttEvent then IEventTrigger(pTrigger).Subscription:=Value;
  end;

function TWinTaskTrigger.GetTriggerType : TWinTaskTriggerType;
begin
  case pTrigger.Type_ of
  TASK_TRIGGER_EVENT: Result:=ttEvent;
  TASK_TRIGGER_TIME: Result:=ttTime;
  TASK_TRIGGER_DAILY: Result:=ttDaily;
  TASK_TRIGGER_WEEKLY: Result:=ttWeekly;
  TASK_TRIGGER_MONTHLY: Result:=ttMonthly;
  TASK_TRIGGER_MONTHLYDOW: Result:=ttMonthlyDow;
  TASK_TRIGGER_IDLE: Result:=ttIdle;
  TASK_TRIGGER_REGISTRATION: Result:=ttRegistration;
  TASK_TRIGGER_BOOT: Result:=ttBoot;
  TASK_TRIGGER_LOGON: Result:=ttLogon;
  TASK_TRIGGER_SESSION_STATE_CHANGE: Result:=ttSessionStateChange;
  else Result:=ttCustom; //TASK_TRIGGER_CUSTOM_TRIGGER_01
    end;
  end;

function TWinTaskTrigger.GetTriggerTypeAsString : string;
begin
  Result:=LoadResString(TaskTriggerDescriptions[TriggerType]);
  end;

function TWinTaskTrigger.GetTriggerString : String;
var
  dt,dd : TDateTime;
  nr,nd : cardinal;

  function GetWeekdayList (Days : integer) : string;
  var
    i : integer;
  begin
    Result:='';
    for i:=1 to 7 do begin
      if Days and 1<>0 then begin
        if length(Result)>0 then Result:=Result+', ';
        Result:=Result+FormatSettings.LongDayNames[i];
        end;
      Days:=Days shr 1;
      end;
    end;

  function WeeksOfMonthList (Weeks : integer) : string;
  var
    i : integer;
  begin
    Result:='';
    for i:=1 to 5 do begin
      if Weeks and 1<>0 then begin
        if length(Result)>0 then Result:=Result+', ';
        Result:=Result+LoadResString(TaskWeeksOfMonthList[i]);
        end;
      Weeks:=Weeks shr 1;
      end;
    end;

  function GetMonthDayList (Days : integer) : string;
  var
    i : integer;
  begin
    Result:='';
    for i:=1 to 32 do begin
      if Days and 1<>0 then begin
        if length(Result)>0 then Result:=Result+', ';
        if i=32 then Result:=Result+rsTrgLast
        else Result:=Result+IntToStr(i);
        end;
      Days:=Days shr 1;
      end;
    end;

  function GetMonthList (Months : integer) : string;
  var
    i : integer;
  begin
    Result:='';
    for i:=1 to 12 do begin
      if Months and 1<>0 then begin
        if length(Result)>0 then Result:=Result+', ';
        Result:=Result+FormatSettings.LongMonthNames[i];
        end;
      Months:=Months shr 1;
      end;
    end;

  function FormatSecondsToTimeString (Seconds : cardinal) : string;
  var
    h,m,s : word;
  begin
    if Seconds>=SecsPerDay then Result:=GetUnitNumber(rsTrgEveryDay,rsTrgEveryDays,Seconds div SecsPerDay)
    else begin
      DivMod(Seconds ,SecsPerHour,h,m); DivMod(m,SecsPerMin,m,s);
      if h>0 then Result:=GetUnitNumber(rsTrgEveryHour,rsTrgEveryHours,h)
      else if m>0 then Result:=GetUnitNumber(rsTrgEveryMin,rsTrgEveryMins,m)
      else Result:=GetUnitNumber(rsTrgEverySec,rsTrgEverySecs,s);
      end;
    end;

    function TimeToStr (dt : TDateTime) : string;  // replacement for routine from sysutils
    begin
      Result:=FormatDateTime('hh:nn',dt);
      end;

begin
  dt:=BoundaryToDateTime(pTrigger.StartBoundary);    // 2016-12-19T16:55:00
  dd:=DateOf(dt); dt:=TimeOf(dt);
  case pTrigger.Type_ of
//    TASK_TRIGGER_EVENT:
  TASK_TRIGGER_TIME: Result:=TryFormat(rsTrgOnce,[TimeToStr(dt),DateToStr(dd)]);
  TASK_TRIGGER_DAILY: with pTrigger as IDailyTrigger do begin
      if DaysInterval>1 then begin
        Result:=TryFormat(rsTrgRDailyAt,[TimeToStr(dt),DaysInterval]);
        if length(Repetition.Interval)>0 then begin
          nr:=TimeStringToSeconds(Repetition.Interval);
          nd:=TimeStringToSeconds(Repetition.Duration);
          Result:=Result+TryFormat(rsTrgRepeat,[FormatSecondsToTimeString(nr),FormatSecondsToTimeString(nd)]);
          end;
        end
      else Result:=TryFormat(rsTrgDailyAt,[TimeToStr(dt)]);
      end;
  TASK_TRIGGER_WEEKLY: with pTrigger as IWeeklyTrigger do begin
      if WeeksInterval>1 then
        Result:=TryFormat(rsTrgRWeekly,[TimeToStr(dt),GetWeekdayList(DaysOfWeek),WeeksInterval,DateToStr(dd)])
      else Result:=TryFormat(rsTrgWeekly,[TimeToStr(dt),GetWeekdayList(DaysOfWeek),DateToStr(dd)]);  // Result:=TryFormat(,[])
      end;
  TASK_TRIGGER_MONTHLY: with pTrigger as IMonthlyTrigger do begin
      Result:=TryFormat(rsTrgMonthly,[TimeToStr(dt),GetMonthDayList(DaysOfMonth),
        GetMonthList(MonthsOfYear),DateToStr(dd)])
      end;
  TASK_TRIGGER_MONTHLYDOW: with pTrigger as IMonthlyDOWTrigger do begin
      Result:=TryFormat(rsTrgDMonthly,[WeeksOfMonthList(GetWeeksOfMonth),GetWeekdayList(DaysOfWeek),
        GetMonthList(MonthsOfYear),DateToStr(dd)])
      end;
  TASK_TRIGGER_IDLE: Result:=rsTrgIdle;
  TASK_TRIGGER_REGISTRATION: Result:=rsTrgRegistration;
  TASK_TRIGGER_BOOT: begin
      Result:=rsTrgStartup;
      if StartTime>=1 then Result:=Result+TryFormat(rsTrgEventTime,[TimeToStr(dt),DateToStr(dd)]);
      end;
  TASK_TRIGGER_LOGON: begin
      if length(LogonUserId)=0 then Result:=rsTrgAnyLogon
      else Result:=TryFormat(rsTrgLogon,[LogonUserId]);
      if StartTime>=1 then Result:=Result+TryFormat(rsTrgEventTime,[TimeToStr(dt),DateToStr(dd)]);
      end;
  TASK_TRIGGER_EVENT : begin
      Result:=rsTrgEvent;
      if StartTime>=1 then Result:=Result+TryFormat(rsTrgEventTime,[TimeToStr(dt),DateToStr(dd)]);
      end;
//    TASK_TRIGGER_SESSION_STATE_CHANGE = $0000000B;
//    TASK_TRIGGER_CUSTOM_: '+TRIGGER_01 = $0000000C;
  else Result:=rsTrgUnknown;
    end;
  end;

{------------------------------------------------------------------- }
constructor TWinTaskTriggers.Create (ATask : TWinTask);
begin
  inherited Create(TWinTaskTrigger);
  FTask:=ATask;
  end;

function TWinTaskTriggers.GetItem(Index: Integer): TWinTaskTrigger;
begin
  Result:=TWinTaskTrigger(inherited GetItem(Index));
  end;

procedure TWinTaskTriggers.SetItem(Index: Integer; Value: TWinTaskTrigger);
begin
  inherited SetItem(Index,Value);
  end;

function TWinTaskTriggers.New (ATriggerType : TWinTaskTriggerType) : TWinTaskTrigger;
begin
  Result:=TWinTaskTrigger(Add);
  Result.SetTaskTrigger(FTask.pDefinition.Triggers.Create(TriggerTypes[ATriggerType]));
  end;

function TWinTaskTriggers.Add (ATrigger: ITrigger): TWinTaskTrigger;
begin
  Result:=TWinTaskTrigger(Add);
  Result.SetTaskTrigger(ATrigger);
  end;

procedure TWinTaskTriggers.ClearAll;
begin
  FTask.pDefinition.Triggers.Clear;
  Clear;
  end;
procedure TWinTaskTriggers.Remove (AIndex : integer);
begin
  FTask.pDefinition.Triggers.Remove(AIndex+1);
  Delete(AIndex);
  end;

{------------------------------------------------------------------- }
constructor TWinTask.Create(const ADefinition : ITaskDefinition);
begin
  inherited Create;
  pDefinition:=ADefinition;
  FData:=TMemoryStream.Create;
  FActions:=TWinTaskActions.Create(Self);
  FTriggers:=TWinTaskTriggers.Create(Self);
  FSelectedAction:=-1;
  end;

destructor TWinTask.Destroy;
begin
  FreeAndNil(FTriggers); FreeAndNil(FActions); FreeAndNil(FData);
  pDefinition:=nil;
  inherited Destroy;
  end;

function TWinTask.GetAuthor : string;
begin
  Result:=pDefinition.RegistrationInfo.Author;
  end;

procedure TWinTask.SetAuthor (const Value : string);
begin
  pDefinition.RegistrationInfo.Author:=Value;
  end;

function TWinTask.GetData : string;
begin
  Result:=pDefinition.Data;
  end;

procedure TWinTask.SetData (const Value : string);
begin
  pDefinition.Data:=Value;
  end;

function TWinTask.GetDate : TDateTime;
begin
  Result:=BoundaryToDateTime(pDefinition.RegistrationInfo.Date);
  end;

function TWinTask.GetDateAsString : string;
begin
  Result:=DateTimeToText(GetDate);
  end;

procedure TWinTask.SetDate (Value : TDateTime);
begin
  pDefinition.RegistrationInfo.Date:=DateTimeToBoundary(Value,false);
  end;

function TWinTask.GetDescription : string;
begin
  Result:=pDefinition.RegistrationInfo.Description;
  end;

procedure TWinTask.SetDescription (const Value : string);
begin
  pDefinition.RegistrationInfo.Description:=Value;
  end;

function TWinTask.GetDocumentation : string;
begin
  Result:=pDefinition.RegistrationInfo.Documentation;
  end;

procedure TWinTask.SetDocumentation (const Value : string);
begin
  pDefinition.RegistrationInfo.Documentation:=Value;
  end;

function TWinTask.GetDisplayName : string;
begin
  Result:=pDefinition.Principal.DisplayName;
  end;

procedure TWinTask.SetDisplayName (const Value : string);
begin
  pDefinition.Principal.DisplayName:=Value;
  end;

function TWinTask.GetGroupId : string;
begin
  Result:=pDefinition.Principal.GroupId;
  end;

procedure TWinTask.SetGroupId (const Value : string);
begin
  pDefinition.Principal.GroupId:=Value;
  end;

function TWinTask.GetId : string;
begin
  Result:=pDefinition.Principal.Id;
  end;

procedure TWinTask.SetId (const Value : string);
begin
  pDefinition.Principal.Id:=Value;
  end;

function TWinTask.GetUserId : string;
begin
  Result:=pDefinition.Principal.UserId;
  end;

procedure TWinTask.SetUserId (const Value : string);
begin
  pDefinition.Principal.UserId:=Value;
  end;

function TWinTask.GetLogonType : TLogonType;
begin
  case pDefinition.Principal.LogonType of
  TASK_LOGON_NONE : Result:=ltNone;
  TASK_LOGON_PASSWORD : Result:=ltPassword;
  TASK_LOGON_S4U  : Result:=ltS4U;
  TASK_LOGON_INTERACTIVE_TOKEN : Result:=ltToken;
  TASK_LOGON_GROUP  : Result:=ltGroup;
  TASK_LOGON_SERVICE_ACCOUNT  : Result:=ltService;
  TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD  : Result:=ltTokenPassword;
    end;
  end;

procedure TWinTask.SetLogonType (Value : TLogonType);
begin
  pDefinition.Principal.LogonType:=TaskFlags[Value];
  end;

function TWinTask.GetRunLevel : boolean;
begin
  Result:=pDefinition.Principal.RunLevel=TASK_RUNLEVEL_HIGHEST;
  end;

procedure TWinTask.SetRunLevel (Value : boolean);
begin
  with pDefinition.Principal do if Value then RunLevel:=TASK_RUNLEVEL_HIGHEST
  else RunLevel:=TASK_RUNLEVEL_LUA;
  end;

function TWinTask.GetCompatibility : TWinTaskCompatibility;
begin
  case pDefinition.Settings.Compatibility of
  TASK_COMPATIBILITY_AT: Result:=tcAT;
  TASK_COMPATIBILITY_V1: Result:=tcXP;
  TASK_COMPATIBILITY_V2: Result:=tcVista;    // default value for new task
  TASK_COMPATIBILITY_V2_1: Result:=tcWin7;
  else Result:=tcWin10;
    end;
  end;

procedure TWinTask.SetCompatibility (Value : TWinTaskCompatibility);
begin
  pDefinition.Settings.Compatibility:=Compatibilities[Value];
  end;

function TWinTask.GetCompatibilityAsString : string;
begin
  Result:=LoadResString(CompatibilityNames[GetCompatibility]);
  end;

function TWinTask.GetRunIfMissed : boolean;
begin
  Result:=pDefinition.Settings.StartWhenAvailable;
  end;

procedure TWinTask.SetRunIfMissed (Value : boolean);
begin
  pDefinition.Settings.StartWhenAvailable:=Value;
  end;

function TWinTask.GetRunOnlyIfNetwork : boolean;
begin
  Result:=pDefinition.Settings.RunOnlyIfNetworkAvailable;
  end;

procedure TWinTask.SetRunOnlyIfNetwork (Value : boolean);
begin
  pDefinition.Settings.RunOnlyIfNetworkAvailable:=Value;
  end;

function TWinTask.GetHidden : boolean;
begin
  Result:=pDefinition.Settings.Hidden;
  end;

procedure TWinTask.SetHidden (Value : boolean);
begin
  pDefinition.Settings.Hidden:=Value;
  end;

function TWinTask.GetDisallowOnBatteries : boolean;
begin
  Result:=pDefinition.Settings.DisallowStartIfOnBatteries;
  end;

procedure TWinTask.SetDisallowOnBatteries (Value : boolean);
begin
  pDefinition.Settings.DisallowStartIfOnBatteries:=Value;
  end;

function TWinTask.GetStopOnBatteries : boolean;
begin
  Result:=pDefinition.Settings.StopIfGoingOnBatteries;
  end;

procedure TWinTask.SetStopOnBatteries (Value : boolean);
begin
  pDefinition.Settings.StopIfGoingOnBatteries:=Value;
  end;

function TWinTask.GetPriority : TThreadPriority;
begin
  case pDefinition.Settings.Priority of
  0 : Result:=tpTimeCritical;
  1 : Result:=tpHighest;
  2,3 : Result:=tpHigher;
  7,8 : Result:=tpLower;
  9  : Result:=tpLowest;
  10 : Result:=tpIdle;
  else Result:=tpNormal;
    end;
  end;

procedure TWinTask.SetPriority (Value : TThreadPriority);
begin
  pDefinition.Settings.Priority:=Priorities[Value];
  end;

function TWinTask.GetWakeToRun : boolean;
begin
  Result:=pDefinition.Settings.WakeToRun;
  end;

procedure TWinTask.SetWakeToRun (Value : boolean);
begin
  pDefinition.Settings.WakeToRun:=Value;
  end;

function TWinTask.GetAction(Index: Integer) : TWinTaskAction;
begin
  Result:=TWinTaskAction(FActions.Items[Index]);
  end;

function TWinTask.GetActionCount : Integer;
begin
  Result:=FActions.Count;
  end;

function TWinTask.GetTrigger(Index: Integer) : TWinTaskTrigger;
begin
  Result:=TWinTaskTrigger(FTriggers.Items[Index]);
  end;

function TWinTask.GetTriggerCount : Integer;
begin
  Result:=FTriggers.Count;
  end;

function TWinTask.NewAction (AActionType : TWinTaskActionType) : TWinTaskAction;
begin
  Result:=FActions.New(AActionType);
  FSelectedAction:=Result.Index;
  end;

function TWinTask.DeleteAction (AIndex : integer) : boolean;
begin
  Result:=true;
  if (AIndex>=0) and (AIndex<ActionCount) then begin
    try
      FActions.Remove(AIndex);
    except
      Result:=false;
      end;
    end;
  end;

function TWinTask.NewTrigger (ATriggerType : TWinTaskTriggerType) : TWinTaskTrigger;
begin
  Result:=FTriggers.New(ATriggerType);
  Result.SetToDefault(UserId);
  end;

function TWinTask.DeleteTrigger (AIndex : integer) : boolean;
begin
  Result:=true;
  if (AIndex>=0) and (AIndex<TriggerCount) then begin
    try
      FTriggers.Remove(AIndex);
    except
      Result:=false;
      end;
    end;
  end;

procedure TWinTask.Refresh;
var
  i : word;
begin
  FTriggers.Clear; FActions.Clear;
  with pDefinition.Triggers do for i:=1 to Count do
    FTriggers.Add(Item[i]);
  with pDefinition.Actions do for i:=1 to Count do
    FActions.Add(Item[i]);
  end;

function TWinTask.IndexOfApp (const AppFilter : string) : integer;
begin
  for Result:=0 to ActionCount-1 do if (Actions[Result].ActionType=taExec) and
      AnsiEndsText(AppFilter,TWinTaskExecAction(Actions[Result]).ApplicationPath) then Break;
  if Result>=ActionCount then Result:=-1;
  FSelectedAction:=Result;
  end;

function TWinTask.IndexOfNextExecAction (FromIndex : integer) : integer;
begin
  for Result:=FromIndex to ActionCount-1 do if Actions[Result].ActionType=taExec then Break;
  if Result>=ActionCount then Result:=-1;
  FSelectedAction:=Result;
  end;


{------------------------------------------------------------------- }
constructor TWinTaskSubfolder.Create (const ATaskFolder : ITaskFolder);

begin
  inherited Create;
  pTaskFolder:=ATaskFolder;
  end;

destructor TWinTaskSubfolder.Destroy;
begin
  pTaskFolder:=nil;
  inherited Destroy;
  end;

function TWinTaskSubfolder.GetName : string;
begin
  Result:=pTaskFolder.Name;
  end;

function TWinTaskSubfolder.GetPath : string;
begin
  Result:=pTaskFolder.Path;
  end;

{------------------------------------------------------------------- }
constructor TWinRegisteredTask.Create(const ARegisteredTask : IRegisteredTask);
begin
  inherited Create;
  pRegisteredTask:=ARegisteredTask;
  FIndex:=-1; FTaskName:=pRegisteredTask.Name;
  FTask:=TWinTask.Create(pRegisteredTask.Definition);
  FTask.Refresh;
  end;

destructor TWinRegisteredTask.Destroy;
begin
  pRegisteredTask:=nil;
  FreeAndNil(FTask);
  inherited Destroy;
  end;

procedure TWinRegisteredTask.Refresh;
begin
  FTask.Refresh;
  end;

procedure TWinRegisteredTask.Run;
begin
  pRegisteredTask.Run(VT_EMPTY)
  end;

procedure TWinRegisteredTask.Stop;
begin
  pRegisteredTask.Stop(0);
  end;

function TWinRegisteredTask.GetTaskResult : integer;
begin
  Result:=pRegisteredTask.LastTaskResult;
  end;

function TWinRegisteredTask.GetLastRunTime : TDateTime;
begin
  Result:=pRegisteredTask.LastRunTime;
  end;

function TWinRegisteredTask.GetLastRunTimeAsString : string;
begin
  Result:=DateTimeToText(LastRunTime);
  end;

function TWinRegisteredTask.GetNextRunTime : TDateTime;
begin
  Result:=pRegisteredTask.NextRunTime;
  end;

function TWinRegisteredTask.GetNextRunTimeAsString : string;
begin
  Result:=DateTimeToText(NextRunTime);
  end;

function TWinRegisteredTask.GetNumberOfMissedRuns : integer;
begin
  Result:=pRegisteredTask.NumberOfMissedRuns;
  end;

function TWinRegisteredTask.GetPath : string;
begin
  Result:=AnsiDequotedStr(pRegisteredTask.Path,'"');
  end;

function TWinRegisteredTask.GetEnabled : boolean;
begin
  Result:=pRegisteredTask.Enabled;
  end;

procedure TWinRegisteredTask.SetEnabled (Value : boolean);
begin
  pRegisteredTask.Enabled:=Value;
  end;

function TWinRegisteredTask.GetStatus : TWinTaskStatus;
begin
  case pRegisteredTask.State of
  TASK_STATE_DISABLED: Result:=tsDisabled;
  TASK_STATE_QUEUED: Result:=tsQueued;
  TASK_STATE_READY: Result:=tsReady;
  TASK_STATE_RUNNING: Result:=tsRunning;
  else Result:=tsUnknown;
    end;
  end;

function TWinRegisteredTask.GetStatusAsString : string;
begin
  Result:=LoadResString(TaskStateNames[Status]);
  end;

function TWinRegisteredTask.IndexOfApp (const AppFilter : string) : integer;
begin
  Result:=FTask.IndexOfApp(AppFilter);
  end;

{------------------------------------------------------------------- }
constructor TWinTaskFolder.Create (ARootFolder : ITaskFolder);
begin
  inherited Create;
  FTasks:=TWinTaskList.Create;
  FFolders:=TWinTaskFolderList.Create;
  pRootFolder:=ARootFolder;
  FErrMsg:=''; FErrorCode:=ERROR_SUCCESS;
  end;

destructor TWinTaskFolder.Destroy;
begin
  FreeAndNil(FTasks); FreeAndNil(FFolders);
  pTaskCollection:=nil;
  pRootFolder:=nil;
  inherited Destroy;
  end;

function TWinTaskFolder.GetName : string;
begin
  Result:=pRootFolder.Name;
  if Result='\' then Result:='';
  end;

function TWinTaskFolder.GetPath : string;
begin
  Result:=pRootFolder.Path;
  end;

function TWinTaskFolder.GetTask (Index : Integer) : TWinRegisteredTask;
begin
  Result:=TWinRegisteredTask(FTasks.Items[Index]);
  end;

function TWinTaskFolder.GetFolder(Index : Integer): TWinTaskSubfolder;
begin
  Result:=TWinTaskSubfolder(FFolders.Items[Index]);
  end;

function TWinTaskFolder.Refresh : HResult;
var
  i : integer;
  ARegTask : TWinRegisteredTask;
  ATaskFolder : TWinTaskSubfolder;
begin
  try
    //  Get the registered tasks in the folder.
    pTaskCollection:=pRootFolder.GetTasks(0);      // TASK_ENUM_HIDDEN
    FNumTasks:=pTaskCollection.Count;
    FTasks.Clear;
    for i:=1 to FNumTasks do begin
      ARegTask:=TWinRegisteredTask.Create(pTaskCollection.Item[i]);
      ARegTask.Refresh;
      ARegTask.TaskIndex:=FTasks.Add(ARegTask);
      end;
    //  Get the registered tasks in the folder.
    pTaskFolderCollection:=pRootFolder.GetFolders(0);
    FNumFolders:=pTaskFolderCollection.Count;
    FFolders.Clear;
    for i:=1 to FNumFolders do begin
      ATaskFolder:=TWinTaskSubfolder.Create(pTaskFolderCollection.Item[i]);
      FFolders.Add(ATaskFolder);
      end;
    FErrorCode:=ERROR_SUCCESS;
  except
    on E:EOleSysError do with E do begin
      FErrMsg:=Message; FErrorCode:= ErrorCode;
      end;
    end;
  Result:=FErrorCode;
  end;

function TWinTaskFolder.IndexOfFolder (const FolderName: String): integer;
begin
  for Result:=0 to FolderCount-1 do
    if AnsiSameText(Folders[Result].Name,FolderName) then Exit;
  Result:=-1;
  end;

function TWinTaskFolder.CreateFolder (const AName : string) : integer;
begin
  FErrMsg:=''; FErrorCode:=ERROR_SUCCESS;
  try
    pRootFolder.CreateFolder(AName,'');
    if succeeded(Refresh) then Result:=IndexOfFolder(AName)
    else Result:=-1;
  except
    on E:EOleSysError do with E do begin
      FErrMsg:=Message; FErrorCode:= ErrorCode; Result:=-1;
      end;
    end;
  end;

function TWinTaskFolder.DeleteFolder (const AName : string) : boolean;
begin
  FErrMsg:=''; FErrorCode:=ERROR_SUCCESS;
  try
    pRootFolder.DeleteFolder(AName,0);
    Result:=succeeded(Refresh);
  except
    on E:EOleSysError do with E do begin
      FErrMsg:=Message; FErrorCode:= ErrorCode; Result:=false;
      end;
    end;
  end;

function TWinTaskFolder.IndexOfTask(const TaskName: string): integer;
begin
  for Result:=0 to TaskCount-1 do
    if AnsiSameText(Tasks[Result].TaskName,TaskName) then Exit;
  Result:=-1;
  end;

function TWinTaskFolder.DeleteTask (const TaskName: string) : boolean;
begin
  FErrMsg:=''; FErrorCode:=ERROR_SUCCESS;
  try
    pRootFolder.DeleteTask(TaskName,0);
    Result:=succeeded(Refresh);
  except
    on E:EOleSysError do with E do begin
      FErrMsg:=Message; FErrorCode:= ErrorCode; Result:=false;
      end;
    end;
  end;

// Result >=0: Index of new task
//         <0: Error - check ErrorCode and ErrorMessage
function TWinTaskFolder.RegisterTask (const TaskName : string; ATask : TWinTask;
                                      Username,Password : string) : integer;
var
  pRegisteredTask : IRegisteredTask;
begin
  Result:=-1; FErrMsg:=''; FErrorCode:=NO_ERROR;
  if ATask.LogonType=ltToken then begin
    Username:=''; Password:='';
    end
  else if ATask.LogonType=ltService then Password:='';   // run as SYSTEM
  try
    pRegisteredTask:=pRootFolder.RegisterTaskDefinition(TaskName,ATask.pDefinition,
       TASK_CREATE_OR_UPDATE,Username,Password,TaskFlags[ATask.LogonType],'');
    Refresh;
    Result:=IndexOfTask(TaskName);
  except
    on E:EOleSysError do with E do begin
      FErrMsg:=Message; FErrorCode:=ErrorCode;
      end;
    end;
  end;

{------------------------------------------------------------------- }
constructor TWinTaskScheduler.Create;
begin
  inherited Create;
//  FResult:=CoInitialize(nil); //Ex(nil,COINIT_MULTITHREADED);
//  Create an instance of the Task Service.
//  CoCreateInstance(CLSID_TaskScheduler,nil,CLSCTX_INPROC_SERVER,IID_ITaskService,pService);
  FResult:=CoInitializeSecurity(nil,-1,nil,nil,RPC_C_AUTHN_LEVEL_PKT,RPC_C_IMP_LEVEL_IMPERSONATE,nil,0,nil);
  if succeeded(FResult) or (FResult=RPC_E_TOO_LATE) then begin
    try
      //  Create an instance of the Task Service.
      pService:=CoTaskScheduler_.Create;
      //pService:=CreateComObject(CLSID_TaskScheduler) as ITaskService;
      FResult:=ERROR_SUCCESS;
    except
      on E:EOleSysError do FResult:=E.ErrorCode;
      end;
    end;
  FTaskFolder:=nil;
  FFolder:='\';  // set to root
  end;

destructor TWinTaskScheduler.Destroy;
begin
  FreeAndNil(FTaskFolder);
//  pService:=nil;
//  CoUninitialize;
  inherited Destroy;
  end;

{ $O-}     // does not work with optimization ??
function TWinTaskScheduler.Init : HResult;
begin
  if succeeded(FResult) then begin
    //  Connect to the local task service.
    Result:=pService.Connect(Null,Null,Null,Null); // Null instead of '' required for Vista
    if succeeded(Result) then Result:=Refresh;
    end
  else Result:=FResult;
  end;
{$O+}

class function TWinTaskScheduler.IsRunning: Boolean;
begin
  Result:=GetServiceStatusByName('','schedule')=ssRunning;
  end;

procedure TWinTaskScheduler.SetFolder (const AFolder : string);
begin
  FFolder:=AFolder;
  Refresh;
  end;

function TWinTaskScheduler.Refresh : HResult;
begin
  try
  //  Get the pointer to the root task folder.
    if assigned(FTaskFolder) then FTaskFolder.Free;
    FTaskFolder:=TWinTaskFolder.Create(pService.GetFolder(FFolder));
    Result:=FTaskFolder.Refresh;
  except
    on E:EOleSysError do Result:=E.ErrorCode;
    end;
  end;

function TWinTaskScheduler.NewTask : TWinTask;
begin
  Result:=TWinTask.Create(pService.NewTask(0));
  Result.Compatibility:=GetDefaultCompatibility; // appropriate to current system
  end;


//function TWinTaskScheduler.Add (const TaskName: String) : TWinTask;
//var
//  pRegisteredTask : IRegisteredTask;
//  n     : integer;
//begin
//  pRegisteredTask:=pService.NewTask(0);
//  Result:=TWinTask.Create(pRegisteredTask.Name,pRegisteredTask);
//  Result.Refresh;
//  n:=FTasks.Add(Result);
//  Result.TaskIndex:=n;
//  end;
//

function CreateWinTaskScheduler (var TaskSchedule : TWinTaskScheduler) : HResult;
begin
  if Win32MajorVersion<6 then Result:=NotAvailOnXp  // WindowsXP or older
  else if TWinTaskScheduler.IsRunning then begin
    Result:=CoInitializeSecurity(nil,-1,nil,nil,RPC_C_AUTHN_LEVEL_PKT,RPC_C_IMP_LEVEL_IMPERSONATE,nil,0,nil);
    if succeeded(Result) or (Result=RPC_E_TOO_LATE) then begin
      TaskSchedule:=TWinTaskScheduler.Create;
      Result:=TaskSchedule.Init;
      end;
    end
  else Result:=SCHED_E_SERVICE_NOT_RUNNING;
  end;

end.

