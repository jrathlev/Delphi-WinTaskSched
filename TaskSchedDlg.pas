(* Edit scheduled task - Demo
   =========================

   © J. Rathlev, D.24222 Schwentinental (kontakt(a)rathlev-home.de))

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   J. Rathlev, Jul. 2008
   last updated: August 2020
   *)

unit TaskSchedDlg;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Dialogs,
  WinTask, AdvancedScheduleDlg, CheckBoxes;

type
  TTaskScheduleDialog = class(TForm)
    pcSteps: TPageControl;
    rgCycle: TRadioGroup;
    tsWeekly: TTabSheet;
    tsMonthly: TTabSheet;
    tsUser: TTabSheet;
    edJobName: TLabeledEdit;
    tpStartWeekly: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    laWeek: TLabel;
    laMonth: TLabel;
    Label10: TLabel;
    tpStartMonthly: TDateTimePicker;
    pnlSelectDays: TPanel;
    rbDayOfMonth: TRadioButton;
    rbSpecialday: TRadioButton;
    pnlMonths: TPanel;
    Label11: TLabel;
    cbJan: TCheckBox;
    cbFeb: TCheckBox;
    cbMar: TCheckBox;
    cbApr: TCheckBox;
    cbMay: TCheckBox;
    cbJun: TCheckBox;
    cbJul: TCheckBox;
    cbAug: TCheckBox;
    cbSep: TCheckBox;
    cbOct: TCheckBox;
    cbNov: TCheckBox;
    cbDec: TCheckBox;
    pnlWeekDays: TPanel;
    cbMonday: TCheckBox;
    cbTuesday: TCheckBox;
    cbWednesday: TCheckBox;
    cbThursday: TCheckBox;
    cbFriday: TCheckBox;
    cbSaturday: TCheckBox;
    cbSunday: TCheckBox;
    Label12: TLabel;
    tsDaily: TTabSheet;
    Label1: TLabel;
    laDay: TLabel;
    tpStartDaily: TDateTimePicker;
    dpStartDaily: TDateTimePicker;
    pnlDaily: TPanel;
    rbEveryDay: TRadioButton;
    rbSkipDays: TRadioButton;
    Label2: TLabel;
    laDays: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edPwd: TLabeledEdit;
    edUser: TLabeledEdit;
    tsOneTime: TTabSheet;
    tpOneTime: TDateTimePicker;
    Label18: TLabel;
    dpOneTime: TDateTimePicker;
    laSingle: TLabel;
    pcMain: TPageControl;
    tsProgram: TTabSheet;
    tsSchedule: TTabSheet;
    edWorkDir: TLabeledEdit;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnNext: TBitBtn;
    btnBack: TBitBtn;
    btnProg: TBitBtn;
    edProg: TLabeledEdit;
    dpStartWeekly: TDateTimePicker;
    dpStartMonthly: TDateTimePicker;
    btAdvDaily: TBitBtn;
    btWorkDir: TBitBtn;
    leDesc: TLabeledEdit;
    ccWeekdays: TCheckComboBox;
    ccMonthStart: TCheckComboBox;
    ccMonthDays: TCheckComboBox;
    btAdvOneTime: TBitBtn;
    btExtMon: TBitBtn;
    btExtWeek: TBitBtn;
    rbLoggedUser: TRadioButton;
    rbAnyUser: TRadioButton;
    gbSecurity: TGroupBox;
    cbRandom: TCheckBox;
    cbEnabled: TCheckBox;
    tsEvent: TTabSheet;
    cbRndUnit: TComboBox;
    paRandom: TPanel;
    laEvent: TLabel;
    cbActivate: TCheckBox;
    dpEventTime: TDateTimePicker;
    tpEventTime: TDateTimePicker;
    btEvAdv: TBitBtn;
    paDelay: TPanel;
    cbDelUnit: TComboBox;
    cbDelay: TCheckBox;
    laUser: TLabel;
    edOptions: TLabeledEdit;
    rgPriority: TRadioGroup;
    OpenDialog: TOpenDialog;
    udDays: TUpDown;
    edDays: TEdit;
    udWeeks: TUpDown;
    edWeeks: TEdit;
    udDelay: TUpDown;
    edDelay: TEdit;
    udRandom: TUpDown;
    edRandom: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgCycleClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnProgClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rbEveryDayClick(Sender: TObject);
    procedure rbDayOfMonthClick(Sender: TObject);
    procedure btAdvDailyClick(Sender: TObject);
    procedure btWorkDirClick(Sender: TObject);
    procedure rbLoggedUserClick(Sender: TObject);
    procedure cbRandomClick(Sender: TObject);
    procedure cbActivateClick(Sender: TObject);
    procedure cbDelayClick(Sender: TObject);
    procedure cbRndUnitCloseUp(Sender: TObject);
    procedure cbDelUnitCloseUp(Sender: TObject);
    procedure SyncDates(Sender: TObject);
    procedure SyncTimes(Sender: TObject);
    procedure cbMondayClick(Sender: TObject);
    procedure cbJanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    AdvSet : TAdvancedSettings;
    procedure ShowRandom (AShow : boolean);
    procedure ShowActTime(AShow : boolean);
    procedure ShowDelay (AShow : boolean);
    procedure ShowDelayValue (Delay : cardinal; rev : TUpDown; cbu : TComboBox);
    function GetDelayValue (Act : boolean; rev : TUpDown; cbu : TComboBox) : cardinal;
    procedure ShowSecOptions;
    procedure ResetSchedule(ADateTime : TDateTime);
    procedure ShowPage;
  public
    { Public declarations }
    function Execute (const ATaskName : string; ASchedTask  : TWinTask;
                      var AUsername,APassword : string) : boolean;
  end;

