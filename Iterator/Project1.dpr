program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  a: TconcreteAggregate;
  i: IIterator;
begin
  a := TConcreteAggregate.Create;

  a[0] := '�j��';
  a[1] := '�p��';
  a[2] := '���';
  a[3] := '�ѥ~';
  a[4] := '�ڤh�������u';
  a[5] := '�p��';

  i := TConcreteIterator.Create(a);
    while (i.IsDone) do
    begin
    writeln(format('%s �жR����!', [i.CurremtItem]));
    end;

  readln;
  // Insert user code here
end.