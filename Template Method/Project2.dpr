program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  studentA, studentB: TTestPaper;
begin
  studentA := TTestPaper.Create;
  studentB := TTestPaper.Create;

  writeln('StudentA的試卷');
  studentA.TestQuestion1(Answer1);
  studentA.TestQuestion2(Answer2);
  studentA.TestQuestion3(Answer3);

  writeln('StudentB的試卷');
  studentB.TestQuestion1;
  studentB.TestQuestion2;
  studentB.TestQuestion3;

  readln;

  // Insert user code here
end.