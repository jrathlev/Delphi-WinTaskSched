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
   last mofified: March 2023
   *)

unit TaskMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, WinTask, System.ImageList, Vcl.ImgList;

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
    btbNew: TBitBtn;
    btbClose: TBitBtn;
    lvTasks: TListView;
    edCompat: TLabeledEdit;
    edLogonType: TLabeledEdit;
    btbEdit: TBitBtn;
    btbRun: TBitBtn;
    Timer: TTimer;
    paTop: TPanel;
    imgHeader: TImageList;
    btnRefresh: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbCloseClick(Sender: TObject);
    procedure lvTasksSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormResize(Sender: TObject);
    procedure btbNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btbEditClick(Sender: TObject);
    procedure btbRunClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure lvTasksColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvTasksCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private-Deklarationen }
    WinTasks : TWinTaskScheduler;
    SelectedTaskIndex : integer;
    function SelectSubfolder : boolean;
    function GetListIndex (ATaskIndex : integer) : integer;
    procedure UpdateListView (AIndex : integer);
    procedure ShowData(Item: TListItem; Selected: Boolean);
  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses System.Win.ComObj, System.DateUtils, System.StrUtils, Vcl.FileCtrl, Winapi.ActiveX,
  TaskSchedDlg, SelectListItemDlg;

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

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_F5) then btnRefreshClick(Sender);
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
  if SelectSubfolder then UpdateListView(0) else Close;
  end;

function TMainForm.SelectSubfolder : boolean;
var
  fl : TStringList;
  i  : integer;
  s  : string;
begin
  fl:=TStringList.Create;
  fl.Add('- Create new subfolder');
  fl.Add('- Root');
  with WinTasks.TaskFolder do for i:=0 to FolderCount-1 do fl.Add(Folders[i].Name);
  i:=SelectListItemDialog.Execute(Caption,'Select Task Scheduler Library folder:',fl,1);
  with WinTasks,TaskFolder do if (i=0) or (i>1) then begin
    if i=0 then begin
      s:=InputBox(Caption,'Name of new subfolder:','');
      if length(s)>0 then begin
        i:=IndexOfFolder(s);
        if i<0 then i:=CreateFolder(s);
        end;
      end
    else dec(i,2);
    if i>=0 then Path:=Folders[i].Path
    else MessageDlg('Error on creating subfolder',mtError,[mbOK],0);
    end;
  Result:=i>=0;
  fl.Free;
  end;

procedure TMainForm.btnRefreshClick(Sender: TObject);
var
  s : string;
begin
  with lvTasks do s:=Items[ItemIndex].Caption;
  with WinTasks do begin
    Refresh;
    UpdateListView(GetListIndex(TaskFolder.IndexOfTask(s)));
    end;
  end;

procedure TMainForm.UpdateListView (AIndex : integer);
var
  i : integer;
  s : string;
begin
  lvTasks.Clear;
  lvTasks.Items.BeginUpdate;
  with WinTasks.TaskFolder do begin
    s:=FolderName;
    if length(s)>0 then s:=' - '+s;
    paTop.Caption:='Task Scheduler Libray'+s;
    for i:=0 to TaskCount-1 do with Tasks[i] do begin
      with lvTasks.Items.Add do begin
        Caption:=TaskName;
        Data:=pointer(i);
        SubItems.Add(StatusAsString);
        SubItems.Add(LastRunTimeAsString);
        SubItems.Add(NextRunTimeAsString);
        ImageIndex:=-1;
        end;
      end;
    end;
  lvTasks.Items.EndUpdate;
  with lvTasks do if AIndex>=0 then begin
    if AINdex>=Items.Count then AIndex:=Items.Count-1;
    ItemIndex:=AIndex;
    Invalidate;
    if ItemIndex>=0 then Selected.MakeVisible(false);
    end;
  end;

procedure TMainForm.lvTasksColumnClick(Sender: TObject; Column: TListColumn);
var
  nc,i : integer;
  rev : boolean;
begin
  with (Sender as TListView) do begin
    nc:=Tag;
    for i:=0 to Columns.Count-1 do Columns[i].ImageIndex:=-1;
    end;
  rev:=nc and $10 <>0;
  if nc and $F = Column.Index then rev:= not rev
  else if Column.Index=0 then rev:=false else rev:=true;
  nc:=Column.Index;
  if rev then nc:=nc or $10;
  with Column do if rev then ImageIndex:=1 else ImageIndex:=0;
  with (Sender as TListView) do begin
    Tag:=nc;
    AlphaSort;
    end;
  end;

procedure TMainForm.lvTasksCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  n : integer;

  function CompareDateTimeStr (const Date1,Date2 : string) : integer;
  var
    dt1,dt2 : TDateTime;
  begin
    if not TryStrToDateTime(Date1,dt1) then dt1:=0;
    if not TryStrToDateTime(Date2,dt2) then dt2:=0;
    Result:=CompareDateTime(dt1,dt2);
    end;

