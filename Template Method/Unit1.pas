unit Unit1;

interface

uses
SysUtils;

type
  TTestPaper = class
  protected
    function Answer1: string; Virtual; Abstract;
    function Answer2: string; Virtual; Abstract;
  published
    procedure TestQuestion1;
    procedure TestQuestion2;
  end;

  TTestPaperA = class(TTestPaper)
  protected
    function Answer1:string; override;
    function Answer2:string; override;
  end;

  TTestPaperB = class(TTestPaper)
  protected
    function Answer1: string; override;
    function Answer2: string; override;
  end;

implementation

{ TTestPaper }

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

function TTestPaperA.Answer1: string;
begin
  Result := 'A'
end;

function TTestPaperA.Answer2: string;
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
 