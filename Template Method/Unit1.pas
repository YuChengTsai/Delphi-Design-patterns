unit Unit1;

interface

uses
  SysUtils;

type
TTestPaper = class
public
  procedure TestQuestion1;
  procedure TestQuestion2;
protected
  function Answer1():string; virtual;
  function Answer2():string; virtual;
end;

TTestPaperA = class(TTestPaper)
protected
  function Answer1():string;
  function Answer2():string;
end;


TTestPaperB = class(TTestPaper)
protected
  function Answer1():string;
  function Answer2():string;
end;


implementation

{ TTestPaper }
function TTestPaper.Answer1: string;
begin

end;

function TTestPaper.Answer2: string;
begin

end;

procedure TTestPaper.TestQuestion1;
begin
  writeln('Register early if you would like to attend next Tuesday¡¦s ------- on project management.');
  writeln('(A) seminar');
  writeln('(B) reason');
  writeln('(C) policy');
  writeln('(D) scene');
  writeln('µª®×: ' + Answer1);
end;

procedure TTestPaper.TestQuestion2;
begin
  writeln('Paul Brown resigned last Monday from his position as ------- executive of the company. ');
  writeln('(A) fine ');
  writeln('(B) chief ');
  writeln('(C) front ');
  writeln('(D) large');
  writeln('µª®×: ' + Answer2);
end;

{ TTestPaperA }

function TTestPaperA.Answer1(): string;
begin
  Result := 'A'
end;

function TTestPaperA.Answer2(): string;
begin
  Result := 'B'
end;

{ TTestPaperB }

function TTestPaperB.Answer1: string;
begin
  Result := 'B'
end;

function TTestPaperB.Answer2: string;
begin
  Result := 'B'
end;

end.
 