var
  TaskScheduleDialog: TTaskScheduleDialog;

implementation

{$R *.dfm}

uses System.Win.ComObj, System.DateUtils, System.StrUtils, Winapi.ActiveX,
  Vcl.FileCtrl, TaskSchedApi;

const
  StepPages : array [0..5] of integer = (0,1,2,3,4,4);
  WakeUpTrigger = '<QueryList><Query Id="0" Path="System"><Select Path="System">*'+
   '[System[Provider[@Name=''Microsoft-Windows-Power-Troubleshooter''] and EventID=1]]'+
   '</Select></Query></QueryList>';

function UserName : string;
var
  p : pchar;
  size : dword;
begin
  size:=1024;
  p:=StrAlloc(size);
  GetUserName (p,size);
  Result:=p;
  Strdispose(p);
  end;

function SystemDirectory : string;
var
  p : pchar;
begin
  p:=StrAlloc(MAX_PATH+1);
  GetSystemDirectory (p,MAX_PATH+1);
  Result:=p;
  Strdispose(p);
  end;

function MakeQuotedStr (const s : string; CheckChars : array of char) : string;
var
  i : integer;
  ok : boolean;
begin
  if (length(s)=0) then Result:=''
  else begin
    if length(CheckChars)=0 then ok:=true
    else begin
      ok:=false;
      for i:=Low(CheckChars) to High(CheckChars) do ok:=ok or (Pos(CheckChars[i],s)>0);
      end;
    if ok then Result:=AnsiQuotedStr(s,'"') else Result:=s;
    end;
  end;

procedure TTaskScheduleDialog.FormCreate(Sender: TObject);
var
  w,h : integer;
begin
  with edJobName do begin
    w:=Left+Width+5;
    end;
  ClientWidth:=w;
  with ccMonthDays do begin
    for w:=1 to 31 do Items.Add(IntToStr(w));
    Items.Add('Last');
    end;
  h:=Font.Height;
  laDay.Font.Height:=h;
  laWeek.Font.Height:=h;
  laMonth.Font.Height:=h;
  laSingle.Font.Height:=h;
  end;

procedure TTaskScheduleDialog.FormDestroy(Sender: TObject);
begin
//
  end;

procedure TTaskScheduleDialog.FormShow(Sender: TObject);
begin
  ccMonthDays.Init;
  ccMonthStart.Init;
  ccWeekdays.Init;
  end;

procedure TTaskScheduleDialog.ShowRandom (AShow : boolean);
var
  i : integer;
begin
  cbRandom.Checked:=AShow;
  with paRandom do for i:=0 to ControlCount-1 do if not (Controls[i] is TCheckBox) then
    Controls[i].Enabled:=AShow;
  end;

procedure TTaskScheduleDialog.ShowActTime(AShow : boolean);
begin
  cbActivate.Checked:=AShow;
  dpEventTime.Enabled:=AShow; tpEventTime.Enabled:=AShow;
  end;

