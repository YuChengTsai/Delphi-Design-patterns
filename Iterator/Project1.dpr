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

  a.self[0] := '�j��';
  a.self[1] := '�p��';
  a.self[2] := '���';
  a.self[3] := '�ѥ~';
  a.self[4] := '�ڤh�������u';
  a.self[5] := '�p��';

  i := TConcreteIterator.Create(a);
  //i := TConcreteIteratorDesc.Create(a);
  while not (i.IsDone) do
  begin
    writeln(format('%s �жR����!', [i.CurrentItem]));
    i.Next;
  end;

  a.Free;

  readln;
  // Insert user code here
end.
