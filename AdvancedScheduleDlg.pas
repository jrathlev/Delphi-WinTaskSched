(* Advanced settings for scheduled task - Demo
   ===========================================

   © J. Rathlev, D.24222 Schwentinental (kontakt(a)rathlev-home.de))

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
   
   Vers. 1 - Nov. 2013
   last updated: March 2023
*)

unit AdvancedScheduleDlg;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TAdvancedSettings = record
    UseEndDate,
    RepeatTask,
    StopEndDuration,
    UseLimit,
    ReRun      : boolean;
    EndDate    : TDateTime;
    MinutesLimit,
    MinutesInterval,
    MinutesDuration   : integer;    // in minutes
    end;

  TAdvancedScheduleDialog = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    cbExpire: TCheckBox;
    dpExpire: TDateTimePicker;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbLimit: TCheckBox;
    cbRepUnit: TComboBox;
    paRepeat: TPanel;
    paEnd: TPanel;
    cbRepeat: TCheckBox;
    paRepHeader: TPanel;
    cbLimitUnit: TComboBox;
    paLimit: TPanel;
    paReRun: TPanel;
    cbReRun: TCheckBox;
    dtExpire: TDateTimePicker;
    edInterval: TEdit;
    udInterval: TUpDown;
    edHours: TEdit;
    udHours: TUpDown;
    edMinutes: TEdit;
    udMinutes: TUpDown;
    udLimit: TUpDown;
    edLimit: TEdit;
    cbDuration: TCheckBox;
    paDuration: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cbExpireClick(Sender: TObject);
    procedure cbRepUnitCloseUp(Sender: TObject);
    procedure cbRepeatClick(Sender: TObject);
    procedure cbLimitClick(Sender: TObject);
    procedure cbLimitUnitCloseUp(Sender: TObject);
  private
    { Private declarations }
    LastExpUnit : integer;
    procedure ShowRepeat (ARepeat,ADuration : boolean);
    procedure ShowLimit (AShow : boolean);
  public
    { Public declarations }
    function Execute (var AdvSet : TAdvancedSettings) : boolean;
  end;

function AdvancedSettingsDialog (var AdvSet : TAdvancedSettings) : boolean;

var
  AdvancedScheduleDialog: TAdvancedScheduleDialog;

{ ---------------------------------------------------------------- }
implementation

{$R *.DFM}

uses System.DateUtils;

{ ---------------------------------------------------------------- }
procedure TAdvancedScheduleDialog.FormCreate(Sender: TObject);
begin
  dpExpire.Date:=Date;
  dtExpire.Time:=0.5;
  cbRepUnit.ItemIndex:=0;
  end;

{ ---------------------------------------------------------------- }
procedure TAdvancedScheduleDialog.ShowRepeat (ARepeat,ADuration : boolean);
var
  i : integer;
begin
  with paRepeat do for i:=0 to ControlCount-1 do Controls[i].Enabled:=ARepeat;
  if ARepeat then begin
    cbDuration.Checked:=ADuration;
    with paDuration do for i:=0 to ControlCount-1 do Controls[i].Enabled:=ADuration;
    end;
  end;

procedure TAdvancedScheduleDialog.ShowLimit (AShow : boolean);
var
  i : integer;
begin
  with paLimit do for i:=0 to ControlCount-1 do if not (Controls[i] is TCheckBox) then
    Controls[i].Enabled:=AShow;
  end;

procedure TAdvancedScheduleDialog.cbExpireClick(Sender: TObject);
begin
  dpExpire.Enabled:=cbExpire.Checked;
  dtExpire.Enabled:=cbExpire.Checked;
  end;

procedure TAdvancedScheduleDialog.cbLimitClick(Sender: TObject);
begin
  ShowLimit(cbLimit.Checked);
  end;

procedure TAdvancedScheduleDialog.cbRepeatClick(Sender: TObject);
begin
  ShowRepeat(cbRepeat.Checked,cbDuration.Checked);
  end;

procedure TAdvancedScheduleDialog.cbRepUnitCloseUp(Sender: TObject);
begin
  with udInterval do if cbRepUnit.ItemIndex=0 then begin   // hours
    Max:=167; Position:=1;
    udInterval.Increment:=1;
    udHours.Position:=24; udMinutes.Position:=0;
    end
  else begin                                // minutes
    Max:=1439; Position:=30;
    udInterval.Increment:=10;
    udHours.Position:=6; udMinutes.Position:=0;
    end;
  end;

