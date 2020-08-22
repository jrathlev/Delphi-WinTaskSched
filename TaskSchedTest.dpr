program TaskSchedTest;

uses
  Vcl.Forms,
  TaskMain in 'TaskMain.pas' {MainForm},
  TaskSchedDlg in 'TaskSchedDlg.pas' {TaskScheduleDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTaskScheduleDialog, TaskScheduleDialog);
  Application.Run;
end.
