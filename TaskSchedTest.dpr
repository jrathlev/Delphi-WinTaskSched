program TaskSchedTest;

uses
  Vcl.Forms,
  TaskMain in 'TaskMain.pas' {MainForm},
  TaskSchedDlg in 'TaskSchedDlg.pas' {TaskScheduleDialog},
  SelectListItemDlg in 'SelectListItemDlg.pas' {SelectListItemDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTaskScheduleDialog, TaskScheduleDialog);
  Application.CreateForm(TSelectListItemDialog, SelectListItemDialog);
  Application.Run;
end.