procedure TTaskScheduleDialog.ShowDelay (AShow : boolean);
var
  i : integer;
begin
  cbDelay.Checked:=AShow;
  with paDelay do for i:=0 to ControlCount-1 do if not (Controls[i] is TCheckBox) then
    Controls[i].Enabled:=AShow;
  end;

procedure TTaskScheduleDialog.ShowDelayValue (Delay : cardinal; rev : TUpDown; cbu : TComboBox);
begin
  if (Delay mod 3600 =0) or (Delay>=43200) then begin
    cbu.ItemIndex:=0;   // hours
    with rev do begin
      Max:=24;
      Position:=Delay div 3600;
      end;
    end
  else if (Delay mod 60 =0) or (Delay>=1800) then begin
    cbu.ItemIndex:=1;   // minutes
    with rev do begin
      Max:=719;
      Position:=Delay div 60;
      end;
    end
  else begin
    cbu.ItemIndex:=2;   // seconds
    with rev do begin
      Max:=599;
      Position:=Delay;
      end;
    end;
  end;

function TTaskScheduleDialog.GetDelayValue (Act : boolean; rev : TUpDown; cbu : TComboBox) : cardinal;  // Delay in seconds
begin
  if Act then begin
    if cbu.ItemIndex=0 then Result:=rev.Position*3600         // hours
    else if cbu.ItemIndex=1 then Result:=rev.Position*60      // minutes
    else Result:=rev.Position;
    end
  else Result:=0;
  end;

procedure TTaskScheduleDialog.ShowSecOptions;
begin
  if rbLoggedUser.Checked then begin
    with edUser do begin
      Text:=UserName;         // logged on user
      Enabled:=false;
      end;
    edPwd.Visible:=false;
    end
  else begin
    edUser.Enabled:=true;
    edPwd.Visible:=true;
    end;
  laUser.Caption:=edUser.Text;
  end;

procedure TTaskScheduleDialog.ShowPage;
begin
  pcSteps.ActivePageIndex:=StepPages[rgCycle.ItemIndex];
  if rgCycle.ItemIndex=4 then laEvent.Caption:='On logon of:'
  else if rgCycle.ItemIndex=5 then laEvent.Caption:='On waking up the computer:';
  laUser.Visible:=rgCycle.ItemIndex=4;
  btnNext.Caption:='Next';
  end;
  
procedure TTaskScheduleDialog.rgCycleClick(Sender: TObject);
begin
  if pcMain.ActivePage=tsSchedule then ShowPage;
  end;

procedure TTaskScheduleDialog.btnNextClick(Sender: TObject);
var
  s   : string;
  ok  : boolean;
begin
  btnBack.Enabled:=true;
  if (pcMain.ActivePage=tsProgram) then begin
    s:=edProg.Text;
    ok:=length(s)>0;
    if ok then begin
      ok:=FileExists(s);
      if not ok then MessageDlg('File not found:'+sLineBreak+s,mtError,[mbOK],0);
      end
    else MessageDlg('No program specified!',mtError,[mbOK],0);
    if ok then begin
      pcMain.ActivePage:=tsSchedule;
      ShowPage;
      end;
    end
  else begin    // done
    if pcSteps.ActivePage<>tsUser then begin
      pcSteps.ActivePage:=tsUser;
      btnNext.Caption:='Done';
      with edPwd do if Visible then SetFocus;
      end
    else begin
      laUser.Caption:=edUser.Text;
      ModalResult:=mrOK;
      end;
    end;
  end;

procedure TTaskScheduleDialog.btnBackClick(Sender: TObject);
begin
  if pcSteps.ActivePage<>tsUser then begin
    btnBack.Enabled:=false;
    pcMain.ActivePage:=tsProgram;
    end
  else begin
    btnBack.Enabled:=true;
    pcSteps.ActivePageIndex:=rgCycle.ItemIndex;
    end;
  btnNext.Caption:='Next';
  end;

procedure TTaskScheduleDialog.btAdvDailyClick(Sender: TObject);
begin
  AdvancedSettingsDialog(AdvSet);
  end;

procedure TTaskScheduleDialog.btWorkDirClick(Sender: TObject);
var
  s,sh : string;
