### Delphi interface to Windows Task Scheduler 2.0

Since Windows Vista a new version of the Task Scheduler is implemented. In 
addition to the features of the former version some new options are available, 
like running a task after a scheduled start was missed or the use of user 
accounts without passwords. The *Windows API* provides several new functions to 
integrate the Task Scheduler with user programs. To make this easier to the 
Delphi programmer, I developed several units which encapsulate the functions 
the *Windows Task Scheduler 2.0* into Delphi objects. To demonstrate the 
integration of these objects into own code, a sample program (new in January 2022) 
is included to the package.

**Note:** The implementation is not complete. But all functions to create and edit time schedules for user applications are available.

- Unit **TaskSchedApi.pas** - Delphi interface to Windows Task Scheduler 2.0 (taskschd.dll)
- Unit **WinTask.pas** - Delphi objects to use Windows Task Scheduler 2.0 in own programs
- Unit **WinTaskConsts.pas** - language resources for WinTask.pas (English und German)
- Program **TaskSchedTest.dpr** - Sample program (new enhanced version)

[Executable demo](https://github.com/jrathlev/Delphi-WinTaskSched/tree/master/demo)
