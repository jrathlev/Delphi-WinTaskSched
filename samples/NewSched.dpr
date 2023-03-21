(* Program to demonstrate the creation of an Windows Scheduled Tasl
   using Delphi interface to Windows Task Scheduler 2.0

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1.0 - March 2023

   The demo shows how to create a task according to the command line
   schtasks /create /tn "UpdateChecker" /tr "somefile.exe" /sc minute /mo "30"
   *)

program NewSched;

{$APPTYPE CONSOLE}

{$R *.res}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

uses System.SysUtils, System.DateUtils, Winapi.ActiveX, TaskSchedApi, WinTask;

function ErrorMsg (const s : string; hr : HResult) : string;
begin
  Result:=s+Format(' - Returned HRESULT = $%.8x: %s',[hr,SysErrorMessage(hr)]);
  end;

procedure WriteErrMsg (const s : string; hr : HResult); overload;
begin
  writeln('==> ',ErrorMsg(s,hr));
  end;

procedure WriteErrMsg (const s : string); overload;
begin
  writeln('==> ',s);
  end;

const
  TaskName = 'UpdateChecker';
  TaskApp = 'somefile.exe';
var
  hr : HResult;
  WinTasks : TWinTaskScheduler;
  td : TWinTask;
  n : integer;
begin
  // Initialize COM for COINIT_MULTITHREADED
  CoUninitialize;
  hr:=CoInitializeEx(nil,COINIT_MULTITHREADED);
  if SUCCEEDED(hr) then begin
    hr:=CreateWinTaskScheduler(WinTasks);
    if failed(hr) then begin
      if hr=NotAvailOnXp then begin
        WriteErrMsg ('Windows Task Scheduler 2.0 requires at least Windows Vista');
        end
      else WriteErrMsg ('Error initializing TWinTaskScheduler',hr);
      end
    else with WinTasks do begin
      // Create new task
      n:=TaskFolder.IndexOfTask(TaskName);
      if n<0 then begin
        td:=NewTask;
        with td do begin
          Description:='Test for new task';
          LogOnType:=ltToken;   // as current user
          Date:=Now;
          with TWinTaskExecAction(NewAction(taExec)) do begin
            WorkingDirectory:='';
            ApplicationPath:=TaskApp;
            Arguments:='';
            end;
          with Settings do begin
            RunOnlyIfIdle:=true;
            IdleSettings.IdleDuration:=600;  // seconds
            IdleSettings.WaitTimeout:=300;
            DeleteExpiredTaskAfter:=0;
            // = -1 disabled
            // = 0  immediate
            // > 0  number of hours
            end;
          with NewTrigger(ttTime) do begin
            StartTime:=Now;
            EndTime:=Now+10;  // EncodeDateTime(2023,5,31,12,0,0,0);
            StopAtDurationEnd:=false;
            Interval:=1800;  // 30 min = 1800 s
            Duration:=0;     // unlimited
            ExecutionTimeLimit:=0;
            end;
          end;
        with TaskFolder do if RegisterTask(TaskName,td,'','')<0 then begin
          WriteErrMsg('Could not create scheduled task!');
          WriteErrMsg(SysErrorMessage(ResultCode(ErrorCode))+' - '+ErrorMessage);
          end
        else WriteErrMsg(Format('Task "%s" successfully created!',[TaskName]));
        end
      else WriteErrMsg (Format('Task "%s" already exists!',[TaskName]));
      Free;
      end;
  // Uninitialize COM
    CoUninitialize;
    end
  else WriteErrMsg ('Failed to run CoInitializeEx',hr);
  end.
    