begin
  s:=edWorkDir.Text; sh:=ExtractFilePath(Application.ExeName);
  if length(s)=0 then s:=sh;
  if SelectDirectory(s,[],0) then edWorkDir.Text:=s;
  end;

procedure TTaskScheduleDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pcMain.ActivePage=tsSchedule) and (pcSteps.ActivePage=tsUser) and (ModalResult=mrOK) then begin
    if (rbAnyUser.Checked) and (length(edPwd.Text)=0) then begin
      MessageDlg('A password is required!',mtError,[mbOK],0);
      CanClose:=false;
      if not CanClose then with edPwd do if Visible then SetFocus;
      end;
    end;
  end;

procedure TTaskScheduleDialog.btnProgClick(Sender: TObject);
var
  s,t : string;
begin
  with OpenDialog do begin
    s:=edProg.Text;
    t:=ExtractFilePath(s);
    if DirectoryExists(t) then InitialDir:=t
    else InitialDir:=ExtractFileDrive(SystemDirectory);
    Filename:='';
    if Execute then begin
      edProg.Text:=Filename;
      end;
    end;
  end;

procedure TTaskScheduleDialog.cbActivateClick(Sender: TObject);
begin
  ShowActTime(cbActivate.Checked);
  end;

procedure TTaskScheduleDialog.cbRandomClick(Sender: TObject);
begin
  ShowRandom(cbRandom.Checked);
  end;

procedure TTaskScheduleDialog.cbRndUnitCloseUp(Sender: TObject);
begin
  with udRandom do case cbRndUnit.Itemindex of
  0 : begin
      Max:=24; Position:=1;
      udRandom.Increment:=1;
      end;
  1 : begin
      Max:=719; Position:=1;
      udRandom.Increment:=10;
      end;
  else begin
      Max:=599; Position:=30;
      udRandom.Increment:=10;
      end;
    end;
  end;

procedure TTaskScheduleDialog.SyncDates(Sender: TObject);
var
  dt : TDateTime;
begin
  dt:=(Sender as TDateTimePicker).Date;
  dpStartDaily.Date:=dt;
  dpStartWeekly.Date:=dt;
  dpStartMonthly.Date:=dt;
  dpOneTime.Date:=dt;
  dpEventTime.Date:=dt;
  end;

procedure TTaskScheduleDialog.SyncTimes(Sender: TObject);
var
  dt : TDateTime;
begin
  dt:=(Sender as TDateTimePicker).Time;
  tpStartDaily.Time:=dt;
  tpStartWeekly.Time:=dt;
  tpStartMonthly.Time:=dt;
  tpOneTime.Time:=dt;
  tpEventTime.Time:=dt;
  end;

procedure TTaskScheduleDialog.cbDelayClick(Sender: TObject);
begin
  ShowDelay(cbDelay.Checked);
  end;

procedure TTaskScheduleDialog.cbDelUnitCloseUp(Sender: TObject);
begin
  with udDelay do case cbDelUnit.Itemindex of
  0 : begin
      Max:=24; Position:=1;
      udDelay.Increment:=1;
      end;
  1 : begin
      Max:=719; Position:=1;
      udDelay.Increment:=10;
      end;
  else begin
      Max:=599; Position:=30;
      udDelay.Increment:=10;
      end;
    end;
  end;

procedure TTaskScheduleDialog.cbJanClick(Sender: TObject);
begin
  if not (cbJan.Checked or cbFeb.Checked or cbMar.Checked or cbApr.Checked
       or cbMay.Checked or cbJun.Checked or cbJul.Checked or cbAug.Checked
       or cbSep.Checked or cbOct.Checked or cbNov.Checked or cbDec.Checked)
    then cbJan.Checked:=true;
  end;

procedure TTaskScheduleDialog.cbMondayClick(Sender: TObject);
begin
  if Visible and not (cbMonday.Checked or cbTuesday.Checked or cbWednesday.Checked
       or cbThursday.Checked or cbFriday.Checked or cbSaturday.Checked
       or cbSunday.Checked) then cbMonday.Checked:=true;
  end;

procedure TTaskScheduleDialog.rbEveryDayClick(Sender: TObject);
begin
  edDays.Enabled:=not rbEveryDay.Checked;
  udDays.Enabled:=udDays.Enabled;
  laDays.Enabled:=udDays.Enabled;
  end;

