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

  a.self[0] := '大鳥';
  a.self[1] := '小菜';
  a.self[2] := '行李';
  a.self[3] := '老外';
  a.self[4] := '巴士內部員工';
  a.self[5] := '小偷';

  i := TConcreteIterator.Create(a);
  //i := TConcreteIteratorDesc.Create(a);
  while not (i.IsDone) do
  begin
    writeln(format('%s 請買車票!', [i.CurrentItem]));
    i.Next;
  end;

  a.Free;

  readln;
  // Insert user code here
end.
