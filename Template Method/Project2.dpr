program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  StudentA : TTestPaperA;
  StudentB : TTestPaperB;
begin
  StudentA := TTestPaperA.Create;
  StudentB := TTestPaperB.Create;

  writeln('StudentA"s test : ');
  StudentA.TestQuestion1;
  StudentA.TestQuestion2;

  writeln;

  writeln('StudentB"s test : ');
  StudentB.TestQuestion1;
  StudentB.TestQuestion2;

  readln;
  // Insert user code here
end.