procedure TTaskScheduleDialog.rbDayOfMonthClick(Sender: TObject);
begin
  ccMonthDays.Enabled:=rbDayOfMonth.Checked;
  ccMonthStart.Enabled:=not rbDayOfMonth.Checked;
  ccWeekDays.Enabled:=ccMonthStart.Enabled;
  end;

procedure TTaskScheduleDialog.rbLoggedUserClick(Sender: TObject);
begin
  ShowSecOptions;
  end;

procedure TTaskScheduleDialog.ResetSchedule(ADateTime : TDateTime);
var
  i : integer;
begin
  cbEnabled.Checked:=true;
  tpStartDaily.Time:=TimeOf(ADateTime);
  dpStartDaily.Date:=DateOf(ADateTime);
  tpStartWeekly.Time:=TimeOf(ADateTime);
  dpStartWeekly.Date:=DateOf(ADateTime);
  tpStartMonthly.Time:=TimeOf(ADateTime);
  dpStartMonthly.Date:=DateOf(ADateTime);
  tpOneTime.Time:=TImeOf(ADateTime);
  dpOneTime.Date:=DateOf(ADateTime);
  tpEventTime.Time:=TImeOf(ADateTime);
  dpEventTime.Date:=DateOf(ADateTime);
  rbEveryDay.Checked:=true;
  udDays.Position:=2;
  edDays.Enabled:=false; udDays.Enabled:=false; laDays.Enabled:=false;
  with AdvSet do begin
    UseEndDate:=false; UseLimit:=false; ReRun:=false;
    MinutesInterval:=60; MinutesDuration:=1440; MinutesLimit:=4320;
    EndDate:=ADateTime;
    end;
  ShowDelayValue(30,udRandom,cbRndUnit);
  ShowRandom(false);
  ShowActTime(false);
  ShowDelayValue(30,udDelay,cbDelUnit);
  ShowDelay(false);
  tpStartWeekly.DateTime:=ADateTime;
  dpStartWeekly.DateTime:=DateOf(ADateTime);
  udWeeks.Position:=1;
  with pnlWeekDays do for i:=0 to ControlCount-1 do if Controls[i] is TCheckBox
    then (Controls[i] as TCheckBox).Checked:=false;
  cbMonday.Checked:=true;
  tpStartMonthly.DateTime:=ADateTime;
  rbDayOfMonth.Checked:=true;
  ccMonthDays.Enabled:=true;
  ccMonthStart.Enabled:=false;
  ccWeekDays.Enabled:=false;
  ccMonthStart.Selected:=1;
  ccWeekDays.Selected:=1;
  rbLoggedUser.Checked:=true;
  ShowSecOptions;
  edPwd.Text:='';
  with pnlMonths do for i:=0 to ControlCount-1 do if Controls[i] is TCheckBox
    then (Controls[i] as TCheckBox).Checked:=true;
  end;

function TTaskScheduleDialog.Execute (const ATaskName : string; ASchedTask : TWinTask;
                                      var AUsername,APassword : string) : boolean;
var
  FTaskAction : TWinTaskExecAction;
  FTrigger    : TWinTaskTrigger;
  FTrgType,
  NewTrgType  : TWinTaskTriggerType;
  FTaskName,
  s,sp,st     : string;
  TrgNr,dow   : integer;
  EvAct,
  ANew,ok     : boolean;
  bd,bt       : TDateTime;
  mr          : TModalResult;

  function WeekDaysToIso (WeekDays : cardinal) : cardinal;
  var
    sun : boolean;
  begin
    Sun:=WeekDays and 1 <>0;
    Result:=WeekDays shr 1;        // Monday = 1
    if sun then Result:=Result or $40;
    end;

  function IsoToWeekDays (WeekDays : cardinal) : cardinal;
  var
    sun : boolean;
  begin
    Sun:=WeekDays and $40 <>0;
    Result:=WeekDays shl 1;        // Sunday = 1
    if sun then Result:=Result or 1;
    end;

  procedure SetMonths (mm : word);
  begin
    cbJan.Checked:=mm and BitMask[1]<>0;
    cbFeb.Checked:=mm and BitMask[2]<>0;
    cbMar.Checked:=mm and BitMask[3]<>0;
    cbApr.Checked:=mm and BitMask[4]<>0;
    cbMay.Checked:=mm and BitMask[5]<>0;
    cbJun.Checked:=mm and BitMask[6]<>0;
    cbJul.Checked:=mm and BitMask[7]<>0;
    cbAug.Checked:=mm and BitMask[8]<>0;
    cbSep.Checked:=mm and BitMask[9]<>0;
    cbOct.Checked:=mm and BitMask[10]<>0;
    cbNov.Checked:=mm and BitMask[11]<>0;
    cbDec.Checked:=mm and BitMask[12]<>0;
    end;

  function GetMonths : word;
  begin
    if cbJan.Checked then Result:=BitMask[1] else Result:=0;
    if cbFeb.Checked then Result:=Result or BitMask[2];
    if cbMar.Checked then Result:=Result or BitMask[3];
    if cbApr.Checked then Result:=Result or BitMask[4];
    if cbMay.Checked then Result:=Result or BitMask[5];
    if cbJun.Checked then Result:=Result or BitMask[6];
    if cbJul.Checked then Result:=Result or BitMask[7];
    if cbAug.Checked then Result:=Result or BitMask[8];
    if cbSep.Checked then Result:=Result or BitMask[9];
    if cbOct.Checked then Result:=Result or BitMask[10];
    if cbNov.Checked then Result:=Result or BitMask[11];
    if cbDec.Checked then Result:=Result or BitMask[12];
    end;

