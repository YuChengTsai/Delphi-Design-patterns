program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
lixiaoyao: TGameRole;
stateAdmin: TRoleStateCaretaker;
begin
  lixiaoyao := TGameRole.Create;
  lixiaoyao.GetInitState;
  lixiaoyao.StateDisplay;

  stateAdmin := TRoleStateCaretaker.Create;
  stateAdmin.memento := lixiaoyao.SaveState;

  lixiaoyao.Fight;
  lixiaoyao.StateDisplay;

  lixiaoyao.RecoveryState(stateAdmin.memento);
  lixiaoyao.StateDisplay;

  readln;
  // Insert user code here
end.