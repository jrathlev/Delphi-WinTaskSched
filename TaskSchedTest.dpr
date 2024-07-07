program TaskSchedTest;

uses
  Vcl.Forms,
  TaskMain in 'TaskMain.pas' {MainForm},
  TaskSchedDlg in 'TaskSchedDlg.pas' {TaskScheduleDialog},
  SelectListItemDlg in 'SelectListItemDlg.pas' {SelectListItemDialog},
  MemoDlg in 'MemoDlg.pas' {MemoDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTaskScheduleDialog, TaskScheduleDialog);
  Application.CreateForm(TSelectListItemDialog, SelectListItemDialog);
  Application.CreateForm(TMemoDialog, MemoDialog);
  Application.Run;
end.