begin
  with (Sender as TCustomListView) do begin
    n:=Tag and $F;
    if n=0 then Compare:=AnsiCompareText(Item1.Caption,Item2.Caption)  // Name
    else if n=1 then Compare:=AnsiCompareText(Item1.SubItems[0],Item2.SubItems[0])  // Status
    else begin       // Date
      Compare:=CompareDateTimeStr(Item1.SubItems[n-1],Item2.SubItems[n-1]);
      end;
    if Tag and $10 <>0 then Compare:=-Compare;
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
const
  LogonTypes : array[TLogonType] of string =
    ('Not specified','User and password','Interactive token','As logged on user',
     'As group member','Local system or service','Interactive or passord');

  procedure ShowPath (AEdit : TCustomEdit; const APath : string);
  begin
    with AEdit do begin
      Text:=MinimizeName(APath,self.Canvas,Width);
      ShowHint:=length(APath)>length(Text);
      if ShowHint then Hint:=APath;
      end;
    end;

  procedure ShowText (AEdit : TCustomEdit; const AText : string);
  begin
    with AEdit do begin
      Text:=AText;
      ShowHint:=Canvas.TextWidth(AText)>Width;
      if ShowHint then Hint:=WrapText(AText,80);
      end;
    end;

begin
  if Assigned(Item) and Selected then begin
    with WinTasks.TaskFolder.Tasks[integer(Item.Data)],Definition do begin
      gbDetails.Caption:='Properties of task: '+TaskName;
      ShowText(edStatus,StatusAsString);
      ShowText(edLogonType,LogonTypes[LogonType]);
      if LogonType=ltGroup then ShowText(edUserAccount,GroupId)
      else ShowText(edUserAccount,UserId);
      ShowText(edComment,Description);
      ShowText(edCreator,Author);
      ShowText(edStatus,DateAsString);
      ShowText(edCompat,CompatibilityAsString);
//      cbReRun.Checked:=RunIfMissed;
      if ActionCount>0 then with Actions[0] do if ActionType=taExec then
          with TWinTaskExecAction(Actions[0]) do begin
        ShowPath(edApplication,ApplicationPath);
        ShowText(edParameters,Arguments);
        ShowPath(edWorkDir,WorkingDirectory);
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

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  btnRefreshClick(Sender);
  end;

function TMainForm.GetListIndex (ATaskIndex : integer) : integer;
var
  i  : integer;
begin
  Result:=-1;
  with lvTasks.Items do for i:=0 to Count-1 do if integer(Item[i].Data)=ATaskIndex then begin
    Result:=i; Break;
    end;
  end;

procedure TMainForm.btbCloseClick(Sender: TObject);
begin
  Close;
  end;

procedure TMainForm.btbNewClick(Sender: TObject);
var
  td : TWinTask;
  n  : integer;
  sn,user,pwd : string;
  ok : boolean;
begin
  User:=''; pwd:=''; sn:='';
  if InputQuery('Create new Task?','Name of task:',sn) then with WinTasks do begin
    n:=TaskFolder.IndexOfTask(sn);
    if n<0 then begin
      td:=NewTask;
      with td do begin
        Description:='Test for new task';
        LogOnType:=ltToken;   // as current user
        Date:=Now;
        end;
      ok:=TaskScheduleDialog.Execute(sn,td,user,pwd);
      end
    else begin
      ok:=MessageDlg('Task already exists - edit?',mtConfirmation,mbYesNo,0)=mrYes;
      ok:=ok and TaskScheduleDialog.Execute(sn,TaskFolder.Tasks[n].Definition,user,pwd);
      end;
    if ok then with TaskFolder do begin
      n:=RegisterTask(sn,td,User,pwd);
      if n<0 then MessageDlg('Could not create scheduled task!'+sLineBreak
        +SysErrorMessage(ResultCode(ErrorCode))+' - '+ErrorMessage,
        mtError,[mbOK],0)
      else begin
        n:=GetListIndex(n);
        UpdateListView(n);
        ShowData(lvTasks.Items[n],true);
        end;
      end;
    end;
  end;

procedure TMainForm.btbRunClick(Sender: TObject);
begin
  if (SelectedTaskIndex>=0) then with WinTasks.TaskFolder.Tasks[SelectedTaskIndex] do begin
    if Status=tsReady then begin
      if MessageDlg('Run selected task?',mtConfirmation,mbYesNo,0)=mrYes then Run;
      end
    else if Status=tsRunning then begin
      if MessageDlg('Stop selected task?',mtConfirmation,mbYesNo,0)=mrYes then Stop;
      end;
    UpdateListView(GetListIndex(SelectedTaskIndex));
    end;
  end;

procedure TMainForm.btbEditClick(Sender: TObject);
var
  user,pwd : string;
  n        : integer;
begin
  if SelectedTaskIndex>=0 then with WinTasks.TaskFolder,Tasks[SelectedTaskIndex] do begin
    if TaskScheduleDialog.Execute(TaskName,Definition,user,pwd) then begin
      n:=RegisterTask(TaskName,Definition,user,pwd);
      if n<0 then begin   // Error
        MessageDlg('Could not modify scheduled task!'+sLineBreak
                   +SysErrorMessage(ResultCode(ErrorCode))+' - '+ErrorMessage,
                   mtError,[mbOK],0);
        Refresh;
        end
      else begin
        n:=GetListIndex(n);
        UpdateListView(n);
        ShowData(lvTasks.Items[n],true);
        end;
      end;
    end;
  end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
var
  sn : string;
begin
  if SelectedTaskIndex>=0 then with WinTasks.TaskFolder do begin
    sn:=Tasks[SelectedTaskIndex].TaskName;
    if MessageDlg(Format('Delete task "%s"?',[sn]),mtConfirmation,mbYesNo,0)=mrYes then begin
      if not DeleteTask(sn) then MessageDlg(ErrorMessage,mtError,[mbOK],0)
      else UpdateListView(GetListIndex(SelectedTaskIndex));
      end;
    end;
  end;

end.
