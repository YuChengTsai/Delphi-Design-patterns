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

  a[0] := '大鳥';
  a[1] := '小菜';
  a[2] := '行李';
  a[3] := '老外';
  a[4] := '巴士內部員工';
  a[5] := '小偷';

  i := TConcreteIterator.Create(a);
    while (i.IsDone) do
    begin
    writeln(format('%s 請買車票!', [i.CurremtItem]));
    end;

  readln;
  // Insert user code here
end.