procedure TAdvancedScheduleDialog.cbLimitUnitCloseUp(Sender: TObject);
begin
  with udLimit do if cbLimitUnit.ItemIndex=0 then begin   // days
    Max:=10*365; Position:=3;
    udInterval.Increment:=1;
    end
  else if cbLimitUnit.ItemIndex=1 then begin   // hours
    Max:=167; Position:=6;
    udInterval.Increment:=1;
    end
  else begin                                 // minutes
    Max:=1439; Position:=30;
    udInterval.Increment:=10;
    end;
  end;

function TAdvancedScheduleDialog.Execute (var AdvSet : TAdvancedSettings) : boolean;
begin
  with AdvSet do begin
    cbExpire.Checked:=UseEndDate;
    dpExpire.Enabled:=UseEndDate;
    dtExpire.Enabled:=UseEndDate;
    if UseEndDate then begin
      dpExpire.Date:=DateOf(EndDate); dtExpire.Time:=TimeOf(EndDate);
      end
    else begin
      dpExpire.Date:=Date+DaysInAYear(YearOf(Now));dtExpire.Time:=0.5;
      end;
    cbRepeat.Checked:=RepeatTask;
    ShowRepeat(RepeatTask,StopEndDuration);
    if MinutesInterval mod 60 =0 then begin
      cbRepUnit.ItemIndex:=0;
      with udInterval do begin       // hours
        Max:=167;  // 1 week
        Position:=MinutesInterval div 60;
        end;
      end
    else begin
      cbRepUnit.ItemIndex:=1;
      with udInterval do begin       // minutes
        Max:=1439;
        Position:=MinutesInterval;
        end;
      end;
    udHours.Position:=MinutesDuration div 60;
    udMinutes.Position:=MinutesDuration mod 60;
    cbLimit.Checked:=UseLimit;
    cbReRun.Checked:=ReRun;
    ShowLimit(UseLimit);
    if (MinutesLimit mod 1440 =0) or (MinutesLimit>=10080) then begin
      cbLimitUnit.ItemIndex:=0;   // days
      with udLimit do begin
        Max:=365;
        Position:=MinutesLimit div 1440;
        end;
      end
    else if (MinutesLimit mod 60 =0) or (MinutesLimit>=1440) then begin
      cbLimitUnit.ItemIndex:=1;   // hours
      with udLimit do begin
        Max:=167;
        Position:=MinutesLimit div 60;
        end;
      end
    else begin
      cbLimitUnit.ItemIndex:=2;   // minutes
      with udLimit do begin
        Max:=1439;
        Position:=MinutesLimit;
        end;
      end;
    end;
  Result:=ShowModal=mrOK;
  if Result then with AdvSet do begin
    UseEndDate:=cbExpire.Checked;
    if UseEndDate then EndDate:=DateOf(dpExpire.Date)+int(MinsPerDay*TimeOf(dtExpire.Date))/MinsPerDay;;
    if cbRepUnit.ItemIndex=0 then MinutesInterval:=udInterval.Position*60
    else MinutesInterval:=udInterval.Position;
    RepeatTask:=cbRepeat.Checked;
    StopEndDuration:=cbDuration.Checked;
    if not StopEndDuration then MinutesDuration:=0
    else begin
      MinutesDuration:=60*udHours.Position+udMinutes.Position;
      if (MinutesInterval>=MinutesDuration) then MinutesDuration:=MinutesInterval+1;
      end;
    if cbLimitUnit.ItemIndex=0 then MinutesLimit:=udLimit.Position*1440
    else if cbLimitUnit.ItemIndex=1 then MinutesLimit:=udLimit.Position*60
    else MinutesLimit:=udLimit.Position;
    UseLimit:=cbLimit.Checked;
    ReRun:=cbReRun.Checked;
    end;
  end;

function AdvancedSettingsDialog (var AdvSet : TAdvancedSettings) : boolean;
begin
  if not assigned(AdvancedScheduleDialog) then begin
    AdvancedScheduleDialog:=TAdvancedScheduleDialog.Create(Application);
    end;
  Result:=AdvancedScheduleDialog.Execute(AdvSet);
  FreeAndNil(AdvancedScheduleDialog);
  end;

end.