begin
  btnBack.Enabled:=false;
  btnNext.Caption:='Next';
  rgCycle.ItemIndex:=0;
  pcMain.ActivePage:=tsProgram;
  pcSteps.ActivePageIndex:=0;
  sp:='';
  if length(AUsername)=0 then AUserName:=UserName;
  with ASchedTask do begin
    if length(UserId)=0 then begin
      UserId:=AUsername;
      if length(Author)=0 then Author:=UserId;
      end;
    edJobName.Text:=ATaskName;
    rgPriority.ItemIndex:=integer(Priority);
    leDesc.Text:=Description;
    if LogonType=ltToken then rbLoggedUser.Checked:=true else rbAnyUser.Checked:=true;
    ShowSecOptions;
    if IndexOfNextExecAction<0 then FTaskAction:=TWinTaskExecAction(NewAction(taExec))
    else FTaskAction:=TWinTaskExecAction(Actions[SelectedAction]);
    with FTaskAction do begin
      edProg.Text:=ApplicationPath;
      edOptions.Text:=Arguments;
      edWorkDir.Text:=AnsiDequotedStr(WorkingDirectory,'"');
      end;
    edUser.Text:=UserId;
    edPwd.Text:='';
    AdvSet.ReRun:=RunIfMissed;
    if Compatibility<=tcXP then Compatibility:=GetDefaultCompatibility;
    ok:=true;
    if TriggerCount>0 then TrgNr:=0 else TrgNr:=-1;
    if TrgNr>=0 then begin
      FTrigger:=Triggers[0];
      with FTrigger do begin
        st:=TriggerTypeAsString;
        FTrgType:=TriggerType;
        cbEnabled.Checked:=Enabled;
        bt:=StartTime;
        EvAct:=bt>=1;
        if not EvAct then bt:=int(MinsPerDay*Now)/MinsPerDay;
        ShowActTime(false);
        bd:=DateOf(bt);
        bt:=TimeOf(bt);
        tpStartDaily.Time:=bt;
        dpStartDaily.Date:=bd;
        tpStartWeekly.Time:=bt;
        dpStartWeekly.Date:=bd;
        tpStartMonthly.Time:=bt;
        dpStartMonthly.Date:=bd;
        tpOneTime.Time:=bt;
        dpOneTime.Date:=bd;
        tpEventTime.Time:=bt;
        dpEventTime.Date:=bd;
        with AdvSet do begin
          UseEndDate:=EndTime>Now;
          if UseEndDate then EndDate:=DateOf(EndTime+1)-OneSecond
          else EndDate:=Date+366-OneSecond;
          RepeatTask:=Duration>0;
          if RepeatTask then begin
            MinutesDuration:=Duration div 60;
            MinutesInterval:=Interval div 60;
            end;
          UseLimit:=ExecutionTimeLimit>0;
          if UseLimit then MinutesLimit:=ExecutionTimeLimit div 60;
          end;
        laUser.Visible:=false;
        case TriggerType of
        ttDaily : begin
            rgCycle.ItemIndex:=0;
            if DaysInterval=1 then rbEveryDay.Checked:=true
            else begin
              rbSkipDays.Checked:=true;
              udDays.Position:=DaysInterval;
              end;
            edDays.Enabled:=DaysInterval>1;
            udDays.Enabled:=udDays.Enabled;
            laDays.Enabled:=udDays.Enabled;
            end;
        ttWeekly : begin
            rgCycle.ItemIndex:=1;
            udWeeks.Position:=WeeksInterval;
            dow:=DaysOfWeek;
            cbMonday.Checked:=dow and BitMask[2]<>0;
            cbTuesday.Checked:=dow and BitMask[3]<>0;
            cbWednesday.Checked:=dow and BitMask[4]<>0;
            cbThursday.Checked:=dow and BitMask[5]<>0;
            cbFriday.Checked:=dow and BitMask[6]<>0;
            cbSaturday.Checked:=dow and BitMask[7]<>0;
            cbSunday.Checked:=dow and BitMask[1]<>0;
            end;
        ttMonthly : begin
            rgCycle.ItemIndex:=2;
            rbDayOfMonth.Checked:=true;
            ccMonthDays.Selected:=DaysOfMonth;
            SetMonths(MonthsOfYear);
            end;
        ttMonthlyDow: begin
            rgCycle.ItemIndex:=2;
            rbSpecialday.Checked:=true;
            ccMonthDays.Enabled:=false;
            ccWeekDays.Enabled:=true;
            ccMonthStart.Enabled:=true;
            ccMonthStart.Selected:=WeeksOfMonth;
            ccWeekDays.Selected:=WeekDaysToIso(DaysOfWeek);
            SetMonths(MonthsOfYear);
            end;
        ttTime : begin
            rgCycle.ItemIndex:=3;
            ShowDelayValue(RandomDelay,udRandom,cbRndUnit);
            ShowRandom(RandomDelay>0);
            end;
