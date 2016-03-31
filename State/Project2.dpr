program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  emergencyProjects: TWork;
begin
  emergencyProjects := Twork.Create;

  emergencyProjects.Hour := 9;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 10;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 12;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 13;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 14;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 17;

  //emergencyProjects.TaskFinished := true;
  emergencyProjects.TaskGetOut := true;

  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 20;
  emergencyProjects.WriteProgram;

  emergencyProjects.Hour := 22;
  emergencyProjects.WriteProgram;

  readln;

  // Insert user code here
end.