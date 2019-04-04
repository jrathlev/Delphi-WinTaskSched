(* Program to demonstrate the use of the
   Delphi interface to Windows Task Scheduler 2.0

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1.0 - Oct. 2017
   last mofified: April 2019
   *)

unit TaskMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, WinTask;

type
  TMainForm = class(TForm)
    gbDetails: TGroupBox;
    Label1: TLabel;
    edUserAccount: TLabeledEdit;
    edComment: TLabeledEdit;
    edCreator: TLabeledEdit;
    edStatus: TLabeledEdit;
    edApplication: TLabeledEdit;
    edParameters: TLabeledEdit;
    edWorkDir: TLabeledEdit;
    lbTriggers: TListBox;
    btnDelete: TBitBtn;
    btbEdit: TBitBtn;
    btbCancel: TBitBtn;
    lvTasks: TListView;
    edCompat: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbCancelClick(Sender: TObject);
    procedure lvTasksSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormResize(Sender: TObject);
    procedure btbEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private-Deklarationen }
    WinTasks : TWinTaskScheduler;
    SelectedTaskIndex : integer;
    procedure UpdateListeView (AIndex : integer);
    procedure ShowData(Item: TListItem; Selected: Boolean);
  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses System.Win.ComObj, System.DateUtils, Vcl.FileCtrl, Winapi.ActiveX, WinApiUtils;

procedure TMainForm.FormCreate(Sender: TObject);
var
  hr : HResult;
begin
//  CoInitializeEx(nil,COINIT_MULTITHREADED);
  hr:=CreateWinTaskScheduler(WinTasks);
  if failed(hr) then begin
    if hr=NotAvailOnXp then begin
      MessageDlg('Windows Task Scheduler 2.0 requires at least Windows Vista',mtError,[mbOK],0);
      Halt(1)
      end
    else begin
      MessageDlg('Error initializing TWinTaskScheduler: '+IntToHex(hr,8),mtError,[mbOK],0);
      Halt(2)
      end;
    end;
  end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  WinTasks.Free;
//  CoUninitialize;
  end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  with lvTasks do begin
    Columns[1].Width:=80;
    Columns[2].Width:=150;
    Columns[3].Width:=150;
    Columns[0].Width:=Width-401;
    end;
  end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  UpdateListeView(0);
  end;

procedure TMainForm.UpdateListeView (AIndex : integer);
var
  i : integer;
begin
  lvTasks.Clear;
  with WinTasks.TaskFolder do begin
    for i:=0 to TaskCount-1 do with Tasks[i] do begin
      with lvTasks.Items.Add do begin
        Caption:=TaskName;
        Data:=pointer(i);
        SubItems.Add(StatusAsString);
        SubItems.Add(LastRunTimeAsString);
        SubItems.Add(NextRunTimeAsString);
        end;
      end;
    with lvTasks do begin
      if AINdex>=Items.Count then AIndex:=Items.Count-1;
      ItemIndex:=AIndex;
      Invalidate;
      Selected.MakeVisible(false);
      end;
    end;
  end;

procedure TMainForm.lvTasksSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  ShowData(Item,Selected);
  end;

procedure TMainForm.ShowData(Item: TListItem; Selected: Boolean);
var
  i  : integer;

  procedure ShowText (AEdit : TCustomEdit; const AText : string);
  begin
    with AEdit do begin
      Text:=MinimizeName(AText,self.Canvas,Width);
      ShowHint:=length(AText)>length(Text);
      if ShowHint then Hint:=AText;
      end;
    end;

begin
  if Assigned(Item) and Selected then begin
    with WinTasks.TaskFolder.Tasks[integer(Item.Data)],Definition do begin
      gbDetails.Caption:='Properties of task: '+TaskName;
      ShowText(edStatus,StatusAsString);
      ShowText(edUserAccount,UserId);
      ShowText(edComment,Description);
      ShowText(edCreator,Author);
      ShowText(edStatus,DateAsString);
      ShowText(edCompat,CompatibilityAsString);
//      cbReRun.Checked:=RunIfMissed;
      if ActionCount>0 then with Actions[0] do if ActionType=taExec then
          with TWinTaskExecAction(Actions[0]) do begin
        ShowText(edApplication,ApplicationPath);
        ShowText(edParameters,Arguments);
        ShowText(edWorkDir,WorkingDirectory);
        end
      else begin
        edApplication.Text:='';
        edParameters.Text:='';
        edWorkDir.Text:='';
        end;
      lbTriggers.Clear;
      for i:=0 to TriggerCount-1 do with Triggers[i] do begin
        lbTriggers.Items.Add(TriggerString);
        end;
      SelectedTaskIndex:=TaskIndex;
      end;
    end
  end;

procedure TMainForm.btbCancelClick(Sender: TObject);
begin
  Close;
  end;

procedure TMainForm.btbEditClick(Sender: TObject);
var
  td : TWinTask;
  n  : integer;
  user,pwd : string;
begin
  User:=''; pwd:=''; ;
  if SelectedTaskIndex>=0 then with WinTasks do begin
    td:=NewTask; //Tasks[SelectedTaskIndex];
    with td do begin
      UserId:=UserName;
      Description:='Test for new task';
      LogOnType:=ltToken;   // as current user
      Author:=UserId;
      Date:=Now;
      with TWinTaskExecAction(NewAction(taExec)) do begin
        ApplicationPath:='c:\Windows\notepad.exe';
        end;
      with NewTrigger(ttWeekly) do begin
        StartTime:=Now+1; EndTime:=Now+7; DaysOfWeek:=5;
        Duration:=300; Interval:=60;
        end;
      end;
    n:=TaskFolder.RegisterTask('Test-New',td,User,pwd);
    if n<0 then MessageDlg(TaskFolder.ErrorMessage,mtError,[mbOK],0)
    else begin
      UpdateListeView(n);
      ShowData(lvTasks.Items[n],true);
      end;
    end;
  end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  if SelectedTaskIndex>=0 then with WinTasks.TaskFolder do begin
    if failed(DeleteTask(Tasks[SelectedTaskIndex].TaskName)) then
      MessageDlg(ErrorMessage,mtError,[mbOK],0)
    else begin
      UpdateListeView(SelectedTaskIndex);
      end;
    end;
  end;

end.