//          ttBoot: begin
//              rgCycle.ItemIndex:=4;
//              ShowActTime(EvAct);
//              ShowDelayValue(Delay,reDelay,cbDelUnit);
//              ShowDelay(Delay>0);
//              end;
        ttLogon : begin
            if length(LogonUserId)>0 then begin
              rgCycle.ItemIndex:=4;
              laEvent.Caption:='On logon of:';
              ShowActTime(EvAct);
              ShowDelayValue(Delay,udDelay,cbDelUnit);
              ShowDelay(Delay>0);
              with laUser do begin
                Caption:=LogonUserId; Visible:=true;
                if length(Caption)=0 then Caption:=edUser.Text;
                end;
              end
            else ok:=false;
            end;
        ttEvent : begin
            if AnsiSameText(Subscription,WakeUpTrigger) then begin
              rgCycle.ItemIndex:=5;
              laEvent.Caption:='On waking up the computer:';
              ShowActTime(EvAct);
              ShowActTime(cbActivate.Checked);
              ShowDelayValue(Delay,udDelay,cbDelUnit);
              ShowDelay(Delay>0);
              end
            else ok:=false;
            end;
        else ok:=false; // unsupported trigger
          end;
        end;
      end
    else begin
      ResetSchedule(Now);
      rgCycle.ItemIndex:=0;
      FTrgType:=ttDaily;
      end;
    end;
  if not ok then begin
    MessageDlg(Format('The trigger mode "%s" is not supported.'+sLineBreak
      +'Please use the Windows Task Scheduler for editing!',[st]),mtError,[mbOK],0);
    Result:=false; Exit;
    end;
  Result:=ShowModal=mrOK;
  if Result then begin
    AUsername:=edUser.Text;
    APassword:=edPwd.Text;
    with ASchedTask do begin
      UserId:=AUsername;
      Description:=leDesc.Text;
      if rbLoggedUser.Checked then LogonType:=ltToken else LogonType:=ltPassword;
      RunIfMissed:=AdvSet.ReRun;
      with FTaskAction do begin
        WorkingDirectory:=MakeQuotedStr(edWorkDir.Text,[' ',',']);
        ApplicationPath:=edProg.Text;
        Arguments:=edOptions.Text;
        end;
      case rgCycle.ItemIndex of
      0 : NewTrgType:=ttDaily;  // täglich
      1 : NewTrgType:=ttWeekly; // wöchentlich
      2 : if rbDayOfMonth.Checked then NewTrgType:=ttMonthly // monatlich
          else NewTrgType:=ttMonthlyDow;
      3 : NewTrgType:=ttTime;    // ein Mal
