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

   The demo shows how to create a task according the command line
   schtasks /create /tn "UpdateChecker" /tr "somefile.exe" /sc minute /mo "30"
   *)

uses Winapi.Windows, Winapi.Messages, System.SysUtils, Winapi.ActiveX,
  TaskSchedApi, WinTask;

function ErrorMsg (const s : string; hr : HResult) : string;
begin
  Result:='* '+s+Format('- Returned HRESULT = $%.8x: %s',[hr,SysErrorMessage(hr)]);
  end;

procedure WriteErrMsg (const s : string; hr : HResult); overload;
begin
  writeln('==> ',ErrorMsg(s,hr));
  end;

procedure WriteErrMsg (const s : string); overload;
begin
  writeln('==> * ',s);
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
    if Win32MajorVersion<6 then begin // WindowsXP or older
      WriteErrMsg ('Windows Task Scheduler 2.0 requires at least Windows Vista');
      end
    else if TWinTaskScheduler.IsRunning then begin
      hr:=CoInitializeSecurity(nil,-1,nil,nil,RPC_C_AUTHN_LEVEL_PKT,RPC_C_IMP_LEVEL_IMPERSONATE,nil,0,nil);
      if succeeded(hr) or (hr=RPC_E_TOO_LATE) then begin
        WinTasks:=TWinTaskScheduler.Create;
        hr:=WinTasks.Init;
        if succeeded(hr) then with WinTasks do begin
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
              with NewTrigger(ttTime) do begin
                StopAtDurationEnd:=false;
                Interval:=1800;  // 30 min = 1800 s
                Duration:=0;     // unlimited
                ExecutionTimeLimit:=0;
                end;
              end;
            with TaskFolder do if RegisterTask(TaskName,td,'','')<0 then begin
              WriteErrMsg('Could not create scheduled task!');
              WriteErrMsg(SysErrorMessage(ResultCode(ErrorCode))+' - '+ErrorMessage);
              end;
            end
          else WriteErrMsg (Format('Task "%s" already exists!',[TaskName]));
          WinTasks.Free;
          end
        else WriteErrMsg ('Failed to init TaskScheduler',hr);
        end
      else WriteErrMsg ('Failed to run CoInitializeSecurity',hr);
      end
    else WriteErrMsg ('Windows Task Scheduler is not running!');
  // Uninitialize COM
    CoUninitialize;
    end
  else WriteErrMsg ('Failed to run CoInitializeEx',hr);
  end.
    