//        4 : NewTrgType:=ttBoot;    // beim Start
      4 : NewTrgType:=ttLogon    // beim Anmelden
      else NewTrgType:=ttEvent;  // on wake-up
        end;
      if (TrgNr>=0) then begin
        if (FTrgType<>NewTrgType) then begin
          if not DeleteTrigger(TrgNr) then begin
            MessageDlg(Format('Could not delete trigger (%u)'+sLineBreak+'Task: ',[TrgNr,FTaskName]),mtError,[mbOK],0);
            end
          else FTrigger:=NewTrigger(NewTrgType);
          end;
        end
      else FTrigger:=NewTrigger(NewTrgType);
      with FTrigger do begin
        Enabled:=cbEnabled.Checked;
        with AdvSet do begin
          if UseEndDate then begin
            if EndTime<=StartTime then EndTime:=StartTime+OneMinute else EndTime:=EndDate
            end
          else EndTime:=0;
          if RepeatTask then begin
            Duration:=MinutesDuration*60; Interval:=MinutesInterval*60;
            if Duration<=Interval then Duration:=Interval+1;
            end
          else begin
            Duration:=0; Interval:=0;
            end;
          if UseLimit then ExecutionTimeLimit:=MinutesLimit*60
          else ExecutionTimeLimit:=0;
          end;
        case NewTrgType of
        ttDaily : begin  // täglich
            if rbEveryDay.Checked then DaysInterval:=1
            else DaysInterval:=udDays.Position;
            bt:=tpStartDaily.Time;
            bd:=dpStartDaily.Date;
            end;
        ttWeekly : begin  // wöchentlich
            WeeksInterval:=udWeeks.Position;
            if cbMonday.Checked then dow:=BitMask[2] else dow:=0;
            if cbTuesday.Checked then dow:=dow or BitMask[3];
            if cbWednesday.Checked then dow:=dow or BitMask[4];
            if cbThursday.Checked then dow:=dow or BitMask[5];
            if cbFriday.Checked then dow:=dow or BitMask[6];
            if cbSaturday.Checked then dow:=dow or BitMask[7];
            if cbSunday.Checked then dow:=dow or BitMask[1];
            if dow=0 then dow:=BitMask[2];
            DaysOfWeek:=dow;
            bt:=tpStartWeekly.Time;
            bd:=dpStartWeekly.Date;
            end;
        ttMonthly: begin
            dow:=ccMonthDays.Selected;
            if dow=0 then dow:=1;
            DaysOfMonth:=dow;
            MonthsOfYear:=GetMonths;
            bt:=tpStartMonthly.Time;
            bd:=dpStartMonthly.Date;
            end;
        ttMonthlyDow : begin
            dow:=ccMonthStart.Selected;
            if dow=0 then dow:=2;
            WeeksOfMonth:=dow;
            dow:=IsoToWeekDays(ccWeekDays.Selected);
            if dow=0 then dow:=1;
            DaysOfWeek:=dow;
            MonthsOfYear:=GetMonths;
            bt:=tpStartMonthly.Time;
            bd:=dpStartMonthly.Date;
            end;
        ttTime: begin  // ein Mal, beim Start oder beim Anmelden
            bt:=tpOneTime.Time;
            bd:=dpOneTime.Date;
            RandomDelay:=GetDelayValue(cbRandom.Checked,udRandom,cbRndUnit)
            end;
        else begin     // ttEvent,ttLogon,ttBoot
            if NewTrgType=ttEvent then Subscription:=WakeUpTrigger
            else if NewTrgType=ttLogon then LogonUserId:=laUser.Caption;
            if cbActivate.Checked then begin
              bt:=tpEventTime.Time;
              bd:=dpEventTime.Date;
              end
            else begin
              bt:=0; bd:=0;
              end;
            Delay:=GetDelayValue(cbDelay.Checked,udDelay,cbDelUnit)
            end;
          end;
        StartTime:=DateOf(bd)+round(MinsPerDay*TimeOf(bt))/MinsPerDay;  // Sekunden = 0
        end;
      Priority:=TThreadPriority(rgPriority.ItemIndex);
      end;
    end
  end;

end.
